---
title: skills.sh Picks 月報 — 2026-04
type: source
sources: [skills-picks-2026-04-16.md, skills-picks-2026-04-17.md, skills-picks-2026-04-18.md, skills-picks-2026-04-19.md, skills-picks-2026-04-20.md, skills-picks-2026-04-21.md, skills-picks-2026-04-22.md, skills-picks-2026-04-23.md, skills-picks-2026-04-24.md]
created: 2026-04-16
updated: 2026-04-24
tags: [skills-sh, agent-skills, monthly-digest]
---

# skills.sh Picks — 2026 年 4 月

> 每日自動收集 [skills.sh](https://skills.sh/picks) 精選 AI Agent Skill，由 LLM 深度分析製作方式、應用場景與工作流整合。日期依新到舊排列。

## 本月精選

| 日期 | Skill 名稱 | 來源 | 安裝數 | 領域 | 一句話推薦 |
|------|-----------|------|--------|------|-----------|
| 04-24 | [[src-skill-ast-grep\|ast-grep]] *(連七日)* | ast-grep/agent-skill | **3,413** | coding / code-search / refactoring | 同 04-18/19/20/21/22/23——連七日精選，安裝數單日 **+186**（3,227→3,413）；**連兩日破穩態且加速**——從 +104 再跳至 +186，進入連鎖擴散階段；可能與 [[DeepSeek]] V4 發布（1M context）引發大 codebase 結構化搜尋需求相關 |
| 04-23 | [[src-skill-ast-grep\|ast-grep]] *(連六日)* | ast-grep/agent-skill | 3,227 | coding / code-search / refactoring | 同 04-18/19/20/21/22——連六日精選，安裝數單日 **+104**（3,123→3,227）；**穩態破局**——連四日 +49~+51（1.82 install/h）跳升至 +104（4.33 install/h），可能為外部曝光事件觸發擴散 |
| 04-22 | [[src-skill-ast-grep\|ast-grep]] *(連五日)* | ast-grep/agent-skill | 3,123 | coding / code-search / refactoring | 同 04-18/19/20/21——連五日精選，安裝數再 +51（3,072→3,123）；96h 累積 +182；實際連續超過預測下限（3,115–3,125） |
| 04-21 | [[src-skill-ast-grep\|ast-grep]] *(連四日)* | ast-grep/agent-skill | 3,072 | coding / code-search / refactoring | 同 04-18/19/20——skills.sh 連四日選同一 skill，安裝數再 +49（3,023→3,072）；72h 累積 +131 |
| 04-20 | [[src-skill-ast-grep\|ast-grep]] *(連三日)* | ast-grep/agent-skill | 3,023 | coding / code-search / refactoring | 同 04-18/19——skills.sh 連三日選同一 skill，安裝數再 +51（2,972→3,023） |
| 04-19 | [[src-skill-ast-grep\|ast-grep]] *(連兩日)* | ast-grep/agent-skill | 2,972 | coding / code-search / refactoring | 同 04-18——skills.sh 連兩日選同一 skill，安裝數 24 小時內 +31（2,941→2,972） |
| 04-18 | [[src-skill-ast-grep\|ast-grep]] | ast-grep/agent-skill | 2,941 | coding / code-search / refactoring | 如果你日常需要在大型 codebase 做結構化搜尋或 refactor，這個 skill 把「何時用、怎麼寫 AST rule」教給 agent |
| 04-17 | [[src-skill-3b1b-style-animation-skill\|3b1b-style-animation-skill]] | subinium/3b1b-style-animation-skill | 1 | education / visualization / math | 如果你每週做數學 / ML 教學影片，這個 skill 把 Manim 技術與 3Blue1Brown 教學哲學整合成可重用工作流 |
| 04-16 | [[src-skill-character-arc\|character-arc]] | jwynia/agent-skills | 248 | writing / fiction | 如果你用 AI 寫故事或設計遊戲劇情，這個 skill 是角色弧線的診斷工具 |

> **04-24 連七日精選 + 連鎖擴散階段**：ast-grep 連續七日被選——skills.sh 歷來最長紀錄再刷新至 7 日。處理策略不變：不新建 skill 頁，在 [[src-skill-ast-grep]] 累計追蹤。
> - 七日安裝走勢：2,941 → 2,972（+31）→ 3,023（+51）→ 3,072（+49）→ 3,123（+51）→ 3,227（**+104**）→ **3,413（+186）**
> - **連兩日破穩態且加速更快**：04-23 +104 是首次破局，04-24 +186 是加速擴散——不是回歸穩態 noise，而是進入連鎖擴散階段
> - 144h 累積 **+472 裝**、24h 滑動裝量達 **7.75 install/h**（連穩態的 4 倍以上）
> - **可能歸因**：04-24 為 AI 模型爆發日（GPT-5.5、DeepSeek V4、Codex 3.0 同日發布）——1M context、大 codebase、agent autopilot 等關鍵字提升了 **ast-grep「結構化大 codebase 搜尋」的需求密度**
> - **預測**：下日（04-25）若 +200 以上，確認為「AI 模型週邊工具」的連鎖擴散效應；若回落 +50~100，為單次事件反應
> - raw frontmatter title bug 仍延續（仍顯示 "2026-04-18"）——依 skill name + 安裝數增量判斷實質為 ast-grep 連續曝光

> **04-23 連六日精選 + 穩態破局**：ast-grep 連續六日被選——skills.sh 歷來最長紀錄再刷新。處理策略不變：不新建 skill 頁，在 [[src-skill-ast-grep]] 累計追蹤。
> - 六日安裝走勢：2,941 → 2,972（+31）→ 3,023（+51）→ 3,072（+49）→ 3,123（+51）→ 3,227（**+104**）
> - **穩態破局**：連四日 +49~+51（1.82 install/h）的「可預測轉化率」在 04-23 被打破——單日 +104 約為穩態的 **2 倍**
> - 120h 累積 +286 裝、六日整體轉化率 2.38 install/h——全線上升
> - **可能原因推論**（需下日驗證）：
>   1. ast-grep 官方 repo 04-22/23 有新版本 release，帶動裝量
>   2. skills.sh 外部露出事件（podcast、社群轉貼、電子報）
>   3. 平行 skills.sh 首頁 UI 改版，讓「連六日精選」獲得更高可見度
>   4. fetch 時間差造成累積計算偏差（若前日 fetch 在 UTC 14:00 抓到不到 24h 資料、今日 fetch 抓到超過 24h）
> - **raw 檔 frontmatter bug 延續**：skills-picks-2026-04-23.md 的 frontmatter title 仍為 "2026-04-18"（fetch 腳本 bug）——判斷依據：frontmatter 的 skill name 為 ast-grep、安裝數 3,227 相較 04-22 的 3,123 有 +104 增量，屬於同一 skill 持續曝光狀態

> **04-22 連五日精選**：ast-grep 連續五日被選——skills.sh 歷來最長紀錄。處理策略不變：不新建 skill 頁，在 [[src-skill-ast-grep]] 累計追蹤。
> - 五日安裝走勢：2,941 → 2,972（+31）→ 3,023（+51）→ 3,072（+49）→ 3,123（+51）
> - 穩態達 5 日：連續四日 +49~+51 的穩定流入（第一日 +31 為爬坡期）
> - 96h 累積 +182 裝、相當於 1.90 install/h——比 04-21 估算（1.82 install/h）還略升
> - 預測命中：04-22 估計 3,120±5、實際 3,123，完全落於預測區間上緣——顯示 skills.sh 延續曝光的轉化率已**有可預測性**
> - 觀察：連五日精選若屬「策展疲乏」的訊號，安裝數可能從 +51 衰減；若維持穩態則意味 ast-grep 已建立「skills.sh 生態的代表性工具」地位

> **04-21 連四日精選**：ast-grep 連續四日被選——本月之前最長延續紀錄。處理策略不變：不新建 skill 頁，在 [[src-skill-ast-grep]] 累計追蹤。
> - 四日安裝走勢：2,941 → 2,972（+31）→ 3,023（+51）→ 3,072（+49）
> - 漲幅曲線：**爬坡 → 加速 → 穩態**——第二日後每日維持 +49~+51 裝，與第一日 +31 形成「skills.sh 延續曝光的穩定轉化率」約 50/日
> - 72h 累積 +131 裝、相當於 1.82 install/h——是本月 skills.sh 四個精選中**唯一達到穩定流入**的 skill
> - 模式推論：如果第 5 日再延續，估計 04-22 安裝數約 3,120±5

> **04-20 連三日精選**：ast-grep 連續三日被選——前所未見。月報處理策略不變：不新建 skill 頁，在 [[src-skill-ast-grep]] 累計追蹤。安裝數三日走勢：2,941→2,972（+31）→3,023（+51）——第二日漲幅加速，顯示 skills.sh 持續曝光轉化率向上。累積 +82 install/48h，相當於 1.7 install/h 的穩定流入速度。

> **04-19 特殊情況**：skills.sh 連兩日選 ast-grep——不是 fetch 腳本 bug，而是官方「延續精選」。處理策略：不新建 skill 頁，在原 [[src-skill-ast-grep]] 頁追蹤安裝數變化、在本月報註記。下次若 skills.sh 再延續，累計追蹤即可。

## 本月觀察

**工具型 skill 遠勝領域型**：ast-grep 2,941→2,972（24h +31）、character-arc 248、3b1b 1——工具類 skill 的採用率比領域專業型高出 1–3 個數量級。skills.sh 精選邏輯刻意平衡呈現，但市場用腳投票的方向很清楚。

**製作方式三種風格**：
- **極簡派**（ast-grep）：無 metadata 區塊、workflow 步驟驅動
- **結構派**（character-arc）：豐富 metadata、多層 diagnostic protocol
- **內容派**（3b1b-skill）：強 core philosophy + 三層子目錄（templates/references/examples）

**連兩日精選的意義**：skills.sh 延續同一 skill 的頻率極低——本月首見。推測原因：
1. ast-grep 適逢大 codebase 搜尋/重構需求高峰
2. 前日安裝數 +31 顯示仍在爬坡，值得追加曝光
3. 相對於 04-17 僅 1 安裝的 niche 3b1b、04-19 延續 ast-grep 反映策展對「工具型 skill 滲透率」的優先考量

---

> **資料查核備註（2026-04-17）**：raw 檔的「Skill README」區塊內容錯置為 ast-grep（2026-04-18 的 pick），屬 fetch 腳本 bug——已依 frontmatter `published: 2026-04-17` 與「今日精選」欄位為準，確定 2026-04-17 的 pick 為 3b1b-style-animation-skill。
