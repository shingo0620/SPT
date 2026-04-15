#!/bin/bash
# 每日擷取 Hacker News Top 15 並存入 raw/
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/hn-top-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

# 取得 top story IDs
curl -sf "https://hacker-news.firebaseio.com/v0/topstories.json" > "$TMPDIR/ids.json"

# 取前 15 個 story 的詳細資料
python3 - "$TMPDIR" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys, urllib.request, concurrent.futures

tmpdir, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(f"{tmpdir}/ids.json") as f:
    ids = json.load(f)[:15]

def fetch_item(item_id):
    url = f"https://hacker-news.firebaseio.com/v0/item/{item_id}.json"
    with urllib.request.urlopen(url) as r:
        return json.loads(r.read())

with concurrent.futures.ThreadPoolExecutor(max_workers=5) as ex:
    stories = list(ex.map(fetch_item, ids))

lines = []
lines.append("---")
lines.append(f'title: "Hacker News Top 15 — {date}"')
lines.append(f'source: "https://news.ycombinator.com/"')
lines.append(f'author:')
lines.append(f'  - "Hacker News"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "hackernews"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# Hacker News Top 15 — {date}")
lines.append("")

for i, s in enumerate(stories, 1):
    title = s.get("title", "")
    url = s.get("url", f"https://news.ycombinator.com/item?id={s['id']}")
    score = s.get("score", 0)
    by = s.get("by", "")
    descendants = s.get("descendants", 0)
    hn_link = f"https://news.ycombinator.com/item?id={s['id']}"

    lines.append(f"## {i}. {title}")
    lines.append("")
    lines.append(f"- 分數：{score:,} | 留言：{descendants:,} | 作者：{by}")
    lines.append(f"- 來源：{url}")
    lines.append(f"- 討論：{hn_link}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（{len(stories)} 篇）")
PYEOF
