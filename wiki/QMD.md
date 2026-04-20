---
title: QMD（Query Markup Documents）
type: concept
sources: [向三位大師學AI筆記.md]
created: 2026-04-13
updated: 2026-04-13
tags: [知識管理, 本地搜尋, 混合檢索, MCP]
---

# QMD（Query Markup Documents）

由 [[Tobi Lütke]] 提出的本地優先混合搜尋引擎。

## 核心理念

在資料已存在的前提下，把「找得到」做到極致，且不離開本機。

## 技術架構

- **BM25**：關鍵字檢索
- **向量語意**：語意相似度搜尋
- **查詢擴展與重排序**：提升檢索品質
- **GGUF 模型**：盡量在本地完成
- **[[AST]] 感知分塊**：切程式碼時不按行、按抽象語法樹節點切，保持函式與 class 不被切碎
- **MCP 整合**：可被 Agent 當原生能力呼叫

## 特點

- 零雲端 API、隱私優先
- 可腳本化
- 不替你寫 wiki，專注於檢索
- 適合離線或敏感資料場景

## 適用場景

- 工程師與重度筆記使用者
- 程式碼庫與技術文件搜尋
- 已有大量檔案、尚未決定是否上雲端向量庫的人

## 相關頁面

- [[Tobi Lütke]]
- [[LLM Wiki]]
- [[GBrain]]
- [[Skill vs Bash vs MCP]] — QMD 的 MCP 整合是 MCP 工具模式的實際應用案例
- [[三大知識管理系統比較]]
