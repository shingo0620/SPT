---
title: AI 輔助軟體工程
type: concept
sources: [dotllm-building-llm-inference-engine-in-csharp.md, My AI-Assisted workflow.md, mattpocock-skills-repo.md, 做 AI Agent 最痛苦的事：明明看了很多教程，最后还是做不对....md, yt-為什麼-claude-code-有時很聰明有時又很蠢五個底層概念讓你秒懂.md, how-to-kill-the-code-review-by-ankit-jain-latentspace.md]
created: 2026-04-15
updated: 2026-04-16
tags: [AI, 軟體工程, 方法論]
---

# AI 輔助軟體工程

利用 LLM 進行結構化軟體開發的方法論。核心原則：人類主導架構與設計決策，AI 負責實作與程式碼產出，透過結構化文件確保品質與一致性。

## 核心原則

### 規劃文件即方法論

來自 dotLLM 專案的實戰洞見：

> "Planning documentation IS the development methodology"

兩份關鍵文件：
- **ROADMAP.md**：拆解為可執行的步驟，標註依賴關係與階段
- **CLAUDE.md**：定義 AI 的行為邊界、專案脈絡與慣例

這與 [[LLM Wiki]] 使用 CLAUDE.md 作為知識庫 profile 的做法一致——結構化文件引導 AI 行為，比口頭指令更穩定可靠。

### 人機分工邊界

| 必須由人類做 | 可委託 AI 做 |
|-------------|-------------|
| 架構決策與技術選型 | 程式碼實作 |
| 品味判斷與設計取捨 | 除錯與修正 |
| 需求定義與優先排序 | PR review（作為第二意見） |
| 驗收與品質判斷 | 文件撰寫 |

「架構決策由人類做」這個原則在 [[src-Code Review已死]] 中被進一步延伸為「Review Intent not Code」——人類最有價值的判斷在第一行程式碼生成之前（審 spec/plan/constraints），而非之後（審 500 行 diff）。

### 雙重 review 分離

實作者與審查者使用不同 AI，各自獨立抓出不同類型的 bug：
- **實作**：Claude Code
- **審查**：Codex、Gemini（獨立於實作者）

此模式的價值在於消除確認偏差——同一個 AI 審查自己的程式碼容易放過自身的盲點。

## 與 [[AI 輔助遊戲開發]] 的比較

| 面向 | AI 輔助遊戲開發 | AI 輔助軟體工程 |
|------|----------------|----------------|
| 規模 | 小型，數小時～數天 | 中大型，數週～數月 |
| 規劃 | 心智圖四問法，輕量 | ROADMAP.md，60 步驟 7 階段 |
| 品質控制 | 迭代修正（看到什麼醜修什麼） | 結構化 PR review + 雙重審查 |
| 瓶頸 | 設計判斷與美術 | 架構決策與效能調校 |
| 共通點 | **人類負責設計判斷，AI 負責實作** |

兩者的共通洞見：AI 輔助開發的成功不取決於 AI 的能力，而取決於**人類的規劃與判斷品質**。

## 完整工作流程（Matteo Barbero 方法）

來自 [[src-AI輔助工作流程]]，提供了比 dotLLM 更細緻的逐步流程：

```
自由筆記 → PRD（結構化訪談） → Issues（垂直切片，AFK/HITL 分類）
  → Tasks（單一 session 指令） → AI 寫程式（全新 session）
    → 6 層 Code Review → 跨模組最終稽核
```

關鍵設計：
- **AFK vs HITL**：每個 issue 標記 AI 能否獨立完成，最大化自主比例
- **每個 task 用全新 session**：避免 context drift
- **6 層 review**：特別注意 AI 常犯的「操作順序錯誤」（通知在交易提交前發出等）

## Agent 架構演進的教訓

來自 [[src-AI-Agent避坑指南]]（数字黑魔法，三個月 AI Agent 實作經驗）：

### Plan-and-Execute 是工作方式，不是架構圖

「先想再做」是正確的，但不代表必須建專門的 Planner 和 Executor 組件。教科書式的三層架構（主 Agent → 規劃 → 子 Agent 執行）在實務中造成：小改動成本過高、主 Agent 越權。真實產品（如 OpenCode）的職責邊界遠比教程模糊。

### 長任務需要 Restatement

擴展到 100+ 步驟後，即使有 TodoList，仍出現趕工、規則失效、輸出同質化。根因是 **LLM 注意力分布**——中段資訊被忽略。解法是 [[Restatement]]：週期性將任務進度和規則重新推回注意力最強的位置。

這與本頁「每個 task 開全新 session」的建議互補——全新 session 是最極端的上下文隔離，而 Restatement 提供在同一 session 內也能維持控制力的方案。

## 實踐建議

1. **先寫規劃文件再寫程式碼**——ROADMAP.md 定義做什麼，CLAUDE.md 定義怎麼做
2. **拆解為可驗證的小步驟**——每步有明確的完成標準
3. **標註依賴關係**——哪些步驟可以平行，哪些必須循序
4. **用不同 AI 做 review**——消除實作者的確認偏差
5. **架構決策永遠由人類做**——AI 擅長在框架內填充，不擅長選擇框架
6. **用 AFK/HITL 分類最大化 AI 自主工作**——人類只在需要判斷時介入
7. **每個 task 開全新 session**——長 session 的累積上下文會讓 AI 偏離目標
8. **長任務搭配 Restatement**——週期性重申 TodoList 進度、Skill 規則與 Findings，靜態規則放 System Prompt、動態資訊追加到尾端（[[Restatement]]）

## 相關頁面

- [[src-Solo SaaS架構]] — Solo SaaS 開發者選擇語言的第一考量是「AI 寫得好」：Go/TypeScript 的 LLM 生成品質最穩定，直接印證了語言選擇對 AI 輔助開發的影響
- [[src-dotLLM]]
- [[src-AI輔助工作流程]]
- [[src-mattpocock-skills]]（具體工具集：write-a-prd、prd-to-issues、prd-to-plan）
- [[src-AI-Agent避坑指南]]（Agent 架構演進三部曲與 Restatement 機制）
- [[src-Harness Engineering]]（Harness = 認知框架 + 能力邊界 + 工作流程，與本頁方法論互補）
- [[Restatement]]（長任務控制力的核心機制）
- [[AI 輔助遊戲開發]]
- [[LLM Wiki]]（CLAUDE.md 作為 AI 行為指引的先例）
- [[Skill vs Bash vs MCP]]（AI 工具選擇方法論）
- [[src-Claude Code五個底層概念]]（概率/窗口/模型/循環/層級——LLM Agent 行為的五個心智模型）
- [[src-Code Review已死]]（Spec-driven development + Swiss-cheese 五層信任模型，Review Intent not Code）
