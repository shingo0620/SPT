#!/bin/bash
# 雙向同步 wiki/ 與 raw/ ↔ Obsidian vault (iCloud)
# 用法：
#   sync-vault.sh push   — wiki/ + raw/ → vault（ingest/commit 後）
#   sync-vault.sh pull   — vault → wiki/ + raw/（開工前，拉 iOS 新增的來源/編輯）
#   sync-vault.sh status — 顯示差異，不執行同步
#
# 注意：
#   - wiki/ 使用 --delete：repo 為單一事實來源
#   - raw/  不使用 --delete：避免 push 前未 pull 時誤刪 Obsidian 剛新增的來源
set -euo pipefail

REPO_DIR="/Users/shingowu/Work/private/SPT"
VAULT_DIR="/Users/shingowu/Library/Mobile Documents/iCloud~md~obsidian/Documents/SPT"
WIKI_DIR="${REPO_DIR}/wiki"
RAW_DIR="${REPO_DIR}/raw"

# rsync 排除清單
# 注意：不排除 "* 2.md" / "* 3.md" 這類通用模式——容易誤殺合法檔名
# （如 raw/(96)...遊戲編劇做遊戲 2.md 是真實來源）。真正的 iCloud 衝突檔
# 同步過來後會顯示為 git untracked，使用者可手動清理。
EXCLUDES=(
    '.obsidian/'          # Obsidian 設定（vault 獨有，不進 git）
    '.trash/'             # Obsidian 刪除的檔案
    '.DS_Store'           # macOS
    '*.canvas'            # Obsidian canvas 檔案
    '.smart-connections/' # Obsidian plugin 快取
    'conflict-files-*'    # iCloud 衝突檔案目錄
    '*conflicted copy*'   # macOS iCloud 標準衝突副本命名
    'work/'               # vault 中的個人工作目錄（不進 git）
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
    echo "  push   — 將 wiki/ + raw/ 推送到 Obsidian vault（ingest/commit 後執行）"
    echo "  pull   — 從 Obsidian vault 拉回 wiki/ + raw/（開工前執行，取得 iOS 新增來源/編輯）"
    echo "  status — 顯示兩邊差異，不執行任何同步"
    exit 1
}

check_dirs() {
    if [[ ! -d "$WIKI_DIR" ]]; then
        echo -e "${RED}ERROR: wiki/ 不存在: ${WIKI_DIR}${NC}"
        exit 1
    fi
    if [[ ! -d "$RAW_DIR" ]]; then
        echo -e "${RED}ERROR: raw/ 不存在: ${RAW_DIR}${NC}"
        exit 1
    fi
    if [[ ! -d "$VAULT_DIR" ]]; then
        echo -e "${RED}ERROR: vault 不存在: ${VAULT_DIR}${NC}"
        exit 1
    fi
}

do_push() {
    echo -e "${GREEN}[push] wiki/ → vault/wiki/, raw/ → vault/raw/${NC}"
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done
    mkdir -p "${VAULT_DIR}/wiki" "${VAULT_DIR}/raw"
    rsync -av --update --delete \
        "${excludes[@]}" \
        "${WIKI_DIR}/" "${VAULT_DIR}/wiki/"
    rsync -av --update \
        "${excludes[@]}" \
        "${RAW_DIR}/" "${VAULT_DIR}/raw/"
    echo -e "${GREEN}[push] 完成${NC}"
}

do_pull() {
    echo -e "${YELLOW}[pull] vault/wiki/ → wiki/, vault/raw/ → raw/${NC}"
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done
    mkdir -p "${VAULT_DIR}/raw"
    # wiki/ pull 只拉 .md 檔案，避免 Obsidian 產生的非 wiki 檔案污染 repo
    rsync -av --update \
        "${excludes[@]}" \
        --include='*.md' --exclude='*' \
        "${VAULT_DIR}/wiki/" "${WIKI_DIR}/"
    # raw/ pull 保留所有來源類型（md、pdf、圖片、assets/ 子目錄）
    rsync -av --update \
        "${excludes[@]}" \
        "${VAULT_DIR}/raw/" "${RAW_DIR}/"
    echo -e "${YELLOW}[pull] 完成${NC}"
}

do_status() {
    local excludes=()
    for p in "${EXCLUDES[@]}"; do excludes+=(--exclude="$p"); done

    echo -e "${GREEN}=== wiki/ → vault/wiki/（push 會同步的檔案）===${NC}"
    rsync -avn --update --delete \
        "${excludes[@]}" \
        "${WIKI_DIR}/" "${VAULT_DIR}/wiki/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"

    echo ""
    echo -e "${GREEN}=== raw/ → vault/raw/（push 會同步的檔案）===${NC}"
    rsync -avn --update \
        "${excludes[@]}" \
        "${RAW_DIR}/" "${VAULT_DIR}/raw/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"

    echo ""
    echo -e "${YELLOW}=== vault/wiki/ → wiki/（pull 會同步的檔案）===${NC}"
    rsync -avn --update \
        "${excludes[@]}" \
        --include='*.md' --exclude='*' \
        "${VAULT_DIR}/wiki/" "${WIKI_DIR}/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"

    echo ""
    echo -e "${YELLOW}=== vault/raw/ → raw/（pull 會同步的檔案）===${NC}"
    rsync -avn --update \
        "${excludes[@]}" \
        "${VAULT_DIR}/raw/" "${RAW_DIR}/" 2>&1 | grep -v '^\(sending\|sent\|total\|building\)' || echo "(無差異)"
}

[[ $# -lt 1 ]] && usage
check_dirs

case "$1" in
    push)   do_push ;;
    pull)   do_pull ;;
    status) do_status ;;
    *)      usage ;;
esac
