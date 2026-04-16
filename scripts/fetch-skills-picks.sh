#!/bin/bash
# 每日擷取 skills.sh 精選 Skill 並存入 raw/
# 頁面使用 Next.js RSC 串流，skill 資料嵌在 self.__next_f.push 中
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/skills-picks-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

curl -sf "https://skills.sh/picks" -o "$TMPFILE" || { echo "ERROR: 無法取得 skills.sh/picks"; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import re, sys, json

htmlfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(htmlfile) as f:
    html = f.read()

# --- 1. 從 RSC payload 提取 picks 後設資料 ---
chunks = re.findall(r'self\.__next_f\.push\(\[1,"(.*?)"\]\)', html, re.DOTALL)

picks_chunk = None
for chunk in chunks:
    # 原始 chunk 中引號以 \" 形式存在
    if 'picks' not in chunk or 'blurb' not in chunk:
        continue
    picks_chunk = chunk.replace('\\"', '"').replace('\\\\', '\\').replace('\\n', '\n')
    break

if not picks_chunk:
    print("ERROR: 找不到 picks 資料")
    sys.exit(1)

# 提取每個 pick 的基本資訊
entries = list(re.finditer(
    r'"date":"([^"]+)","source":"([^"]+)","skill":"([^"]+)","blurb":"((?:[^"\\]|\\.)*)",'
    r'"detail":\{[^}]*?"installs":(\d+)',
    picks_chunk
))

if not entries:
    print("ERROR: 無法解析 picks 條目")
    sys.exit(1)

# --- 2. 從 RSC payload 提取各 skill 的完整內容 ---
# 定義 chunks 包含 skill YAML frontmatter（---\nname: ...）
skill_defs = {}  # skill_name -> definition text
skill_readmes = []  # [(skill_name_guess, readme_text)]

for chunk in chunks:
    text = chunk.replace('\\n', '\n').replace('\\"', '"').replace('\\\\', '\\')

    stripped = text.strip()

    # Skill 定義（YAML frontmatter: ---\nname: ...）
    if stripped.startswith('---') and '\nname:' in stripped[:200]:
        m = re.search(r'name:\s*(\S+)', stripped[:200])
        if m:
            skill_defs[m.group(1)] = stripped
            continue

    # README 內容（# Title 開頭，長度 > 1000）
    if stripped.startswith('# ') and len(stripped) > 1000:
        title_line = stripped.split('\n')[0]
        skill_readmes.append((title_line, stripped))

# --- 3. 只保留當天的 pick ---
today_pick = None
for e in entries:
    if e.group(1) == date:
        today_pick = {
            "date": e.group(1),
            "source": e.group(2),
            "skill": e.group(3),
            "blurb": e.group(4).replace('\\"', '"'),
            "installs": int(e.group(5)),
        }
        break

# 如果找不到當天的，取第一個（最新的）
if not today_pick:
    e = entries[0]
    today_pick = {
        "date": e.group(1),
        "source": e.group(2),
        "skill": e.group(3),
        "blurb": e.group(4).replace('\\"', '"'),
        "installs": int(e.group(5)),
    }

skill_name = today_pick["skill"]
source = today_pick["source"]

# 取得對應的定義和 README
definition = skill_defs.get(skill_name, "")
readme = ""
for title_line, content in skill_readmes:
    # 粗略匹配：README 標題包含 skill 名稱的關鍵字
    if skill_name.replace("-", " ").lower() in title_line.lower() or \
       skill_name.replace("-", "").lower() in title_line.lower().replace(" ", ""):
        readme = content
        break

# 如果沒匹配到，用第一個 README（picks 頁面第一個通常是今日精選）
if not readme and skill_readmes:
    readme = skill_readmes[0][1]

# --- 4. 產生輸出 ---
lines = []
lines.append("---")
lines.append(f'title: "skills.sh Pick of the Day — {today_pick["date"]}"')
lines.append(f'source: "https://skills.sh/picks"')
lines.append(f'author:')
lines.append(f'  - "skills.sh"')
lines.append(f'published: {today_pick["date"]}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "skills-sh"')
lines.append(f'  - "agent-skills"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f'# skills.sh Pick — {today_pick["date"]}')
lines.append("")
lines.append("## 今日精選")
lines.append("")
lines.append(f'- **Skill**：{skill_name}')
lines.append(f'- **來源**：{source}')
lines.append(f'- **GitHub**：https://github.com/{source}')
lines.append(f'- **頁面**：https://skills.sh/{source}/{skill_name}')
lines.append(f'- **安裝數**：{today_pick["installs"]:,}')
lines.append(f'- **安裝指令**：`npx skills add https://github.com/{source} --skill {skill_name}`')
lines.append(f'- **簡介**：{today_pick["blurb"]}')
lines.append("")

if definition:
    lines.append("## Skill 定義（YAML frontmatter + 完整內容）")
    lines.append("")
    lines.append("```yaml")
    lines.append(definition)
    lines.append("```")
    lines.append("")

if readme:
    lines.append("## Skill README")
    lines.append("")
    lines.append(readme)
    lines.append("")

# 附加：同期其他 picks（作為參考）
other_picks = [e for e in entries if e.group(3) != skill_name]
if other_picks:
    lines.append("## 近期其他精選")
    lines.append("")
    lines.append("| 日期 | Skill | 來源 | 安裝數 | 簡介 |")
    lines.append("|------|-------|------|--------|------|")
    for e in other_picks[:5]:
        blurb_short = e.group(4).replace('\\"', '"')[:60]
        lines.append(f'| {e.group(1)} | [{e.group(3)}](https://skills.sh/{e.group(2)}/{e.group(3)}) | {e.group(2)} | {int(e.group(5)):,} | {blurb_short}… |')
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（skill: {skill_name}, installs: {today_pick['installs']:,}）")
PYEOF
