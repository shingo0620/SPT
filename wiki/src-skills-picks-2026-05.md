---
title: skills.sh Picks 月報 — 2026-05
type: source
sources: [skills-picks-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-01
tags: [skills-sh, agent-skills, monthly-digest, no-new-pick]
---

# skills.sh Picks — 2026 年 5 月

> 每日自動收集 [skills.sh](https://skills.sh/picks) Pick of the Day，依日期新到舊排列。
>
> ⚠️ **延續校正狀態**：skills.sh 自 [[src-skills-picks-2026-04|2026-04-19]] 起停止發布新 Pick of the Day。本月所有 daily 抓取若仍顯示 ast-grep（最後一筆 04-18 的 pick），則 fetcher 會明確標記 `is_fresh_pick: false`，不再列入「本月精選」表格。安裝數變化（ast-grep 自身擴散）保留追蹤於下方。

## 本月精選

| 日期 | Skill 名稱 | 來源 | 安裝數 | 領域 | 一句話推薦 |
|------|-----------|------|--------|------|-----------|
| — | （本月尚無 fresh pick） | — | — | — | skills.sh `/picks` 頁面 04-19 起空白；若本月恢復發布，將追加於此 |

## ast-grep 安裝數追蹤（縱向）

延續 [[src-skill-ast-grep]] 自身擴散觀察——**安裝數變化是真實的**（fetcher 從 ast-grep 頁面即時擷取），但這不是 skills.sh 編輯選擇行為。

| 日期 | 安裝數 | 日增 | 備註 |
|------|--------|------|------|
| 2026-04-30 | 4,073 | — | 04 月底（[[src-skills-picks-2026-04]] 表格最新一筆） |
| 2026-05-01 | 4,173 | +100 | 跨月持續增長，日增約 +100 |

> **比較 [[src-skills-trending-2026-05]] 05-01 首日基線**：
> - ast-grep 4,173 安裝 → 排在 trending Top 10 之外（推測 #11+）
> - Top 10 入榜門檻：azure-diagnostics 6,290（#10）—— 仍有約 50% 距離
> - infsh-skills Top 4 都在 27.5k+，與 ast-grep 距離約 6.5×

## 處理慣例

- 若 raw 檔 `is_fresh_pick: true`（恢復發布），於本月報「本月精選」表格新增該日列
- 若 raw 檔 `is_fresh_pick: false`（fetcher fallback），僅在 ast-grep 安裝數追蹤表新增資料點，不視為新精選
- ⚠️ **教訓鏈接**——絕不重蹈 [[src-skills-picks-2026-04]] 04-19 至 04-30 連十二日「精選 ast-grep」的虛構紀錄；fetcher fallback 不該等於 skills.sh 編輯選擇

## 本月觀察

- **5 月首日 skills.sh 仍未恢復發布**——`/picks` 頁面從 04-19 起空白已超過 13 天，可能該頻道已實質停發或暫停
- **ast-grep 自身仍持續擴散**——日增約 100 install 維持穩定，說明該 skill 在 community 內仍有真實的有機需求
- **本月關注重點**：
  1. skills.sh 是否恢復發布 Pick of the Day（恢復則本表格將即時更新）
  2. trending 月報（[[src-skills-trending-2026-05]]）作為 organic 流行度的主要追蹤——picks 停發後，trending 接替成為 skills.sh 生態的核心信號
  3. ast-grep 是否能擠入 trending Top 10（目前差距 50%）
