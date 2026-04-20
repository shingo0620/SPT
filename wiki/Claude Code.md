---
title: Claude Code
type: entity
sources: []
created: 2026-04-20
updated: 2026-04-20
tags: [claude-code, anthropic, ai-agent, cli, coding-agent]
---

# Claude Code

> 本頁統整本 wiki 18 處提及的 Claude Code 脈絡；來源為空表示為跨來源歸納，細節散見於各 source 頁。

## 一句話定位

[[Anthropic]] 官方出品的**終端機 AI agent CLI**，是 2025–2026 年 agentic coding 工具生態的旗艦之一。以「長壽命 session + 多工具 + 深度自訂」為設計重點，支援桌面 app、VS Code / JetBrains 擴充、web 版（claude.ai/code）。

## 核心能力

| 能力 | 說明 | 相關 wiki 頁 |
|------|------|-------------|
| **Tools** | Read/Write/Edit/Bash/Grep/Glob/WebFetch/WebSearch 等原生工具 | [[Skill vs Bash vs MCP]] |
| **Skills** | 使用者自訂可復用工作流（位於 `~/.claude/skills/`） | [[src-skill-ast-grep]]、[[src-skill-character-arc]]、[[src-skill-3b1b-style-animation-skill]] |
| **Hooks** | 事件驅動 shell 指令（SessionStart、UserPromptSubmit 等） | [[src-mattpocock-skills]] |
| **MCP** | Model Context Protocol——外部服務接入（context7、serena、pencil 等） | [[Skill vs Bash vs MCP]] |
| **Subagents** | 獨立 context 的子代理，避免主 context 被 pollute | [[src-Claude Code Session管理]]、[[src-AI-Agent避坑指南]] |
| **Plan mode** | 先計畫後執行，降低一次性大改風險 | [[src-Harness Engineering]] |
| **Routines** | 排程 / API / GitHub 事件觸發的雲端自主任務 | [[src-Claude Code Routines]] |
| **Memory** | 持久的跨 session 記憶檔系統 | [[LLM Wiki]] |
| **1M context** | Opus 系列支援 1M token window | [[src-Claude Code Session管理]] |

## 與 wiki 中五大關鍵概念的對應

本 wiki 中 Claude Code 的操作面與心智模型散見於這幾篇核心文件：

- [[src-Claude Code五個底層概念]]——概率／窗口／模型／循環／層級，使用 Claude Code 的心智模型
- [[src-Claude Code Session管理]]——Anthropic 官方講 context rot、rewind、compact vs clear、bad compact、subagent 決策準則
- [[src-Claude Code Routines]]——排程化／API 化／事件驅動的「Lifelong AI Agent」第一版可用產品
- [[src-Harness Engineering]]——如何把 Claude Code 駕馭成可靠工作流程（agents.md、Ralph Loop）
- [[src-mattpocock-skills]]——Matt Pocock 的完整 Claude Code skills 合集，含 PRD/Issue/Plan 模板

## 生態關係

```
                                  Anthropic
                                     │
                    ┌────────────────┼────────────────┐
                    │                │                │
                Claude API      Claude Code      Claude.ai Web
                    │                │
                    │         ┌──────┼──────┐
                    │         │      │      │
                    │       Skills  MCP   Hooks
                    │         │      │      │
                    │         ▼      ▼      ▼
              Anthropic SDK  [[skills.sh]] MCP 生態 hooks 設定
```

- **上游**：[[Anthropic]]（公司 / 模型提供者）
- **平行產品**：Claude API（程式化介面）、Claude.ai web（一般使用者）
- **下游生態**：[[skills.sh]]（skill 策展）、MCP 服務（如 context7）、第三方 skill 合集（[[src-mattpocock-skills]]）
- **競品對照**：OpenAI Codex CLI、Cursor、Cline、gemini-cli

## 時間軸（以 wiki 涉及版本為準）

- 2026-04-18：Claude Opus 4.7（wiki 中多處提及的當前主力模型，支援 1M context）
- Claude Code 作為產品迭代快速：每週釋出新功能（近期重點：Plan mode 穩定化、Skills 系統、1M context）

## 為什麼值得有獨立頁

- 是 wiki 中提及頻率最高的工具類實體（18 頁）
- 多個 concept 頁（[[LLM Wiki]]、[[Skill vs Bash vs MCP]]、[[Restatement]]、[[AI 輔助軟體工程]]）與五個 src-Claude Code-* 系列頁均以它為底座
- 避免每頁重複解釋「什麼是 Claude Code」

## 相關頁面

- [[Anthropic]]（母公司）
- [[skills.sh]]（第三方 skill 策展平台）
- [[Skill vs Bash vs MCP]]（Claude Code 三種擴展機制的比較）
- [[src-Claude Code五個底層概念]] / [[src-Claude Code Session管理]] / [[src-Claude Code Routines]]
- [[src-Harness Engineering]]（駕馭工程）
- [[src-mattpocock-skills]]（Skill 合集範例）
- [[src-AI-Agent避坑指南]]（Plan-and-Execute → Skill → 上下文隔離的演進）
