---
title: AI 輔助軟體工程
type: concept
sources: [dotllm-building-llm-inference-engine-in-csharp.md, My AI-Assisted workflow.md, mattpocock-skills-repo.md]
created: 2026-04-15
updated: 2026-04-15
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

## 實踐建議

1. **先寫規劃文件再寫程式碼**——ROADMAP.md 定義做什麼，CLAUDE.md 定義怎麼做
2. **拆解為可驗證的小步驟**——每步有明確的完成標準
3. **標註依賴關係**——哪些步驟可以平行，哪些必須循序
4. **用不同 AI 做 review**——消除實作者的確認偏差
5. **架構決策永遠由人類做**——AI 擅長在框架內填充，不擅長選擇框架
6. **用 AFK/HITL 分類最大化 AI 自主工作**——人類只在需要判斷時介入
7. **每個 task 開全新 session**——長 session 的累積上下文會讓 AI 偏離目標

## 相關頁面

- [[src-dotLLM]]
- [[src-AI輔助工作流程]]
- [[src-mattpocock-skills]]（具體工具集：write-a-prd、prd-to-issues、prd-to-plan）
- [[AI 輔助遊戲開發]]
- [[LLM Wiki]]（CLAUDE.md 作為 AI 行為指引的先例）
- [[Skill vs Bash vs MCP]]（AI 工具選擇方法論）
