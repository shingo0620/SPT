---
title: Anthropic
type: entity
sources: []
created: 2026-04-20
updated: 2026-04-20
tags: [anthropic, ai-company, llm, claude, safety]
---

# Anthropic

> 本頁統整本 wiki 8 處提及的 Anthropic 脈絡；來源為空表示為跨來源歸納。

## 一句話定位

2021 年由前 OpenAI 研究員 Dario / Daniela Amodei 等人創辦的 AI 公司，**以「AI 安全」（Constitutional AI、Responsible Scaling Policy）為核心論述**，旗下主力產品為 Claude 模型系列與 [[Claude Code]] agent CLI。

## 模型系列（wiki 涉及的版本）

| 等級 | 代號 | 主要用途 | wiki 涉及 |
|------|------|----------|----------|
| Opus | `claude-opus-4-7` | 複雜推理、長 context | 多處——[[src-Claude Code Session管理]]、HN/PH/GitHub Trending 04-18 |
| Sonnet | `claude-sonnet-4-6` | 平衡效能與成本 | — |
| Haiku | `claude-haiku-4-5-20251001` | 快速、低成本 | — |

- Claude 4.X 是當前世代
- Opus 4.7 支援 **1M context window**（見 [[src-Claude Code Session管理]]）

## 主要產品線

- **Claude API / Anthropic SDK**——程式化存取（支援 prompt caching、batch、files、memory、citations、thinking 等 feature）
- **Claude.ai**——消費級 web / 行動端對話介面
- **[[Claude Code]]**——終端機 agent CLI（本 wiki 第一主角工具）
- **Claude Desktop / Mobile**——獨立應用
- **Claude Design**（近期）——2026-04-18 HN #8 / PH #1 同日衝榜，對應「Anthropic Labs 日」的話題高峰

## wiki 中的近期關聯事件

- **2026-04-18 Anthropic Labs 日**（[[src-hn-2026-04]]、[[src-producthunt-2026-04]]、[[src-github-trending-2026-04]]）：
  - Claude Design 上 HN #8（1,104 分）+ PH #1
  - 衍生 GitHub 熱門 repo `awesome-claude-design`
  - Claude 4.7 tokenizer 成本分析討論（HN #10）
  - **命名碰瓷案例**：`Claude-Design-By-Anthropic` 非官方，需警覺
- **Mythos 研究複現**（[[src-hn-2026-04]] 04-19 #2）：用公開模型重現 Anthropic 的 Mythos 研究發現
- **Session Management 官方教學**（[[src-Claude Code Session管理]]）：Anthropic 團隊公開 context 管理最佳實踐

## 核心論述

- **Constitutional AI（CAI）**——用一組原則訓練模型自我監督
- **Responsible Scaling Policy（RSP）**——能力分級與對應安全措施
- **Interpretability 研究**——機械解釋性探索模型內部運作（Mythos 系列屬此）

## 競爭版圖

| 公司 | 旗艦模型 | 開發 CLI | wiki 涉及 |
|------|---------|---------|----------|
| Anthropic | Claude Opus 4.7 | [[Claude Code]] | ⭐（主角） |
| OpenAI | GPT 系列 / Codex 2.0 | Codex CLI | [[src-Harness Engineering]]、[[src-Code Review已死]] |
| Google | Gemini 系列 | gemini-cli | 提及 |
| Meta | Llama 系列 | — | 較少 |

## 相關頁面

- [[Claude Code]]（旗艦 agent 產品）
- [[skills.sh]]（生態系策展平台，雖非 Anthropic 官方）
- [[src-Claude Code Session管理]]（Anthropic 官方 session 管理文）
- [[src-hn-2026-04]] / [[src-producthunt-2026-04]] / [[src-github-trending-2026-04]]（近期話題）
- [[綜整-AI協作工程的六大趨勢]]（宏觀趨勢的參與者之一）
