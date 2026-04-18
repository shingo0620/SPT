#!/bin/bash
# 雙向同步 wiki/ ↔ Obsidian vault (iCloud)
# 用法：
#   sync-vault.sh push   — wiki/ → vault（ingest/commit 後）
#   sync-vault.sh pull   — vault → wiki/（開工前，拉 iOS 編輯）
#   sync-vault.sh status — 顯示差異，不執行同步
set -euo pipefail

REPO_DIR="/Users/shingowu/Work/private/SPT"
VAULT_DIR="/Users/shingowu/Library/Mobile Documents/iCloud~md~obsidian/Documents/SPT"
WIKI_DIR="${REPO_DIR}/wiki"

# rsync 排除清單
EXCLUDES=(
    '.obsidian/'          # Obsidian 設定（vault 獨有，不進 git）
    '.trash/'             # Obsidian 刪除的檔案
    '.DS_Store'           # macOS
    '*.canvas'            # Obsidian canvas 檔案
    '.smart-connections/' # Obsidian plugin 快取
    'conflict-files-*'    # iCloud 衝突檔案
    '* 2.md'              # iCloud 衝突副本（常見格式）
    '* 3.md'              # iCloud 衝突副本
)

build_excludes() {
    local args=()
    for pattern in "${EXCLUDES[@]}"; do
        args+=(--exclude="$pattern")
    done
    echo "${args[@]}"
}

# 顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

usage() {
    echo "用法: $0 {push|pull|status}"
    echo ""
    echo "  push   — 將 wiki/ 推送到 Obsidian vault（ingest/commit 後執行）"
    echo "  pull   — 從 Obsidian vault 拉回 wiki/（開工前執行，取得 iOS 編輯）"
    echo "  status — 顯示兩邊差異，不執行任何同步"
    exit 1
}

check_dirs() {
    if [[ ! -d "$WIKI_DIR" ]]; then
        echo -e "${RED}ERROR: wiki/ 不存在: ${WIKI_DIR}${NC}"
        exit 1
    fi
    if [[ ! -d "$VAULT_DIR" ]]; then
        echo -e "${RED}ERROR: vault 不存在: ${VAULT_DIR}${NC}"
        exit 1
    fi
}

do_push() {
    echo -e "${GREEN}[push] wiki/ → vault${NC}"
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done
    rsync -av --update --delete \
        "${excludes[@]}" \
        "${WIKI_DIR}/" "${VAULT_DIR}/"
    echo -e "${GREEN}[push] 完成${NC}"
}

do_pull() {
    echo -e "${YELLOW}[pull] vault → wiki/${NC}"
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done
    # pull 只拉 .md 檔案，避免 Obsidian 產生的非 wiki 檔案污染 repo
    rsync -av --update \
        "${excludes[@]}" \
        --include='*.md' --exclude='*' \
        "${VAULT_DIR}/" "${WIKI_DIR}/"
    echo -e "${YELLOW}[pull] 完成${NC}"
}

do_status() {
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done

    echo -e "${GREEN}=== wiki/ → vault（push 會同步的檔案）===${NC}"
    rsync -avn --update --delete \
        "${excludes[@]}" \
        "${WIKI_DIR}/" "${VAULT_DIR}/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"

    echo ""
    echo -e "${YELLOW}=== vault → wiki/（pull 會同步的檔案）===${NC}"
    rsync -avn --update \
        "${excludes[@]}" \
        --include='*.md' --exclude='*' \
        "${VAULT_DIR}/" "${WIKI_DIR}/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"
}

[[ $# -lt 1 ]] && usage
check_dirs

case "$1" in
    push)   do_push ;;
    pull)   do_pull ;;
    status) do_status ;;
    *)      usage ;;
esac
