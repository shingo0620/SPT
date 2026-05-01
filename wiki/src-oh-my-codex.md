---
title: oh-my-codex (OMX) — OpenAI Codex CLI 的 harness 工具
type: source
sources: [github-yeachan-heooh-my-codex-omx-oh-my-codex-your-codex-is-not-alone-add-hooks-agent-teams-huds-and-so-much-more-github.md]
source_url: https://github.com/Yeachan-Heo/oh-my-codex
created: 2026-04-30
updated: 2026-04-30
tags: [oh-my-codex, omx, codex, openai, harness, agent, ralph-loop, mcp, skill]
---

# oh-my-codex (OMX)

> 來源：GitHub `Yeachan-Heo/oh-my-codex` README（v0.15.2 / 2026-04-30，27k stars / 2.2k forks）
> 一句話：**「給 OpenAI Codex CLI 加上完整 harness 工具鏈」**——類似 oh-my-zsh 對 zsh 的關係

---

## 一句話定位

> 「Start Codex stronger, then let OMX add better prompts, workflows, and runtime help when the work grows.」

OMX 是 [[OpenAI]] Codex CLI 的 workflow 層；它**不取代 Codex 引擎**，而是給 Codex 加上：
- 強化的預設工作流（4 個核心 skill 命令）
- 多 agent 協同執行（tmux-backed teams）
- 持久化狀態（`.omx/` 目錄）
- 內建 wiki MCP server（呼應 [[LLM Wiki]]）
- HUD/runtime 監控、explore/sparkshell 工具

---

## 核心：4 個 Skill 命令

| 命令 | 用途 |
|------|------|
| `$deep-interview "..."` | 釐清需求、邊界、非目標——當 prompt 含糊時的第一步 |
| `$ralplan "..."` | 把釐清後的範圍轉為已批准的架構與實作計畫 |
| `$ralph "..."` | 持續完成迴圈（單一 owner，呼應 [[src-Harness Engineering]] 的 Ralph Loop） |
| `$team N:role "..."` | 多 agent 協同並行執行（tmux-backed） |

**典型工作流**：
```
$deep-interview → $ralplan → $team OR $ralph
```

---

## OMX 的工具棧分層

依 [[src-agent-model-body-harness]] 三層拆解視角，OMX 對應：

| 層級 | OMX 提供的元件 |
|------|---------------|
| **Model** | OpenAI Codex（GPT-5.5 model_context_window=250000、auto_compact_token_limit=200000） |
| **Body** | tmux runtime（持久執行）、HUD panes、`.codex/hooks.json` native hooks、`.omx/hooks/*.mjs` plugin hooks、explore（read-only 倉庫查詢）、sparkshell（shell 檢查）、wiki MCP server |
| **Harness** | `.omx/` 持久狀態、AGENTS.md scoped guidance（含 `<!-- OMX:AGENTS:START/END -->` block）、4 個 skill 命令、role keywords |

**這是少見的「完整 harness 工具鏈 OSS 實作」**——看到 native hooks + plugin hooks 雙層、tmux 持久化、HUD 監控、wiki MCP 全部包齊，可以理解為什麼 Codex + OMX 的體感會跟 raw Codex 完全不同。

---

## 內建 Wiki MCP Server（呼應本知識庫）

OMX 內建 `omx wiki` 命令與 wiki MCP server，特色：

> **「markdown-first and search-first, not vector-first」**

完全呼應 [[LLM Wiki]] 設計哲學——不用 vector embedding、用 markdown 索引 + 搜尋。

| OMX wiki 命令 | 對應本知識庫 |
|---------------|-------------|
| `omx wiki list --json` | 類似 `wiki/index.md` 自動列表 |
| `omx wiki query --input '{"query":"X"}'` | 類似 `/llm-wiki query` |
| `omx wiki lint --json` | 類似 `/llm-wiki lint` |
| `omx wiki refresh --json` | 類似 `/llm-wiki ingest` |

**位置**：`.omx/wiki/`——與 [[LLM Wiki]] 將 wiki 放在專案根目錄一致。

當 `.omx/wiki/` 存在時，`omx explore` 會優先注入 wiki context 才退回 broader 倉庫搜尋——這是「**好編纂勝過好檢索**」原則的工程化（[[綜整-AI協作工程的六大趨勢#趨勢二：上下文管理成為核心工程挑戰]]）。

---

## 為什麼重要——對照「OpenClaw vs Claude Code」

[[src-agent-model-body-harness]] 提出一個核心案例：同顆 Opus 4.6，OpenClaw（personal assistant 設計）與 [[Claude Code]]（coding agent 設計）體感差很多——因為 body 與 harness 不同。

**OMX 是同一個論證的具體鏡像**：

| 比較 | 模型 | Body | Harness | 體感 |
|------|------|------|---------|------|
| Plain Codex | GPT-5.5 | bash + filesystem + git | minimal | 一般 |
| Codex + OMX | GPT-5.5 | + tmux runtime + HUD + wiki MCP + explore + sparkshell | + 4 skills + AGENTS.md + persistent `.omx/` | 「強很多」 |

**驗證**：27k stars 與每週快版（v0.15.2 是 95 個 release 之一）證明社群認為這套 harness 對 Codex 有顯著加值。

---

## 跨平台與工具鏈

| 平台 | 安裝 |
|------|------|
| macOS | `brew install tmux` |
| Linux | `sudo apt install tmux` |
| Windows | `winget install psmux`（次要支援） |
| WSL2 | `sudo apt install tmux`（推薦給 Windows 使用者） |

**Codex plugin 整合**：除了 `npm install -g`，OMX 也以 Codex plugin 形式存在於 `plugins/oh-my-codex` 與 `.agents/plugins/marketplace.json`，可透過 plugin 機制安裝（v0.15.x 版本支援）。

---

## 安裝與啟動

```bash
# 安裝
npm install -g @openai/codex oh-my-codex

# 啟動（推薦）
omx --madmax --high

# 或一次性，無 tmux/HUD
omx --direct --yolo

# Smoke test
omx doctor
codex login status
omx exec --skip-git-repo-check -C . "Reply with exactly OMX-EXEC-OK"
```

`omx doctor` 驗證安裝；`omx exec` 驗證 Codex auth 能實際完成 model call——OMX 把「綠燈不等於可用」的謹慎心智內建為兩段式檢查。

---

## 維護團隊與生態

| 角色 | 名字 | GitHub |
|------|------|--------|
| Creator & Lead | Yeachan Heo | @Yeachan-Heo（韓國） |
| Maintainer | HaD0Yun | @HaD0Yun |
| Ambassador | Sigrid Jin | @sigridjineth |
| Top Collaborators | HaD0Yun、Junho Yeo、JiHongKim98、Lor、HyunjunJeon | — |

- **Stack**：TypeScript 93.5% + Rust 3.3% + JavaScript 2.6%
- **License**：MIT
- **Latest release**：v0.15.2（2026-04-30，今日）
- **i18n**：14 語言 README（含繁體中文 README.zh-TW.md）
- **Discord**：oh-my-codex 與相關工具的共享社群
- **Website**：oh-my-codex.dev

---

## 與本知識庫的關係

### 直接概念呼應

- **`$ralph`** ↔ [[src-Harness Engineering]] 的 **Ralph Loop**：李宏毅版用 Ralph 命名（辛普森家族橫衝直撞角色），OMX 把它做成命令——讓「持續完成迴圈」變成可呼叫的 primitive
- **wiki MCP server** ↔ [[LLM Wiki]]：兩者都採「markdown + search > vector」哲學，且 wiki 都在專案根目錄持久化
- **AGENTS.md scoped guidance** ↔ [[Skill vs Bash vs MCP]] / [[src-Harness Engineering]] 的「認知框架」層
- **`omx explore` wiki-first 注入** ↔ [[綜整-AI協作工程的六大趨勢]] 趨勢二「上下文管理」的具體解法——把 wiki context 提前注入而非依賴 grep

### 概念對照

OMX 對 Codex 就像：
- [[Claude Code]] 對 [[Anthropic]] Claude API：給 raw model 加完整 harness 變成 coding agent
- oh-my-zsh 對 zsh：給 raw shell 加 plugin 與 theme 系統
- bash + readline + completion：給 raw OS shell 加可用性

---

## 未來追蹤點

1. **與 [[Skill vs Bash vs MCP]] 的對照**：OMX 4 個 skill 命令是純 prompt skill 還是有 MCP/Bash 包裝？需要看 source 確認
2. **wiki MCP server 的具體 protocol**：是否相容 Anthropic 的 MCP 標準？
3. **i18n 的 14 語言**：對 indie OSS 而言是高成本投入，可能反映韓國/亞洲社群活躍度
4. **與 OpenClaw 的關係**：repo 中提到 `openclaw-integration.md` 與 `omx --madmax`、Discord 「OMX/community shared server for oh-my-codex and related tooling」——是否與 [[src-agent-model-body-harness]] 提到的 OpenClaw 為同一個生態？

---

## 查核備註

✅ 核心事實（27k stars、v0.15.2 release date 2026-04-30、4 個 skill 命令、tech stack、maintainer 名字）皆來自 GitHub repo README 直接擷取。

⚠️ 「27k stars」對 indie repo 是偏高數字——可能與 Codex CLI 本身的全球熱度連動，需追蹤 star history（repo README 有附 Star History Chart）。

⚠️ 「OMX 對 Codex 像 Claude Code 對 Anthropic」是本頁的類比論點，並非 OMX 官方主張——應視為 wiki 觀察。

---

## 相關頁面

- [[src-agent-model-body-harness]]（三層拆解：OMX 是給 Codex 加 body+harness 的具體實作）
- [[src-Harness Engineering]]（Ralph Loop 原始論述；`$ralph` 命名來源）
- [[LLM Wiki]]（markdown-first 知識庫哲學，與 OMX wiki MCP server 同設計）
- [[Skill vs Bash vs MCP]]（OMX 4 個 skill 屬於哪個層級的工具）
- [[綜整-AI協作工程的六大趨勢]]（趨勢一「環境比模型聰明」與趨勢二「上下文管理」的活生生案例）
- [[OpenAI]]（OMX 寄生於 Codex 之上）
- [[Claude Code]]（與 OMX 形成對照——Anthropic 與 OpenAI 兩大 coding agent 生態系的 harness 工具）
- [[src-codeburn]]（互補關係：oh-my-codex 是行為層工具鏈、codeburn 是跨 16 工具的成本觀測層）
