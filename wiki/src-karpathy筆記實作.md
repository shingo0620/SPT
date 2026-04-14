---
title: Karpathy 筆記實作教學
type: source
sources: [karpathy筆記實作.md]
created: 2026-04-13
updated: 2026-04-13
tags: [LLM Wiki, Claude Code, 實作, 教學]
---

# Karpathy 筆記實作教學

## 摘要

一篇 [[LLM Wiki]] 的實作教學，說明如何用 Claude Code 五步建立個人知識庫。

## 實作步驟

1. 建立專案資料夾（如 `AI2027`）
2. 建立 `raw/` 子目錄
3. 將所有參考資料放入 `raw/`（支援 Word、Excel、PDF、MD、TXT）
4. 進入 Claude Code，貼入 LLM Wiki Prompt 範本
5. 加上客製化指令，讓 Claude Code 自動運作

## 客製化 Prompt 範例

> 「你是我專屬的 LLM Wiki Agent。請完成上面所有文字的內容實作，當作我的第二個大腦，並一步一步指導我。請建立 CLAUDE.md 作為 Schema 檔案，內含完整的運行規則。接著建立 index.md 和 log.md，定義資料夾的命名規範與傳統，並產出你的第一個文摘範例讓我確認。從現在開始，所有的互動都要遵守 Schema 規則，且全部使用繁體中文。」

## 持續更新流程

新檔案放入 `raw/`，跟 Claude Code 說「幫我整理新文件」即可自動編譯進 wiki。

## 核心論點：LLM Wiki 取代 RAG

- 傳統 RAG 需要向量資料庫與 Embedding 模型，複雜且知識不累積（每次基於資料碎片拼湊答案）
- LLM Wiki 等同建立 Graph 資料庫，速度快、成本低（只需訂閱 Claude）
- 可隨時發佈成網頁，供團隊或企業內部查詢
- Coding Agent 大幅消滅了 RAG 過去的複雜性

## 工具整合

- **Obsidian**：開啟專案目錄即可查看視覺化知識關聯圖
- **Claude Code**：核心引擎，驅動知識整理與 wiki 維護
- 可將 wiki 發佈成網頁

## 相關頁面

- [[LLM Wiki]]
- [[Andrej Karpathy]]
- [[src-向三位大師學AI筆記]]
