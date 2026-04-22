---
title: Multica
type: entity
entity_type: tool
sources: [src-multica-devv-ai盡調.md, src-multica-github-readme.md]
created: 2026-04-21
updated: 2026-04-21
tags: [AI Agent, 多 Agent 協作, OSS, Vendor-neutral, Agent Management]
---

# Multica

## 一句話定位

**Agent Management 層的 Vendor-neutral 協作平台**——把 AI Agent 當真實 Team Member 管理的開源產品。

## 背景資料

- **開發組織**：[[Devv.AI]]（2023 年起家於上海的開發者 AI 搜尋引擎團隊）
- **開發節奏**：3 個月從零到 10.3k stars、1.3k forks、33 contributors
- **核心開發集中度**：Top 4 貢獻者佔 97.4% commits，反映正規軍團隊專注開發
- **Slogan**：*A small team shouldn't feel small, two engineers and a fleet of agents can move like twenty.*

## 核心設計

### 把 Agent 當作 Team Member

- Agent 有**獨立的 Profile**
- 在專案看板上直接與人類工程師並列於 Assignee 下拉選單
- 發個 Issue 給 Agent，它會自動認領、實作、回報進度
- 被 block 時會主動出聲
- 解完的方案沉澱為 Skill，供後續調配

### Vendor-neutral（供應商中立）

支援的 Agent CLI（**官方 README 2026-04-21 更新至 8 種**）：
- [[Claude Code]]（Anthropic）
- Codex（OpenAI）
- OpenClaw
- OpenCode
- Hermes
- Gemini（Google）
- Pi
- Cursor Agent

**Daemon 自動偵測本機裝的 CLI 進行串接**。

> 2026-04-21 據 [[src-multica-github-readme]]，支援清單從盡調期的 4 種擴至 8 種——vendor-neutral 定位從「方向」升級為「既成事實」。

對比 [[Anthropic]] Claude Managed Agents 只能跑自家 Claude——Multica 的開放架構直接打中企業對「Vendor Lock-in」的焦慮。

## 生態卡位

| 層級 | 誰做 |
|------|------|
| 管「人」的任務 | Linear |
| 管「單一 Agent Session」安全 | [[Anthropic]] Claude Managed Agents |
| **管「多 Agent 團隊級協作」** | **Multica** |

## 架構亮點

- **任務狀態機（State Machine）**：Agent 任務的生命週期管理（enqueue → claim → start → complete/fail）
- **Skill 持久化**：Agent 學到的 Skill 可跨 session 復用，也可讓其他 Agent 讀取
- **Multi-runtime 架構**：同一組 task 可路由到不同 Agent runtime 執行

### 技術棧（據 [[src-multica-github-readme]]）

| Layer | Stack |
|-------|-------|
| Frontend | Next.js 16（App Router） |
| Backend | Go（Chi router、sqlc、gorilla/websocket） |
| Database | **PostgreSQL 17 + pgvector**（強烈暗示 Skill 庫做語義搜尋） |
| Agent Runtime | 本地 daemon，執行上述 8 種 CLI |
| 進度推送 | WebSocket 即時串流 task lifecycle |

### 產品定位分化（Multica vs Paperclip）

| 維度 | Multica | Paperclip |
|------|--------|-----------|
| 焦點 | 團隊協作 | 單人 solo |
| 部署 | 雲端優先 | 本地優先 |
| 管理 | 輕量（Issues / Labels） | 重度（Org chart / Budgets） |

→ 說明 agent management 市場已分化為「雲端團隊」與「本地個人」兩條路線，不是同一市場競爭。

## 與既有實體的關係

- **背後組織 → [[Devv.AI]]**：Multica 很可能是 Devv.AI 為消化內部大量 Agent 工作流而開發的自用工具，驗證後開源
- **替代方案 → Linear**：任務管理維度重疊，但 Linear 沒有 Agent 執行層
- **互補方案 → [[Claude Code]]**：Claude Code 是 Agent runtime，Multica 是它的團隊級管理層
- **精神類似 → [[src-Harness Engineering]]**：Harness 概念的商業化實作

## 風險與觀察

- **商業模式未明**：開源後如何營收——SaaS 版？企業版？
- **Vendor-neutral vs Vendor 反擊**：Anthropic/OpenAI 有動機推出自家 Agent 管理層壓制
- **Skill 持久化的鎖定效應**：一旦 Skill 都存在 Multica，切換成本就不再是「換 Agent runtime」而是「搬 Skill」

## 來源

- [[src-multica-devv-ai盡調]]：匿名作者的投研視角盡調報告
- [[src-multica-github-readme]]：官方 GitHub README（2026-04-21 擷取），補齊 CLI 支援清單、技術棧、商業化進度
