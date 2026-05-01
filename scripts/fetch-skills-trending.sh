#!/bin/bash
# 每日擷取 skills.sh Trending Top 10 並存入 raw/
# 頁面使用 Next.js RSC 串流，trending 資料嵌在 initialSkills array 中（按 installs 降序）
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/skills-trending-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

curl -sf "https://skills.sh/trending" -o "$TMPFILE" || { echo "ERROR: 無法取得 skills.sh/trending"; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import re, sys

htmlfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(htmlfile) as f:
    html = f.read()

chunks = re.findall(r'self\.__next_f\.push\(\[1,"(.*?)"\]\)', html, re.DOTALL)

# 找含 initialSkills 的 chunk
trending_chunk = None
for chunk in chunks:
    if 'initialSkills' not in chunk:
        continue
    trending_chunk = chunk.replace('\\"', '"').replace('\\\\', '\\').replace('\\n', '\n')
    break

if not trending_chunk:
    print("ERROR: 找不到 initialSkills 資料（頁面結構可能已變更）", file=sys.stderr)
    sys.exit(1)

# 解析 initialSkills 列表（按頁面順序，等同 installs 降序）
entries = list(re.finditer(
    r'\{"source":"([^"]+)","skillId":"([^"]+)","name":"([^"]+)","installs":(\d+)\}',
    trending_chunk
))

if not entries:
    print("ERROR: 無法解析 initialSkills 條目", file=sys.stderr)
    sys.exit(1)

top10 = entries[:10]

lines = []
lines.append("---")
lines.append(f'title: "skills.sh Trending Top 10 — {date}"')
lines.append(f'source: "https://skills.sh/trending"')
lines.append(f'author:')
lines.append(f'  - "skills.sh"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "skills-sh"')
lines.append(f'  - "agent-skills"')
lines.append(f'  - "trending"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f'# skills.sh Trending Top 10 — {date}')
lines.append("")
lines.append("> 自動擷取自 skills.sh /trending 頁面，按 installs 降序排列前 10 名")
lines.append("")
lines.append("| # | Skill | Source | Installs |")
lines.append("|---|-------|--------|----------|")
for i, e in enumerate(top10, 1):
    src, skill_id, name, installs = e.group(1), e.group(2), e.group(3), int(e.group(4))
    lines.append(f'| {i} | [{name}](https://skills.sh/{src}/{skill_id}) | {src} | {installs:,} |')
lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（Top 10 第一名 {top10[0].group(3)}：{int(top10[0].group(4)):,} installs）")
PYEOF
