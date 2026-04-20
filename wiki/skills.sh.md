---
title: skills.sh
type: entity
sources: []
created: 2026-04-20
updated: 2026-04-20
tags: [skills-sh, agent-skill, curation, platform]
---

# skills.sh

> 本頁統整本 wiki 5 處提及的 skills.sh 脈絡；來源為空表示為跨來源歸納。

## 一句話定位

**Agent Skill 的策展 / 分發平台**——每日從 GitHub 上挑選一個值得關注的 agent skill 作為「Pick of the Day」（今日精選），並追蹤每個 skill 的安裝數。域名 `skills.sh` 本身是 skill 取用指令 `npx skills add ...` 的簡稱呼應。

## 功能

- **每日精選**（skill picks）——編輯挑選出有代表性的 skill（不只是最新的）
- **頁面格式**：`skills.sh/{owner}/{repo}/{skill-name}` 呈現 skill README 與安裝指令
- **安裝數統計**——反映 skill 的市場採用度
- **支援平台**：Claude Code / OpenCode / codex / gemini-cli（多數 agent skill 可跨平台）

## 對 wiki 的意義（每日彙整來源）

`fetch-skills-picks.sh` 腳本每日擷取 skills.sh 精選，儲存為：

```
raw/skills-picks-YYYY-MM-DD.md
      ↓
wiki/src-skill-{skill-name}.md       ← 獨立解析頁（每個 pick 一頁）
wiki/src-skills-picks-YYYY-MM.md     ← 當月月報索引
```

本 wiki 已建立的 skill 解析頁：

| skill | 2026 精選日 | 安裝數 | wiki 頁 |
|-------|------------|--------|---------|
| ast-grep | 04-18（連兩日至 04-19） | 2,941 | [[src-skill-ast-grep]] |
| 3b1b-style-animation-skill | 04-17 | 1 | [[src-skill-3b1b-style-animation-skill]] |
| character-arc | 04-16 | 248 | [[src-skill-character-arc]] |
| alphafold | 04-15 | 24 | — |
| audit-prep-assistant | 04-14 | 1,779 | — |
| coding-agent | 04-13 | 1,211 | — |

## 本 wiki 觀察到的生態特徵

綜合 [[src-skills-picks-2026-04]] 月報分析：

- **「工具型 >> 領域型」的分佈**
  - 通用開發工具（ast-grep 2,941、audit-prep-assistant 1,779、coding-agent 1,211）
  - 領域專業（character-arc 248、alphafold 24、3b1b 1）
  - 相差 1–3 個數量級
- **skills.sh 編輯策展刻意平衡**：會選安裝數 1 的 niche skill，不只選熱門
- **三種製作風格**（見月報觀察）：
  - 極簡派：ast-grep（無 metadata、workflow 驅動）
  - 結構派：character-arc（豐富 metadata、多層 protocol）
  - 內容派：3b1b（core philosophy + 三層子目錄）

## 已知資料品質問題

- **2026-04-17 fetch bug**：raw 檔的「Skill README」內容錯置為 04-18 的 pick（ast-grep）——已在 [[src-skills-picks-2026-04]] 與相關 ingest 記錄註明，依 frontmatter `published` 與「今日精選」欄位為準
- **連兩日同 skill 案例**：04-18 與 04-19 精選皆為 ast-grep；後者在月報中需註記而非新建獨立頁

## 與 [[Claude Code]] 生態的關係

- skills.sh 是**非官方策展平台**，不屬於 [[Anthropic]]
- 但因 Claude Code 的 skill 機制成熟，skills.sh 上 Claude Code 相容 skill 佔大宗
- 安裝指令 `npx skills add <github-url> --skill <name>` 寫入 `~/.claude/skills/` 後即可被 Claude Code 的 Skill 工具呼叫

## 相關頁面

- [[src-skills-picks-2026-04]]（月報索引）
- [[src-skill-ast-grep]] / [[src-skill-3b1b-style-animation-skill]] / [[src-skill-character-arc]]
- [[Claude Code]]（skill 主要執行平台）
- [[Skill vs Bash vs MCP]]（skill 在 LLM agent 工具光譜中的定位）
