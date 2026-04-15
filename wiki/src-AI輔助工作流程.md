---
title: My AI-Assisted Workflow——Tech Lead 的結構化 AI 開發工作流
type: source
sources: [My AI-Assisted workflow.md]
created: 2026-04-15
updated: 2026-04-15
tags: [AI輔助開發, 軟體工程, 方法論]
---

# My AI-Assisted Workflow——Tech Lead 的結構化 AI 開發工作流

## 來源資訊

- 作者：Matteo Barbero
- 連結：https://www.maiobarbero.dev/articles/ai-assisted-workflow/
- 發布日期：2026-04-14

## 摘要

一位 Tech Lead 分享他從「開聊天視窗直接寫程式」到「結構化 AI 輔助開發」的轉變。核心洞見：**真正的工作在寫程式之前就完成了**。AI 擅長實作，但釐清需求、找出盲點、判斷取捨是人類不可替代的工作。

## 核心哲學

> "The real work happens before the coding starts."

AI 做得好的：實作。
AI 做不好的：搞清楚你到底要什麼、抓出你沒說明白的假設、告訴你心智模型哪裡有錯。

## 7 步驟工作流程

### 1. 自由筆記（Free-form Plan）

用白話寫下問題、初步想法、限制條件、不確定的地方。不是交付物，只給自己看。**品質決定一切下游產出。**

### 2. PRD（結構化訪談產出）

用 skill 對自己的計畫做結構化訪談——逼你回答具體問題：
- 「使用者沒登入時怎麼辦？」
- 「這個操作部分失敗會怎樣？」
- 「你說要取代現有功能，依賴舊行為的使用者怎麼辦？」

產出：問題描述、解法、User Stories、實作決策、模組設計、測試決策、明確排除項目。

### 3. Issues（垂直切片拆解）

PRD 拆成 vertical slices——每個 issue 貫穿所有整合層（不能只碰 DB 或只碰 UI）。每個 issue 標記為：
- **AFK**：AI 可獨立完成並合併，不需人類介入
- **HITL**：某個點需要人類決策

盡量讓更多 issue 是 AFK，減少人類成為瓶頸。

### 4. Tasks（單一 session 指令）

每個 issue 拆成具體 tasks。限制：**一個 task 必須在一個 AI session 內完成**。太大就拆。

Task 描述是寫給 AI 的指令，不是給人的筆記——指定要碰哪些檔案、遵循什麼 pattern、完成的樣子。

### 5. 交接給 AI 寫程式

每個 task 用**全新 session**。刻意避免長 session 的 context drift——累積上下文會讓 AI 基於「已經做了什麼」而非「該做什麼」來決策。

HITL task 到了需要人類決策的點就停下，做完決定後更新 task 檔案再繼續。

### 6. Code Review（6 層）

每個 PR 做 6 層 review：邏輯錯誤、操作順序、壞習慣、安全性、魔法字串/值、pattern 改進。

**特別注意操作順序**——AI 產出的程式碼常做對的事但順序錯：提交交易前就發通知、驗證輸入前就改狀態。

### 7. 最終稽核（Final Audit）

功能完成後做跨模組稽核：模組間不一致、錯誤 pattern 被複製到各處、安全假設在整體面看崩潰。

先讀完整個實作再標問題。未經核准不自動修。

## 與 [[AI 輔助軟體工程]] 的關係

兩篇文章互補：
- **dotLLM**（Konrad Kokosa）：強調「規劃文件即方法論」+ 雙重 review 分離
- **本文**（Matteo Barbero）：提供完整的 7 步驟工作流程 + AFK/HITL 分類 + 垂直切片拆解

共通原則：**AI 加速產出，review 永遠是你的事。**

## 相關頁面

- [[AI 輔助軟體工程]]
- [[src-dotLLM]]
- [[AI 輔助遊戲開發]]
