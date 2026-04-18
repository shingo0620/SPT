#!/bin/bash
# 每日擷取 Reddit r/todayilearned Top 15 並存入 raw/
# 用法：./scripts/fetch-reddit-til.sh [日期 YYYY-MM-DD]
#
# 環境變數（可選；建議 GitHub Actions 設定）：
#   REDDIT_CLIENT_ID、REDDIT_CLIENT_SECRET — 使用 OAuth client_credentials
#   grant，避開 Reddit 對 datacenter IP 的匿名封鎖。未設定時走匿名模式
#  （本機可用、GH Actions 會被 403）。
#
# 建立 Reddit app：https://www.reddit.com/prefs/apps
#   type: script / redirect: http://localhost / 取 client id + secret

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/reddit-til-${DATE}.md"
UA="SPT-daily-digest/1.0 (by /u/shingo0620)"

# 避免重複擷取
if [[ -f "$OUTFILE" ]]; then
  echo "已存在：${OUTFILE}，跳過"
  exit 0
fi

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

if [[ -n "${REDDIT_CLIENT_ID:-}" && -n "${REDDIT_CLIENT_SECRET:-}" ]]; then
  TOKEN=$(curl -sf -X POST \
    -u "${REDDIT_CLIENT_ID}:${REDDIT_CLIENT_SECRET}" \
    -H "User-Agent: ${UA}" \
    -d "grant_type=client_credentials" \
    https://www.reddit.com/api/v1/access_token \
    | python3 -c "import sys,json; print(json.load(sys.stdin).get('access_token',''))")
  [[ -z "$TOKEN" ]] && { echo "錯誤：無法取得 Reddit OAuth token" >&2; exit 1; }
  curl -sf \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "User-Agent: ${UA}" \
    "https://oauth.reddit.com/r/todayilearned/top?t=day&limit=15" \
    > "$TMPFILE"
else
  curl -sf \
    -H "User-Agent: ${UA}" \
    "https://www.reddit.com/r/todayilearned/top/.json?t=day&limit=15" \
    > "$TMPFILE"
fi

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
