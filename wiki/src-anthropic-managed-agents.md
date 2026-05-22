---
title: "Product development in the agentic era — Anthropic 的 Managed Agents PM 視角"
type: source
sources: [product-development-in-the-agentic-era-claude.md]
created: 2026-05-11
updated: 2026-05-11
tags: [anthropic, managed-agents, claude-code, product-management, agentic]
---

# Product development in the agentic era

> 來源：[Anthropic blog](https://claude.com/blog/product-development-in-the-agentic-era) | 作者：Jess Yan（Claude Managed Agents PM）| 發表 2026-04-29

## 核心論點

> One of the ironies of being a product manager in the age of AI is that **my work feels more human than ever**.

PM 工作一向是 craft（手藝）+ alignment（協調）的混合，過去大部分時間花在後者（會議、status report、ticket backlog）。有了 [[Claude Code]] / Claude / Claude Cowork / Claude Managed Agents，PM 可以把時間還給「craft」——真正陪用戶與團隊。

## Claude Managed Agents（beta）

**a suite of composable APIs for building and deploying cloud-hosted agents at scale**——[[Anthropic]] 的「託管 agent」產品線。

### PM 工作流的清晰分工
- **Claude / Claude Cowork**：開放式研究與探索（murky, early-stage exploration，想要持續對話）
- **Claude Code**：一旦對「要做什麼」有清晰度 → 寫並 ship 一個 custom agent，建在 Managed Agents 上

### 「Build with what we ship」
> API design used to live in documents and comment threads; **on the AI exponential, we build with what we ship**.

用自己的 primitives 來形塑產品——「a spec that reads elegantly in a doc can fall apart the first time you try to build against it」。用 Claude Code 對 pre-production API specs 寫 prototype，一個下午跑出 end-to-end 真實原型。

→ 直接呼應 [[src-karpathy-sequoia-ascent-2026]] 的「MenuGen spec 寫得漂亮但建起來就垮」與 Karpathy 的「Software 3.0：context 是程式」論述。

## Managed Agents 使用案例（PM 版）

1. **Adoption analytics**：agent 有 internal database 持久存取 + 理解 data schema 的 skill，跑 query 找 outlier；有 [memory](https://claude.com/blog/claude-managed-agents-memory) 可累積前次發現
2. **Developer sentiment monitoring**：agent 用 pre-built web search tool 掃特定 domain 的 dev feedback；內容太多 → fan out 給多個 agent 平行研究 → 等結果 → 綜整
3. **Demo building**：agent 有 demo GitHub repos + branding assets + event deck → 把 prebuilt template 變成針對特定受眾的 polished demo

Managed Agents sessions 在 cloud 跑——可以離開，回來時工作已完成。

## 啟動方式

- 在 Claude Code 載入 `Managed Agents skill`，給快速 sketch
- 開發者用最新 Claude Code + built-in `claude-api skill`，prompt「start onboarding for managed agents in Claude API」

## 跨 wiki 連動

- **[[src-scaling-managed-agents]]**：本篇的**工程實作配對**——同為 Managed Agents 主題，那篇講架構深度（brain/hands/session 解耦、meta-harness、pets-vs-cattle、TTFT 降 60-90%），本篇是 PM 產品視角
- **[[Anthropic]]**：Managed Agents 是 Anthropic 產品矩陣的雲端 agent 層
- **[[Claude Code]]**：PM 用以 ship custom agent 的工具
- **[[src-claude-family]]**：「Claude Cowork」在此 raw 確認為真實產品（導覽列有 `Claude Cowork` + `Claude Security`）——可更正 src-claude-family 的「待查證」標註
- **[[src-karpathy-sequoia-ascent-2026]]**：「build with what we ship」呼應 Karpathy 的 Software 3.0
- **[[Multi-Agent 失敗分類學]]**：use case 2 的「fan out to multiple agents → wait → synthesize」是 MAST 研究的標準 MAS pattern
- **[[Skill vs Bash vs MCP]]**：Managed Agents 用 skill（`claude-api skill` / `Managed Agents skill`）作 onboarding 入口

## 觀察

### 來源定位
- **行銷導向**：Anthropic 官方 blog，PM 個人視角的 product showcase；資訊偏「使用體驗推廣」
- **產品確認價值**：raw 的導覽列確認了 [[Anthropic]] 當前產品線——Claude / Claude Code / **Claude Cowork** / **Claude Security** / Skills / Managed Agents（beta）

### 與 wiki 既有 Anthropic 敘事的一致性
延續 [[src-claude-for-creative-work]] / [[src-claude-family]] 的調性：強調「正確使用 Claude 各產品」而非「Claude 比 X 強」。
