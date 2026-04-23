---
title: aster-life/obsidian-llm-wiki——Obsidian + Claude Code 的 LLM Wiki 懶人包
type: source
sources: [aster-life-obsidian-llm-wiki.md]
created: 2026-04-22
updated: 2026-04-22
tags: [Obsidian, LLM Wiki, Claude Code, 知識管理, skills]
---

# aster-life/obsidian-llm-wiki

## 來源資訊

- 作者：aster-life
- 連結：https://github.com/aster-life/obsidian-llm-wiki
- License：MIT
- 核心定位：讓 AI 幫你蒐集、整理、累積知識的 Obsidian 工作流——「把原始文章丟進去 → AI 自動摘要建檔 → 跨來源合成分析 → 直接用中文問知識庫」
- 啟發來源：[Andrej Karpathy 的 LLM Wiki 模式](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

## 摘要

直接衝擊本 wiki 基礎設施的同類專案——**aster-life/obsidian-llm-wiki 提供幾乎完全對齊的架構**（raw/ + wiki/ + .claude/，AI 行為契約，6 種操作模式）但鎖定 **Obsidian 使用者** 而非 CLI 工作流。是 [[src-LLM Wiki]] Karpathy 原始概念在 Claude Code + Obsidian 交叉生態的第一個「懶人包」級實作。

## 架構對比

### aster-life/obsidian-llm-wiki 結構

```
raw/          ← 使用者丟（AI 只讀不動）
wiki/         ← AI 完全擁有，自動維護
.claude/      ← AI 行為設定與技能包
```

**兩層分工**：
- **Raw 層**：原始素材（文章、PDF、筆記）
- **Wiki 層**：AI 自動整理（來源摘要、概念、實體、跨來源分析）

### 本 wiki 專案架構（對照）

```
raw/          ← 原始資料（不可變，LLM 只讀不改）
  assets/     ← 圖片與附件
wiki/         ← LLM 生成與維護的 Markdown 頁面
  index.md
  log.md
CLAUDE.md     ← Wiki schema 設定（定義結構與慣例）
scripts/      ← 每日自動擷取腳本（7 個來源）
```

**結構幾乎完全對齊**——皆沿用 Karpathy 的 raw/wiki 分層 + `CLAUDE.md` 作為 AI 行為契約。關鍵差別：本 wiki 加上 GitHub Actions 每日自動擷取 7 個來源、obsidian-llm-wiki 聚焦 Obsidian 瀏覽體驗。

## 6 種操作模式對比

| 操作 | obsidian-llm-wiki 觸發詞 | 本 wiki 觸發詞 | 對應 |
|------|------------------------|---------------|------|
| INGEST | `ingest`、`攝入` | `/llm-wiki ingest` | 摘要 raw → wiki |
| QUERY | 直接提問 | `/llm-wiki query` | 從知識庫查詢合成 |
| SCAN | `掃描 raw` | 整合於 ingest 中的 `git status raw/` | 列出未處理檔案 |
| REFLECT | `reflect` | 整合於 wiki 頁面維護 + 週綜整 | 跨來源二階合成 |
| LINT | `lint` | `/llm-wiki lint` | 健康檢查 |
| ADD QUESTION | `我想搞清楚` | 無對應（放 `log.md` 或直接提問） | 記錄開放問題 |

**核心相同**：INGEST / QUERY / LINT 是必備三件組；**obsidian-llm-wiki 額外有 REFLECT 與 ADD QUESTION**——前者是週期性合成（本 wiki 已手動實踐為週綜整）、後者是「暫存未解問題的 queue」機制（本 wiki 尚未建立）。

## 包含內容（obsidian-llm-wiki 的 .claude/skills/）

| Skill | 作用 |
|-------|------|
| `.claude/skills/obsidian-markdown/` | 教 AI 正確使用 Obsidian Markdown（含 wikilink、frontmatter、標註） |
| `.claude/skills/obsidian-bases/` | 教 AI 操作 Obsidian Bases（類似 dataview 的資料視圖） |
| `.claude/skills/obsidian-cli/` | 教 AI 使用 Obsidian CLI（自動化檔案操作） |
| `.claude/skills/json-canvas/` | 教 AI 建立 Canvas 圖（Obsidian 的視覺化圖表） |
| `.claude/skills/defuddle/` | 網頁內容清理工具（擷取文章正文） |

**設計哲學明顯**：obsidian-llm-wiki 的 skill 全都指向「讓 AI 懂 Obsidian 生態」——bases、CLI、canvas、markdown 分別對應 Obsidian 的資料庫、命令列、圖、文字四大能力。這與本 wiki 的「GitHub Actions + 腳本自動擷取外部來源」走完全不同路線。

## 安裝與使用流程

### 安裝步驟

1. `git clone https://github.com/aster-life/obsidian-llm-wiki.git` 或下載 ZIP
2. 將所有檔案放到 Obsidian vault 根目錄（或新建 vault）
3. 安裝 [Claude Code CLI](https://claude.ai/code)
4. 可選：安裝 [Claudian 插件](https://github.com/YishenTu/claudian)——在 Obsidian 內直接與 Claude 對話，不用切視窗

### 使用方式（直接用中文）

在 Claude Code 或 Claudian 插件中說：

- `ingest raw/assets/你的文章.md` —— 攝入單篇文章
- `根據我的知識庫，幫我整理 XXX 概念` —— 查詢
- `掃描 raw` —— 找出未處理檔案
- `reflect` —— 跨來源二階合成
- `lint` —— 健康檢查
- `我想搞清楚 XXX` —— 把問題加到追蹤佇列

## 與本 wiki 的定位差異

| 面向 | aster-life/obsidian-llm-wiki | 本 wiki（SPT） |
|------|------------------------------|---------------|
| **使用者介面** | Obsidian GUI（圖像化 vault 瀏覽） | 直接讀 Markdown + git 協作 |
| **素材擷取** | 手動放入 raw/（支援 [[defuddle]] 清理網頁） | 7 個來源 GitHub Actions 每日自動擷取 + 手動補充 |
| **ingest 觸發** | 單篇手動（`ingest raw/xxx.md`） | `git status raw/` 批次偵測未處理檔案 |
| **AI 平台** | Claude Code（經 Claudian 插件進 Obsidian） | Claude Code 直接 CLI |
| **語言** | 繁體中文 | 繁體中文 |
| **skill 依賴** | 5 個 Obsidian-specific skill | 僅 llm-wiki skill，其他 skill 可選 |
| **組態層次** | `CLAUDE.md`（AI 行為契約） | `CLAUDE.md`（AI 行為契約）+ `scripts/`（自動化腳本） |
| **REFLECT 模式** | 有（獨立操作） | 整合於週綜整（每週回看） |

**一句話**：**obsidian-llm-wiki 是「日常瀏覽器」為核心的知識庫**、**本 wiki 是「自動訂閱 + 批次處理」為核心的知識庫**。

## 值得借鑑的設計

從 aster-life/obsidian-llm-wiki 值得引入本 wiki 的機制：

1. **ADD QUESTION 模式**——記錄「我想搞清楚」但尚未有來源的問題佇列；目前本 wiki 偶爾在對話中出現，但沒有結構化追蹤。可在 `log.md` 旁增加 `open-questions.md`。
2. **REFLECT 作為顯式模式**——本 wiki 目前只在「週綜整」做跨來源合成；若有獨立 `/llm-wiki reflect` 指令，可在任何時候觸發「找出最近 N 篇的合成機會」。
3. **defuddle skill 引入**——雖然本 wiki 有 `fetch-url.sh` 但透過 markdown.new；若 markdown.new 超時，defuddle 作為 fallback 能補位（見 2026-04-22 本次 ingest 的 fetch-url.sh 超時事件）。
4. **Obsidian Canvas / Bases 視覺化**——如果使用者未來在 Obsidian 中打開本 wiki，可用 json-canvas 建立「實體關係圖」或 base 建立「依領域瀏覽」。

## 致謝來源（aster-life 列出的啟發者）

- [Andrej Karpathy](https://github.com/karpathy) —— LLM Wiki 概念發想（見 [[src-LLM Wiki]]）
- [kepano](https://github.com/kepano/obsidian-skills) —— obsidian-skills 技能包
- [YishenTu](https://github.com/YishenTu) —— Claudian 插件（Obsidian 內的 Claude Code）
- [LLM Wiki 搭建教程（飛書）](https://hcn9zwu8a0fz.feishu.cn/wiki/AM3ewXySViopPdkE8Gic90BDnRb)
- YouTube 教程：丹妮tech、Blink 的 AI 笔记、白白说大模型、PAPAYA 電腦教室、三師爸Sense Bar

**觀察**：教程大部分來自中文圈（飛書、YouTube 簡中／繁中），顯示 LLM Wiki 作為知識管理方法論在 2026 年的中文技術社群已有一波教程熱度。

## 一句話推薦

> **如果你是 Obsidian 重度使用者，這是入門 LLM Wiki 最快的方式——5 分鐘 clone + Claude Code 就能跑，跟本 wiki 走完全不同但架構高度對齊的路線。**

## 相關頁面

- [[src-LLM Wiki]]（Karpathy 原始構想，兩個專案共同根源）
- [[src-karpathy筆記實作]]（LLM Wiki 實作教學與 RAG 比較）
- [[src-向三位大師學AI筆記]]（三位大師的 AI 知識管理方法論）
- [[三大知識管理系統比較]]（LLM Wiki vs QMD vs GBrain）
- [[Andrej Karpathy]]（人物）
- [[LLM Wiki]]（概念）
- [[Claude Code]]（平台）
