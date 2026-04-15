#!/bin/bash
# 每日擷取 Product Hunt Top 15 並存入 raw/
# 需要設定環境變數 PH_TOKEN（Developer Token）
# 取得方式：https://www.producthunt.com/v2/oauth/applications → 建立應用 → Developer Token
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="${PROJECT_DIR}/raw"
DATE="${1:-$(date +%Y-%m-%d)}"
OUTFILE="${RAW_DIR}/producthunt-${DATE}.md"

[[ -f "$OUTFILE" ]] && { echo "已存在：${OUTFILE}，跳過"; exit 0; }

if [[ -z "${PH_TOKEN:-}" ]]; then
  echo "跳過：PH_TOKEN 未設定" >&2
  exit 0
fi

TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# Product Hunt GraphQL API
curl -sf \
  -X POST \
  -H "Authorization: Bearer ${PH_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"query\": \"{ posts(order: RANKING, postedAfter: \\\"${DATE}T00:00:00Z\\\", first: 15) { edges { node { name tagline votesCount commentsCount website url topics { edges { node { name } } } } } } }\"}" \
  "https://api.producthunt.com/v2/api/graphql" \
  > "$TMPFILE"

[[ ! -s "$TMPFILE" ]] && { echo "錯誤：無法擷取 Product Hunt 資料" >&2; exit 1; }

python3 - "$TMPFILE" "$DATE" "$OUTFILE" << 'PYEOF'
import json, sys

tmpfile, date, outfile = sys.argv[1], sys.argv[2], sys.argv[3]

with open(tmpfile) as f:
    data = json.load(f)

edges = data.get("data", {}).get("posts", {}).get("edges", [])

if not edges:
    print(f"警告：{date} 沒有 Product Hunt 資料，跳過")
    sys.exit(0)

lines = []
lines.append("---")
lines.append(f'title: "Product Hunt Top 15 — {date}"')
lines.append(f'source: "https://www.producthunt.com/"')
lines.append(f'author:')
lines.append(f'  - "Product Hunt"')
lines.append(f'published: {date}')
lines.append(f'created: {date}')
lines.append(f'tags:')
lines.append(f'  - "producthunt"')
lines.append(f'  - "daily-digest"')
lines.append("---")
lines.append("")
lines.append(f"# Product Hunt Top 15 — {date}")
lines.append("")

for i, edge in enumerate(edges, 1):
    node = edge["node"]
    name = node["name"]
    tagline = node["tagline"]
    votes = node["votesCount"]
    comments = node["commentsCount"]
    website = node.get("website") or ""
    ph_url = node["url"]
    topics = [t["node"]["name"] for t in node.get("topics", {}).get("edges", [])]

    lines.append(f"## {i}. {name}")
    lines.append("")
    lines.append(f"- {tagline}")
    lines.append(f"- 投票：{votes:,} | 留言：{comments:,}")
    if topics:
        lines.append(f"- 分類：{', '.join(topics[:3])}")
    if website:
        lines.append(f"- 網站：{website}")
    lines.append(f"- PH 頁面：{ph_url}")
    lines.append("")

with open(outfile, "w") as f:
    f.write("\n".join(lines))

print(f"已儲存：{outfile}（{len(edges)} 個產品）")
PYEOF
