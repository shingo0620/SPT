---
title: "Claude Code Routines"
type: source
sources: [automate-work-with-routines-claude-code-docs.md]
created: 2026-04-18
updated: 2026-04-18
tags: [claude-code, automation, agent, routines, scheduled-tasks]
---

# Claude Code Routines — 把 Claude Code 放上自動駕駛

> 來源：[Automate work with routines — Claude Code Docs](https://code.claude.com/docs/en/routines)
> 擷取日期：2026-04-18
> 狀態：Research preview（API 與行為可能變動）

## 一句話

Routines 把「一個 prompt + 一組 repo + 一組 connector」打包成可重複執行的 **Claude Code 雲端任務**，可被排程、HTTP API、或 GitHub 事件觸發——**完全自主執行，沒有權限提示**。

---

## 核心概念

### 什麼是 Routine

一個儲存起來的 Claude Code 組態：
- **Prompt**：Claude 每次執行的指令（routine 最重要的部分）
- **Repositories**：一或多個 GitHub repo（執行時 clone、Claude 建 `claude/` 前綴分支）
- **Environment**：雲端執行環境（網路權限、環境變數、setup script）
- **Connectors**：MCP 連結（Slack、Linear、Google Drive 等）
- **Triggers**：觸發條件（排程／API／GitHub 事件）

在 Anthropic 雲端基礎設施執行，Mac 關機也會跑。**屬於個人 claude.ai 帳號**、**不與團隊共享**、**扣個人日額度**。透過個人 GitHub identity 或 connectors 做的所有事都顯示為你。

### 三種觸發類型（可組合）

| 類型 | 觸發方式 | 適用場景 |
|------|---------|---------|
| **Scheduled** | hourly / daily / weekdays / weekly（最小 1 小時，自訂 cron 需透過 CLI `/schedule update`） | backlog 維護、docs drift 檢查、週報彙整 |
| **API** | POST `/fire` endpoint + bearer token | Alert triage、deploy verification、第三方系統整合 |
| **GitHub** | pull_request / release 事件 + 多欄位 filter | 自動 code review、library port、標籤分類 |

單一 routine 可同時掛多種 trigger——例如 PR review routine 每晚跑一次、deploy 腳本可手動觸發、且對每個新 PR 自動反應。

---

## 與既有概念的關係

### 與 [[AI 輔助軟體工程]]

Routines 是 **unattended、repeatable、tied to clear outcome** 的自動化工作——與既有「雙重 review、人機分工」工程方法論形成對比：前者強調人類判斷在迴圈中，後者把判斷外包給經過嚴格設計的 prompt。

適合的場景（依官方文件）：
- **Backlog maintenance**、**alert triage**、**bespoke code review**、**deploy verification**、**docs drift**、**library port**——全都符合「決策規則明確可以寫入 prompt」的特徵

**警訊**：沒有 permission-mode picker、沒有 approval prompts——意味著 prompt 設計錯誤的後果會直接累積。設計 routine 的心力應比設計互動式工作更大。

### 與 [[src-Harness Engineering]]

Harness Engineering 提到「Lifelong AI Agent」的願景——routines 是 Anthropic 對此願景的第一版可用產品：
- **長時運行**：雲端執行、不靠你的 Mac
- **觸發驅動**：不只對使用者互動反應，也對系統事件反應
- **狀態累積**：每次 routine run 建立新 session，但 routine 本身的組態持久化

還沒解決的 Harness 核心議題：
- **上下文管理**：每次 run 是新 session，不像 lifelong agent 那樣累積對歷史的理解
- **情緒 feedback**：routine 單向執行，失敗時人類要主動查 session log

### 與 [[Skill vs Bash vs MCP]]

Routine 可使用 repo 中 committed 的 **Skills**、以及配置的 **MCP connectors**——這驗證了先前知識庫的判斷：**Skill 是新軟體原語**（[[綜整-AI協作工程的六大趨勢]] 第 5 點）。skill 可以被打包在 routine prompt 中重複使用。

Bash 也可用（"The session can run shell commands"），但限於雲端環境——本機資源（你的 dotfiles、本機 DB）不可用。

### 與 /loop 和 Desktop Scheduled Tasks

文件末尾明確區分了三種相關機制：

| 機制 | 執行位置 | 觸發 | 生命週期 |
|------|---------|------|---------|
| **`/loop`** | 本機 CLI session 內 | 間隔執行（session 活著時） | 跟 CLI session 共生 |
| **Desktop Scheduled Tasks** | 你的 Mac | 時間表 | Mac 開著才會跑、能存取本機檔 |
| **Routines** | Anthropic 雲端 | 時間／API／GitHub | 獨立於裝置持續存在 |

三者是互補關係，不是取代關係。

---

## 創建與管理方式

### 三種入口寫入同一雲帳號

- Web：claude.ai/code/routines
- Desktop app：**New task** → **New remote task**（不是 New local task！）
- CLI：`/schedule`（僅限 scheduled 類型）——支援對話式建立如 `/schedule daily PR review at 9am`，管理用 `/schedule list / update / run`

**重要邊界**：CLI 只能建排程 routine——要加 API trigger 或 GitHub trigger，必須到 web UI 編輯。

### 分支限制

預設只能 push 到 `claude/` 前綴分支（防止意外修改 main 或保護分支）。要關掉需對每個 repo 個別開啟「Allow unrestricted branch pushes」。

### Token 管理

API trigger 的 bearer token **只顯示一次**、不能事後取回——必須立即存到 alerting 工具的 secret store。遺失只能 regenerate。

---

## 安全／風險觀察

1. **無 approval prompt**：routine 跑起來就一路跑完。錯誤的 prompt 可能造成大量錯誤 commits、無效 PR、或 connectors 誤操作（Slack 發錯訊息、Linear 開錯 ticket）
2. **以你的身份執行**：GitHub commits / Slack messages / Linear tickets 都顯示為你——稽核時難以追溯是 routine 還是手動
3. **Scope 控制的三道關卡**：
   - Repositories 選擇 + branch push 設定
   - Environment 網路 + 環境變數
   - Connectors 列表
   — 三者獨立設定，任一環節開太大都會放大風險
4. **Beta 風險**：`experimental-cc-routine-2026-04-01` beta header，API 可能變動；兩個最近歷史版本仍可用

---

## 關鍵 API 範例

觸發 routine（API trigger）：

```bash
curl -X POST https://api.anthropic.com/v1/claude_code/routines/trig_.../fire \
  -H "Authorization: Bearer sk-ant-oat01-xxxxx" \
  -H "anthropic-beta: experimental-cc-routine-2026-04-01" \
  -H "anthropic-version: 2023-06-01" \
  -H "Content-Type: application/json" \
  -d '{"text": "Sentry alert SEN-4521 fired in prod. Stack trace attached."}'
```

`text` 是自由字串（非結構化解析），會和 saved prompt 一起餵給 routine。

---

## 交叉引用

- 既有 HN 月報中已收錄的同一來源：[[src-hn-2026-04#2026-04-15]]（#1 排名第 591 分「Claude Code Routines」正是本文件）
- 相關工程方法論：[[AI 輔助軟體工程]]、[[src-mattpocock-skills]]、[[src-AI輔助工作流程]]
- Agent 架構演進：[[src-AI-Agent避坑指南]]、[[src-Harness Engineering]]
- 新軟體原語：[[Skill vs Bash vs MCP]]
- 趨勢綜整：[[綜整-AI協作工程的六大趨勢]]（routines 實證其中的「基礎設施民主化」與「Agent 從工具走向長期夥伴」兩條趨勢）
