---
title: "src — Multica GitHub README"
type: source
sources: ["multica-aimultica The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills..md"]
created: 2026-04-21
updated: 2026-04-21
tags: [multica, managed-agents, open-source, coding-agents, vendor-neutral]
---

# src — Multica 官方 GitHub README

> 原始連結：[multica-ai/multica](https://github.com/multica-ai/multica)
> 擷取日期：2026-04-21
> 對應實體頁：[[Multica]]
> 姐妹來源：[[src-multica-devv-ai盡調]]（匿名盡調報告視角）

## 為何獨立存檔

[[Multica]] 實體頁先前主要基於 [[src-multica-devv-ai盡調]] 盡調報告建立。此 README 作為**官方第一手資料**補強以下三類事實，且比盡調更新（因 README 持續更新中）：

1. **支援 CLI 清單擴張**：盡調列出 Claude Code / Codex / OpenClaw / OpenCode 四種；README 已擴至 **8 種**——新增 **Hermes、Gemini、Pi、Cursor Agent**
2. **技術棧細節**：Next.js 16 (App Router) + Go (Chi + gorilla/websocket + sqlc) + PostgreSQL 17 (pgvector) + Local Daemon——盡調未揭露到此精度
3. **產品定位比較**：對比 Paperclip 的表格——讓定位更立體（Multica = 多人團隊 + 雲端優先 + 輕量治理；Paperclip = 單人操盤 + 本地優先 + 重度治理）

---

## 一、官方定位

**Slogan**：*Your next 10 hires won't be human.*

**一句話描述**：The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills.

把 coding agent 當真實同事對待：
- 像分派給同事一樣指派 issue
- Agent 自動接手工作、寫程式、回報 blocker、更新狀態
- **不用再複製貼上 prompt、不用再保姆式盯著 run**

---

## 二、支援的 Agent CLI（完整 8 種）

| CLI | 來源 | 廠牌 |
|-----|------|------|
| **Claude Code** | [[Anthropic]] | Anthropic 官方 |
| **Codex** | OpenAI | OpenAI 官方 |
| **OpenClaw** | 社群 | OpenClaw 專案 |
| **OpenCode** | 社群 | OpenCode 專案 |
| **Hermes** | 未明示 | |
| **Gemini** | Gemini | Google |
| **Pi** | 未明示 | |
| **Cursor Agent** | Cursor | 商業產品 |

> Daemon 自動掃描本機 `PATH` 上已安裝的 CLI，並在 Runtime 清單顯示——使用者無須手動配置。
> 這種 **vendor-neutral 架構**是 Multica 相對於 [[Anthropic]] Claude Managed Agents（只能跑自家 Claude）的核心差異。

---

## 三、五大 Features（官方整理）

1. **Agents as Teammates**
   - Agent 有 profile、出現在看板、參與留言、主動報告 blocker
2. **Autonomous Execution**
   - Set-and-forget 的完整 task lifecycle：enqueue → claim → start → complete/fail
   - 透過 WebSocket 即時串流進度
3. **Reusable Skills**
   - Agent 解決的方案沉澱為 skill，整個團隊能用——「skills compound your team's capabilities over time」
4. **Unified Runtimes**
   - 本地 daemon + 雲端 runtime 同一個儀表板
   - 自動偵測可用 CLI、即時監控
5. **Multi-Workspace**
   - Workspace 層級的隔離：各自的 agents / issues / settings

---

## 四、架構細節

```
Next.js Frontend ←→ Go Backend (Chi + WS) ←→ PostgreSQL (pgvector)
                          ↓
                   Agent Daemon (local)
                   (8 種 CLI)
```

| Layer | Stack |
|-------|-------|
| Frontend | **Next.js 16**（App Router） |
| Backend | **Go**（Chi router、sqlc、gorilla/websocket） |
| Database | **PostgreSQL 17 + pgvector**（vector search 支援，推測用於 skill 的語義搜尋） |
| Agent Runtime | 本地 daemon，執行上述 8 種 CLI |

**開發環境 Prerequisites**：Node.js v20+、**pnpm v10.28+**、Go v1.26+、Docker

**一鍵啟動**：`make dev` 自動偵測 worktree / 主 checkout，建 env、裝依賴、跑 migration、起所有服務。

---

## 五、安裝方式

| 管道 | 指令 |
|------|------|
| **Homebrew（推薦）** | `brew install multica-ai/tap/multica` |
| macOS / Linux 腳本 | `curl -fsSL https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.sh \| bash` |
| Windows PowerShell | `irm https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.ps1 \| iex` |
| Self-Host（含 server） | 加 `--with-server` 參數，需要 Docker，參見官方 [SELF_HOSTING.md](https://github.com/multica-ai/multica/blob/main/SELF_HOSTING.md) |

**一鍵配置**：
```bash
multica setup          # Connect to Multica Cloud, log in, start daemon
multica setup self-host  # 同樣流程但指向 self-hosted deployment
```

---

## 六、CLI 指令清單

| Command | 功能 |
|---------|------|
| `multica login` | 瀏覽器授權登入 |
| `multica daemon start` | 啟動本地 agent runtime |
| `multica daemon status` | 檢查 daemon 狀態 |
| `multica setup` | 雲端一條龍：configure + login + start daemon |
| `multica setup self-host` | 自架版一條龍 |
| `multica issue list` | 列出 workspace 內 issue |
| `multica issue create` | 建立新 issue |
| `multica update` | 更新 CLI |

---

## 七、Multica vs Paperclip 對比

| 維度 | **Multica** | **Paperclip** |
|------|------------|--------------|
| 產品焦點 | 團隊 AI agent 協作平台 | 單人 AI agent 公司模擬器 |
| 使用者模型 | 多人團隊 + 角色 + 權限 | 單人看板操作者 |
| Agent 互動 | Issues + Chat 對話 | Issues + Heartbeat |
| 部署 | **雲端優先**（cloud-first） | **本地優先**（local-first） |
| 管理深度 | 輕量（Issues / Projects / Labels） | 重度（Org chart / Approvals / Budgets） |
| 擴展性 | Skills system | Skills + Plugin system |

**TL;DR**：Multica 面向「多人團隊協作 + 雲端 + 輕量」；Paperclip 是「solo 玩家 + 本地 + 深度治理」。**兩者不是同一市場**，是「agent management」分化的兩條不同路線。

---

## 八、與 [[src-multica-devv-ai盡調]] 的資訊差

| 面向 | 盡調報告說法 | README 實況 | 差異 |
|------|------------|------------|------|
| 支援 CLI | 4 種（Claude Code / Codex / OpenClaw / OpenCode） | **8 種**（+Hermes / Gemini / Pi / Cursor Agent） | 盡調發表後官方擴張 2 倍 |
| 技術棧 | 未細述 | Next.js 16 + Go (Chi) + PostgreSQL 17 (pgvector) | 新資訊 |
| 商業模式 | 未明 | 雲端版（Multica Cloud）+ Self-Host 雙軌 | 雲端商業化明確化 |
| 競爭對手 | 對比 Linear、Anthropic Managed Agents | README 對比 Paperclip | 盡調視野 B2B enterprise；README 視野 OSS 同儕 |

> **觀察**：盡調報告聚焦「[[Devv.AI]] 為何做 Multica」與 B2B 戰略位置；README 聚焦「開發者怎麼上手 + 同類 OSS 怎麼比」。兩個來源互補，不衝突。

---

## 九、與既有 wiki 節點的連結

- **背後組織**：[[Devv.AI]]——Multica 出身上海的 Devv.AI 團隊，本 README 未提（由盡調補充）
- **同生態 agent runtime**：[[Claude Code]]、Gemini——README 首次明載支援
- **競合定位**：[[Anthropic]] Claude Managed Agents vs Multica vendor-neutral——README 未直接對比 Anthropic，但八種 CLI 支援清單本身就是 vendor-neutral 的最強聲明
- **Skill 概念呼應**：[[Skill vs Bash vs MCP]]、[[src-Harness Engineering]]——Multica 的「Reusable Skills」機制將 agent 解決方案沉澱為可重用資產，與 [[src-AI時代的測試管理]] 中 skill 的生命週期管理呼應

---

## 十、風險與觀察（基於 README 新增事實）

1. **8 種 CLI 整合的維護成本**：每個 CLI 都有自己的 config / auth / output 格式，daemon 要吸收這複雜度——維護壓力集中在 Multica 核心團隊
2. **pgvector 暗示語義搜尋**：PostgreSQL 17 + pgvector 組合強烈暗示 Skill 庫會做語義檢索（給 agent 自動推薦 skill），未在 README 明說但架構已就位
3. **雲端優先 vs 盡調的雲端不確定性**：盡調曾質疑商業模式，README 揭示 Multica Cloud 已上線（有 `multica setup` 雲端默認流程）——商業模式已啟動

---

## 相關頁面

- [[Multica]]（實體頁，本 source 為其官方第一手來源）
- [[src-multica-devv-ai盡調]]（姊妹來源，投研視角）
- [[Devv.AI]]（背後組織）
- [[Claude Code]]、Gemini、[[Anthropic]]、OpenAI（支援的 CLI 與競合 vendor）
- [[Skill vs Bash vs MCP]]（Skill 概念框架）
