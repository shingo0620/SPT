#!/bin/bash
# 每日擷取 GitHub Trending 前 15 並存入 raw/
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/github-trending-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# 用 GitHub Search API 找今日最多星的 repo
curl -sf \
  -H "Accept: application/vnd.github+json" \
  -H "User-Agent: SPT-Bot/1.0" \
  "https://api.github.com/search/repositories?q=created:${DATE}&sort=stars&order=desc&per_page=15" \
  > "$TMPFILE"

[[ ! -s "$TMPFILE" ]] && { echo "錯誤：無法擷取 GitHub 資料" >&2; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys

tmpfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(tmpfile) as f:
    data = json.load(f)

repos = data.get("items", [])[:15]

lines = []
lines.append("---")
lines.append(f'title: "GitHub Trending — {date}"')
lines.append(f'source: "https://github.com/trending"')
lines.append(f'author:')
lines.append(f'  - "GitHub"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "github"')
lines.append(f'  - "trending"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# GitHub Trending — {date}")
lines.append("")

for i, r in enumerate(repos, 1):
    name = r["full_name"]
    desc = r.get("description") or "(no description)"
    stars = r["stargazers_count"]
    lang = r.get("language") or "N/A"
    url = r["html_url"]
    topics = r.get("topics", [])

    lines.append(f"## {i}. {name}")
    lines.append("")
    lines.append(f"- {desc}")
    lines.append(f"- 星數：{stars:,} | 語言：{lang}")
    if topics:
        lines.append(f"- 標籤：{', '.join(topics[:5])}")
    lines.append(f"- 連結：{url}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（{len(repos)} 個 repo）")
PYEOF
