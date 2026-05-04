---
title: Zed
type: entity
sources: [producthunt-2026-05-01.md]
created: 2026-05-04
updated: 2026-05-04
tags: [editor, open-source, rust, multiplayer, ai-coding]
---

# Zed

> 高效能、開源、多人協作程式編輯器，2026-05-01 發布 1.0。

## 簡介

Zed 是用 **Rust** 寫的 native 程式編輯器，主打：

- **高效能** — native 架構，相較 Electron-based VS Code/Cursor 啟動更快、記憶體佔用更低
- **開源** — 與 Cursor（閉源 fork of VS Code）形成對比
- **多人即時協作** — 內建 multiplayer 編輯，類似 Google Docs 但針對 code
- **AI 整合** — 支援多家 LLM provider（含 [[Anthropic]] Claude、[[OpenAI]]）

## 編輯器戰局定位

| 編輯器 | 來源／公司 | 開源 | 技術棧 | AI 整合策略 |
|-------|----------|------|--------|------------|
| Zed | Zed Industries（前 Atom 團隊） | ✅ | Rust native | multi-provider |
| Cursor | Anysphere | ❌ | VS Code fork（Electron） | 自家 + multi-provider |
| VS Code | Microsoft | ✅ | TypeScript（Electron） | Copilot（OpenAI） |
| JetBrains 系列 | JetBrains | ❌ | JVM | AI Assistant + 多 provider |

## 1.0 發布事件

- **時間**：2026-05-01
- **Product Hunt**：第二高票（166 票），分類 Open Source / Text Editors / Developer Tools
- **意義**：Zed 經多年 beta 終於 1.0；對應 [[src-producthunt-2026-05]] 觀察「編輯器戰局走向 native + 開源差異化」

## 與 wiki 其他主題的關聯

- 編輯器是 [[Claude Code]] 等 agent CLI 的「Body」（編輯介面），延伸 [[src-agent-model-body-harness]] 的 Model + Body + Harness 三層拆解
- AI 編輯器戰局與 [[Anthropic]]、[[OpenAI]] 的模型供給生態交織
- 跨來源信號：[[src-producthunt-2026-05]] #2

## 觀察重點

- **是否能挑戰 Cursor 在 AI coding 領域的領先**——Cursor 已建立 agent + auto-completion 心智市佔
- **多人協作 vs 單機**——Pair programming 復興、AI agent 也是「協作者」之一的雙重意義
- **Rust native 性能優勢**——對開發大型 codebase（含 monorepo / Linux kernel-tier）使用者的吸引力
