---
title: Matt Pocock's Claude Code Skills——AI 輔助開發的具體工具集
type: source
sources: [mattpocock-skills-repo.md]
created: 2026-04-15
updated: 2026-04-15
tags: [AI輔助開發, Claude Code, Skills, 工具]
---

# Matt Pocock's Claude Code Skills

## 來源資訊

- 作者：Matt Pocock
- 連結：https://github.com/mattpocock/skills
- Stars：15.2k | License：MIT

## 摘要

18 個 Claude Code skills 的開源合集，是 [[src-AI輔助工作流程|Matteo Barbero 方法]] 的上游來源。提供了從 PRD 撰寫到 Issue 拆解的**具體可執行模板與流程**——補充了 Barbero 文章中未展開的操作細節。

## 三個核心 Skill

### 1. write-a-prd（撰寫 PRD）

**流程**：描述問題 → 探索 codebase → **無情地訪談**（interview relentlessly）→ 勾勒模組 → 確認 → 產出 PRD

關鍵設計：
- 訪談是沿設計樹的每個分支逐一走下去，逐個解決依賴
- 主動尋找 **deep modules**：封裝大量功能在簡單可測試介面後的模組（對比 shallow modules）
- PRD 不包含具體檔名或程式碼片段——因為它們很快就會過時

**PRD 模板結構**：

| 區塊 | 內容 |
|------|------|
| Problem Statement | 使用者視角的問題 |
| Solution | 使用者視角的解法 |
| User Stories | **極其詳盡**的編號列表 |
| Implementation Decisions | 模組、介面、架構、Schema、API 契約 |
| Testing Decisions | 什麼該測、怎麼測、先例 |
| Out of Scope | 明確排除 |

### 2. prd-to-issues（PRD → GitHub Issues）

**流程**：取得 PRD → 探索 codebase → 拆成垂直切片 → **向使用者確認** → 按依賴順序建立 Issues

**垂直切片規則**：
- 每個 slice 貫穿所有整合層（schema → API → UI → tests）
- 完成後可獨立 demo 或驗證
- 偏好多個薄切片而非少數厚切片

**AFK/HITL 分類**：
- **AFK**：AI 可獨立實作並合併
- **HITL**：需要人類互動（架構決策、設計 review）
- 設計目標：盡量偏好 AFK

**Issue 模板**：

```
## Parent PRD
#<prd-issue-number>

## What to build
端到端行為簡述（引用 PRD，不複製）

## Acceptance criteria
- [ ] ...

## Blocked by
- #<issue-number> 或 "None"

## User stories addressed
- User story 3, 7
```

**確認步驟**（在建立 issues 之前）：
1. 粒度正確嗎？太粗 / 太細？
2. 依賴關係對嗎？
3. 有該合併或拆開的嗎？
4. AFK/HITL 標記正確嗎？

### 3. prd-to-plan（PRD → 實作計畫）

與 prd-to-issues 類似，但產出是本地 Markdown 檔案（`./plans/<feature>.md`），不建 GitHub Issues。

額外步驟：先辨識**持久架構決策**（routes、schema、data models、auth、第三方服務邊界），寫在計畫 header 讓所有 phase 引用。

額外規則：不包含可能隨後續 phase 改變的具體檔名/函式名，只包含持久決策。

## 與既有 wiki 概念的關係

| 概念 | 連結 |
|------|------|
| [[AI 輔助軟體工程]] | 本 skill 集是該概念的**具體工具實現** |
| [[src-AI輔助工作流程]] | Barbero 的工作流程改編自本 skill 集 |
| [[src-dotLLM]] | dotLLM 的 ROADMAP.md 對應 prd-to-plan 的計畫模板 |
| [[垂直切片]] | 遊戲開發的垂直切片概念，在軟體工程中有完全對應的實踐 |
| [[src-Code Review已死]] | write-a-prd skill 正是 spec-driven development 的具體實踐，與五層信任模型 Layer 3（Humans Define Acceptance Criteria）完全吻合 |

## 相關頁面

- [[AI 輔助軟體工程]]
- [[src-AI輔助工作流程]]
- [[src-dotLLM]]
- [[垂直切片]]
- [[src-Code Review已死]]
