#!/bin/bash
# 本機每日擷取 Reddit 來源（由 launchd 觸發）
# 取代 GitHub Actions 中的 Reddit 步驟，因 Reddit 封 datacenter IP
#
# 安裝見 scripts/com.shingowu.spt.fetch-reddit.plist 頂端註解

set -uo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_DIR="${HOME}/Library/Logs/spt"
mkdir -p "$LOG_DIR"
LOG="${LOG_DIR}/fetch-reddit-$(date +%Y-%m-%d).log"

{
    echo "=== $(date) ==="
    cd "$PROJECT_DIR"

    bash scripts/fetch-reddit-til.sh || echo "til failed: $?"
    sleep 5
    bash scripts/fetch-reddit-eli5.sh || echo "eli5 failed: $?"

    # 順手推到 Obsidian vault（讓 iOS 端看得到）
    if [[ -x scripts/sync-vault.sh ]]; then
        bash scripts/sync-vault.sh push || echo "sync-vault push failed: $?"
    fi
} >> "$LOG" 2>&1
