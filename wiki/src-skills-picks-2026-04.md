---
title: skills.sh Picks 月報 — 2026-04
type: source
sources: [skills-picks-2026-04-16.md, skills-picks-2026-04-17.md, skills-picks-2026-04-18.md]
created: 2026-04-16
updated: 2026-04-18
tags: [skills-sh, agent-skills, monthly-digest]
---

# skills.sh Picks — 2026 年 4 月

> 每日自動收集 [skills.sh](https://skills.sh/picks) 精選 AI Agent Skill，由 LLM 深度分析製作方式、應用場景與工作流整合。日期依新到舊排列。

## 本月精選

| 日期 | Skill 名稱 | 來源 | 安裝數 | 領域 | 一句話推薦 |
|------|-----------|------|--------|------|-----------|
| 04-18 | [[src-skill-ast-grep\|ast-grep]] | ast-grep/agent-skill | 2,941 | coding / code-search / refactoring | 如果你日常需要在大型 codebase 做結構化搜尋或 refactor，這個 skill 把「何時用、怎麼寫 AST rule」教給 agent |
| 04-17 | [[src-skill-3b1b-style-animation-skill\|3b1b-style-animation-skill]] | subinium/3b1b-style-animation-skill | 1 | education / visualization / math | 如果你每週做數學 / ML 教學影片，這個 skill 把 Manim 技術與 3Blue1Brown 教學哲學整合成可重用工作流 |
| 04-16 | [[src-skill-character-arc\|character-arc]] | jwynia/agent-skills | 248 | writing / fiction | 如果你用 AI 寫故事或設計遊戲劇情，這個 skill 是角色弧線的診斷工具 |

## 本月觀察

**工具型 skill 遠勝領域型**：ast-grep 2,941、character-arc 248、3b1b 1——工具類 skill（日常可用）的採用率比領域專業型高出 1–3 個數量級。skills.sh 精選邏輯似乎刻意平衡呈現，但市場用腳投票的方向很清楚。

**製作方式三種風格**：
- **極簡派**（ast-grep）：無 metadata 區塊、workflow 步驟驅動
- **結構派**（character-arc）：豐富 metadata、多層 diagnostic protocol
- **內容派**（3b1b-skill）：強 core philosophy + 三層子目錄（templates/references/examples）

---

> **資料查核備註（2026-04-17）**：raw 檔的「Skill README」區塊內容錯置為 ast-grep（2026-04-18 的 pick），屬 fetch 腳本 bug——已依 frontmatter `published: 2026-04-17` 與「今日精選」欄位為準，確定 2026-04-17 的 pick 為 3b1b-style-animation-skill。
