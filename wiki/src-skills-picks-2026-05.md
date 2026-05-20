---
title: skills.sh Picks 月報 — 2026-05
type: source
sources: [skills-picks-2026-05-12.md, skills-picks-2026-05-11.md, skills-picks-2026-05-10.md, skills-picks-2026-05-09.md, skills-picks-2026-05-08.md, skills-picks-2026-05-07.md, skills-picks-2026-05-06.md, skills-picks-2026-05-05.md, skills-picks-2026-05-04.md, skills-picks-2026-05-03.md, skills-picks-2026-05-02.md, skills-picks-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-19
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
| 2026-05-09 | 5,156 | +120 | 增速回落但仍維持 100+ |
| 2026-05-10 | 5,259 | +103 | **加速軌跡終結**——連 5 日加速後首次明顯減速 |
| 2026-05-11 | 5,332 | +73 | 增速續減（疑似進入新平台期） |
| 2026-05-12 | 5,414 | +82 | 增速微反彈但仍低於 100 |

**13 日累積增長**：+1,341（4,073 → 5,414），日均約 +103。

> ⚠️ **5/13 起 fetcher 失效**——skills-picks raw 自 2026-05-13 起未抓到（疑似 fetch-skills-picks.sh 或 skills.sh 端問題）。安裝數追蹤暫時中斷，待修復 fetcher 後補。

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

> **5/9-5/12 W19-W20 校正觀察**——5/9 +120 已預告減速、5/10 +103 確認加速軌跡終結、5/11 +73 跌破 100。**W19 持續加速假設失敗**——5/4-5/8 五日加速（+106 → +163）是峰值，5/9-5/12 進入新平台期（日均 +94）。對照 [[src-skills-trending-2026-05]]，find-skills 5/7-5/8 連續跌出榜外、5/9 後雖回 Top 10 但 install 增速放緩，與 ast-grep 的減速時機吻合——**證實「skill discovery 渠道擴大」是真實機制**（find-skills 退潮 → ast-grep 減速）。

> **比較 [[src-skills-trending-2026-05]] 05-01 首日基線**：
> - ast-grep 4,173 安裝 → 排在 trending Top 10 之外（推測 #11+）
> - Top 10 入榜門檻：azure-diagnostics 6,290（#10）—— 仍有約 50% 距離
> - infsh-skills Top 4 都在 27.5k+，與 ast-grep 距離約 6.5×

## 處理慣例

- 若 raw 檔 `is_fresh_pick: true`（恢復發布），於本月報「本月精選」表格新增該日列
- 若 raw 檔 `is_fresh_pick: false`（fetcher fallback），僅在 ast-grep 安裝數追蹤表新增資料點，不視為新精選
- ⚠️ **教訓鏈接**——絕不重蹈 [[src-skills-picks-2026-04]] 04-19 至 04-30 連十二日「精選 ast-grep」的虛構紀錄；fetcher fallback 不該等於 skills.sh 編輯選擇

## 本月觀察

- **5 月前 12 日 skills.sh 仍未恢復發布**——`/picks` 頁面從 04-19 起空白已超過 24 天（5/12 為止），實質停發已成事實
- **ast-grep 增速三階段**：5/1-5/3 衰減（100/90/61）→ 5/4-5/8 加速（+106 至 +170 峰值）→ 5/9-5/12 平台化（+120 → +73 → +82，日均 +94）
- **本月關注重點**（5/12 更新）：
  1. skills.sh 是否恢復發布 Pick of the Day（恢復則本表格將即時更新）
  2. trending 月報（[[src-skills-trending-2026-05]]）作為 organic 流行度的主要追蹤——picks 停發後，trending 接替成為 skills.sh 生態的核心信號
  3. ast-grep 是否能擠入 trending Top 10——5/12 為 5,414，與 5/8 Top 10 入榜門檻仍有距離；目前增速放緩可能延後進榜時程
  4. **fetcher 失效調查**——5/13 起 picks/trending 雙雙缺失，可能：(a) fetch-skills-picks.sh 在 skills.sh 改版後解析失敗、(b) skills.sh 服務端問題、(c) GitHub Actions runner 出狀況。需手動跑腳本驗證
