#!/bin/bash
# 每日擷取 Reddit r/explainlikeimfive Top 15 並存入 raw/
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/reddit-eli5-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

curl -sf \
  -H "User-Agent: Mozilla/5.0 (compatible; SPT-Bot/1.0)" \
  "https://www.reddit.com/r/explainlikeimfive/top/.json?t=day&limit=15" \
  > "$TMPFILE"

[[ ! -s "$TMPFILE" ]] && { echo "錯誤：無法擷取 Reddit 資料" >&2; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys

tmpfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(tmpfile) as f:
    data = json.load(f)

posts = data["data"]["children"]

lines = []
lines.append("---")
lines.append(f'title: "Reddit r/explainlikeimfive Top 15 — {date}"')
lines.append(f'source: "https://www.reddit.com/r/explainlikeimfive/top/?t=day"')
lines.append(f'author:')
lines.append(f'  - "r/explainlikeimfive"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "reddit"')
lines.append(f'  - "explainlikeimfive"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# Reddit r/explainlikeimfive — {date}")
lines.append("")

for i, p in enumerate(posts, 1):
    d = p["data"]
    title = d["title"]
    score = d["score"]
    author = d["author"]
    num_comments = d["num_comments"]
    permalink = "https://www.reddit.com" + d["permalink"]
    selftext = d.get("selftext", "").strip()

    lines.append(f"## {i}. {title}")
    lines.append("")
    lines.append(f"- 分數：{score:,} | 留言：{num_comments:,} | 作者：u/{author}")
    lines.append(f"- 討論：{permalink}")
    if selftext:
        text = selftext[:500]
        if len(selftext) > 500:
            text += "..."
        lines.append(f"- 內文：{text}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（{len(posts)} 篇）")
PYEOF
