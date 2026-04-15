#!/bin/bash
# 每日擷取 Reddit r/todayilearned Top 15 並存入 raw/
# 用法：./scripts/fetch-reddit-til.sh [日期 YYYY-MM-DD]

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/reddit-til-${DATE}.md"

# 避免重複擷取
if [[ -f "$OUTFILE" ]]; then
  echo "已存在：${OUTFILE}，跳過"
  exit 0
fi

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# 擷取 JSON
curl -sf \
  -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" \
  "https://www.reddit.com/r/todayilearned/top/.json?t=day&limit=15" \
  > "$TMPFILE"

if [[ ! -s "$TMPFILE" ]]; then
  echo "錯誤：無法擷取 Reddit 資料" >&2
  exit 1
fi

# 解析 JSON 並輸出 Markdown
python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys

tmpfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(tmpfile) as f:
    data = json.load(f)

posts = data["data"]["children"]

lines = []
lines.append("---")
lines.append(f'title: "Reddit r/todayilearned Top 15 — {date}"')
lines.append(f'source: "https://www.reddit.com/r/todayilearned/top/?t=day"')
lines.append(f'author:')
lines.append(f'  - "r/todayilearned"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "reddit"')
lines.append(f'  - "todayilearned"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# Reddit r/todayilearned — {date} 每日精選")
lines.append("")
lines.append(f"> 自動擷取自 Reddit r/todayilearned 當日 Top 15 貼文")
lines.append("")

for i, p in enumerate(posts, 1):
    d = p["data"]
    title = d["title"]
    score = d["score"]
    author = d["author"]
    num_comments = d["num_comments"]
    url = d["url"]
    permalink = "https://www.reddit.com" + d["permalink"]
    selftext = d.get("selftext", "").strip()

    lines.append(f"## {i}. {title}")
    lines.append("")
    lines.append(f"- 分數：{score:,} | 留言：{num_comments:,} | 作者：u/{author}")
    lines.append(f"- 來源：{url}")
    lines.append(f"- 討論：{permalink}")
    if selftext:
        # 截取前 300 字
        text = selftext[:300]
        if len(selftext) > 300:
            text += "..."
        lines.append(f"- 內文：{text}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（{len(posts)} 篇）")
PYEOF
