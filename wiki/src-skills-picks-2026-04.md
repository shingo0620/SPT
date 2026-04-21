---
title: skills.sh Picks 月報 — 2026-04
type: source
sources: [skills-picks-2026-04-16.md, skills-picks-2026-04-17.md, skills-picks-2026-04-18.md, skills-picks-2026-04-19.md, skills-picks-2026-04-20.md]
created: 2026-04-16
updated: 2026-04-20
tags: [skills-sh, agent-skills, monthly-digest]
---

# skills.sh Picks — 2026 年 4 月

> 每日自動收集 [skills.sh](https://skills.sh/picks) 精選 AI Agent Skill，由 LLM 深度分析製作方式、應用場景與工作流整合。日期依新到舊排列。

## 本月精選

| 日期 | Skill 名稱 | 來源 | 安裝數 | 領域 | 一句話推薦 |
|------|-----------|------|--------|------|-----------|
| 04-20 | [[src-skill-ast-grep\|ast-grep]] *(連三日)* | ast-grep/agent-skill | 3,023 | coding / code-search / refactoring | 同 04-18/19——skills.sh 連三日選同一 skill，安裝數再 +51（2,972→3,023） |
| 04-19 | [[src-skill-ast-grep\|ast-grep]] *(連兩日)* | ast-grep/agent-skill | 2,972 | coding / code-search / refactoring | 同 04-18——skills.sh 連兩日選同一 skill，安裝數 24 小時內 +31（2,941→2,972） |
| 04-18 | [[src-skill-ast-grep\|ast-grep]] | ast-grep/agent-skill | 2,941 | coding / code-search / refactoring | 如果你日常需要在大型 codebase 做結構化搜尋或 refactor，這個 skill 把「何時用、怎麼寫 AST rule」教給 agent |
| 04-17 | [[src-skill-3b1b-style-animation-skill\|3b1b-style-animation-skill]] | subinium/3b1b-style-animation-skill | 1 | education / visualization / math | 如果你每週做數學 / ML 教學影片，這個 skill 把 Manim 技術與 3Blue1Brown 教學哲學整合成可重用工作流 |
| 04-16 | [[src-skill-character-arc\|character-arc]] | jwynia/agent-skills | 248 | writing / fiction | 如果你用 AI 寫故事或設計遊戲劇情，這個 skill 是角色弧線的診斷工具 |

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
