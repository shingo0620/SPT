---
title: skills.sh Picks 月報 — 2026-05
type: source
sources: [skills-picks-2026-05-08.md, skills-picks-2026-05-07.md, skills-picks-2026-05-06.md, skills-picks-2026-05-05.md, skills-picks-2026-05-04.md, skills-picks-2026-05-03.md, skills-picks-2026-05-02.md, skills-picks-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-09
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
| 2026-05-01 | 4,173 | +100 | 跨月持續增長 |
| 2026-05-02 | 4,263 | +90 | 增速略減 |
| 2026-05-03 | 4,324 | +61 | 增速續減（疑似衰減） |
| 2026-05-04 | 4,430 | +106 | **反彈**——推翻「衰減平台」假設 |
| 2026-05-05 | 4,546 | +116 | 持續加速 |
| 2026-05-06 | 4,703 | +157 | 加速進一步——3 日 +12.4% |
| 2026-05-07 | 4,873 | +170 | **持續加速**——日增續創新高 |
| 2026-05-08 | 5,036 | +163 | **突破 5,000**——歷史里程碑（從 04-18 首次精選 2,941 起 +71%） |

**9 日累積增長**：+963（4,073 → 5,036），日均約 +107。

> **W18 預測校正**——[[週綜整-2026-W18]] 中曾預測「5/4 ast-grep 日增將跌至 ~50」並推論「skills.sh pick 效應結束」。**實際 5/4-5/8 五日數據（+106 / +116 / +157 / +170 / +163）完全推翻此假設**：5 日內持續加速並突破 5,000。校正觀察：
>
> - **不是衰減**：先前 100→90→61 的下降只是 3 日噪音
> - **5/4-5/8 五日加速軌跡**：日增 +106 / +116 / +157 / +170 / +163——不僅反彈且**進入更高基線**
> - **與 [[src-skills-trending-2026-05]] find-skills 軌跡反向對比**：
>   - find-skills 5/3-5/6 連 4 日加速 → 5/7 跌出榜外（5 日 hype curve 後段急轉）
>   - ast-grep 5/4-5/8 連 5 日加速 → 仍在加速中（穩定 organic 擴散，無突發 hype）
>   - 對比意義：**ast-grep 是「真實 organic 擴散」（非 hype），find-skills 可能是「統計重置 + 渠道推送」**
> - **可能機制**：(1) ast-grep 的 npm 生態擴散自然成長（2）GitHub Trending Skill 生態擴散外溢（3）以 4 月 18 日**唯一一次精選**為起點的長尾延續
> - **5/9 觀察點**：能否突破 5,200？日增能否維持 +150 以上？find-skills 是否回榜？

> **比較 [[src-skills-trending-2026-05]] 05-01 首日基線**：
> - ast-grep 4,173 安裝 → 排在 trending Top 10 之外（推測 #11+）
> - Top 10 入榜門檻：azure-diagnostics 6,290（#10）—— 仍有約 50% 距離
> - infsh-skills Top 4 都在 27.5k+，與 ast-grep 距離約 6.5×

## 處理慣例

- 若 raw 檔 `is_fresh_pick: true`（恢復發布），於本月報「本月精選」表格新增該日列
- 若 raw 檔 `is_fresh_pick: false`（fetcher fallback），僅在 ast-grep 安裝數追蹤表新增資料點，不視為新精選
- ⚠️ **教訓鏈接**——絕不重蹈 [[src-skills-picks-2026-04]] 04-19 至 04-30 連十二日「精選 ast-grep」的虛構紀錄；fetcher fallback 不該等於 skills.sh 編輯選擇

## 本月觀察

- **5 月前 6 日 skills.sh 仍未恢復發布**——`/picks` 頁面從 04-19 起空白已超過 18 天（5/6 為止），實質停發機率持續上升
- **ast-grep 衰減假設失效**——5/4-5/6 日增 106 → 116 → 157，與 5/1-5/3 的 100 → 90 → 61 形成 V 字反彈；先前的「自然擴散平台期」推論被自身數據推翻
- **本月關注重點**（5/6 更新）：
  1. skills.sh 是否恢復發布 Pick of the Day（恢復則本表格將即時更新）
  2. trending 月報（[[src-skills-trending-2026-05]]）作為 organic 流行度的主要追蹤——picks 停發後，trending 接替成為 skills.sh 生態的核心信號
  3. ast-grep 是否能擠入 trending Top 10——5/6 為 4,703，與 Top 10 microsoft-foundry 6,762 仍差 30%，但若維持日增 +150 則 W19 內可能進入榜
  4. **find-skills 5/3-5/6 從 11.7k → 18.6k 暴漲（+60%）**——可能解釋 ast-grep 重新加速的機制（skill discovery 渠道擴大）；待驗證
