#!/bin/bash
# 每日擷取 Wikipedia 精選文章並存入 raw/
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/wikipedia-featured-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

# 解析日期
YEAR=$(echo "$DATE" | cut -d- -f1)
MONTH=$(echo "$DATE" | cut -d- -f2)
DAY=$(echo "$DATE" | cut -d- -f3)

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# Wikimedia REST API - Featured Content
curl -sf \
  -H "User-Agent: SPT-Bot/1.0" \
  "https://en.wikipedia.org/api/rest_v1/feed/featured/${YEAR}/${MONTH}/${DAY}" \
  > "$TMPFILE"

[[ ! -s "$TMPFILE" ]] && { echo "錯誤：無法擷取 Wikipedia 資料" >&2; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys, re

tmpfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(tmpfile) as f:
    data = json.load(f)

lines = []
lines.append("---")
lines.append(f'title: "Wikipedia Featured — {date}"')
lines.append(f'source: "https://en.wikipedia.org/"')
lines.append(f'author:')
lines.append(f'  - "Wikipedia"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "wikipedia"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# Wikipedia Featured — {date}")
lines.append("")

# Today's Featured Article
tfa = data.get("tfa")
if tfa:
    title = tfa.get("normalizedtitle", tfa.get("title", ""))
    extract = tfa.get("extract", "")
    url = tfa.get("content_urls", {}).get("desktop", {}).get("page", "")
    lines.append(f"## 今日精選文章：{title}")
    lines.append("")
    lines.append(f"{extract}")
    lines.append("")
    if url:
        lines.append(f"- 連結：{url}")
    lines.append("")

# Most Read Articles
most_read = data.get("mostread", {}).get("articles", [])[:10]
if most_read:
    lines.append("## 今日最多人閱讀")
    lines.append("")
    lines.append("| # | 文章 | 瀏覽數 | 連結 |")
    lines.append("|---|------|--------|------|")
    for i, article in enumerate(most_read, 1):
        title = article.get("normalizedtitle", article.get("title", ""))
        views = article.get("views", 0)
        url = article.get("content_urls", {}).get("desktop", {}).get("page", "")
        title_escaped = title.replace("|", "\\|")
        lines.append(f"| {i} | {title_escaped} | {views:,} | [連結]({url}) |")
    lines.append("")

# On this day
otd = data.get("onthisday", [])[:5]
if otd:
    lines.append("## 歷史上的今天")
    lines.append("")
    for event in otd:
        year = event.get("year", "")
        text = event.get("text", "")
        lines.append(f"- **{year}**：{text}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

sections = []
if tfa: sections.append("精選文章")
if most_read: sections.append(f"{len(most_read)} 篇熱門")
if otd: sections.append(f"{len(otd)} 則歷史")
print(f"已儲存：{outfile}（{'、'.join(sections)}）")
PYEOF
