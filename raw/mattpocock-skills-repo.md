---
source-url: "https://github.com/mattpocock/skills"
title: "Matt Pocock's Claude Code Skills Collection"
author: "Matt Pocock"
fetched: 2026-04-15
tags:
  - AI輔助開發
  - Claude Code
  - Skills
---

# Matt Pocock's Skills Repo

GitHub: https://github.com/mattpocock/skills
Stars: 15.2k | License: MIT

## Repo 結構（18 個 skills）

### Planning & Design
- write-a-prd/ — 寫 PRD（結構化訪談）
- prd-to-issues/ — PRD 拆成 GitHub Issues（垂直切片 + AFK/HITL）
- prd-to-plan/ — PRD 轉實作計畫（垂直切片 phases）
- grill-me/ — 對計畫做壓力測試訪談
- design-an-interface/ — 介面設計
- request-refactor-plan/ — 重構計畫

### Development
- tdd/ — 測試驅動開發
- improve-codebase-architecture/ — 改善架構
- scaffold-exercises/ — 建立練習框架
- triage-issue/ — Issue 分類
- github-triage/ — GitHub Issue 分類
- qa/ — QA 測試

### Tooling & Setup
- git-guardrails-claude-code/ — Git 安全護欄
- setup-pre-commit/ — Pre-commit hooks

### Writing & Knowledge
- edit-article/ — 編輯文章
- obsidian-vault/ — Obsidian 知識庫
- ubiquitous-language/ — 統一語言
- write-a-skill/ — 寫新 skill

---

## 核心 Skill：write-a-prd

### 流程

1. 請使用者詳細描述問題和潛在解法
2. 探索 repo 驗證斷言、理解現狀
3. **無情地訪談**（interview relentlessly）——沿每個設計分支逐一解決依賴
4. 勾勒需要建立/修改的主要模組——尋找可提取的 deep modules（封裝大量功能在簡單可測試介面後的模組）
5. 確認模組與使用者預期一致，確認哪些需要測試
6. 用模板寫 PRD，提交為 GitHub Issue

### PRD 模板結構

- **Problem Statement**：使用者視角的問題描述
- **Solution**：使用者視角的解法
- **User Stories**：極其詳盡的編號列表（格式：As an <actor>, I want a <feature>, so that <benefit>）
- **Implementation Decisions**：模組、介面、架構決策、Schema 變更、API 契約——不包含具體檔名或程式碼片段
- **Testing Decisions**：什麼該測、怎麼測、codebase 中類似測試的先例
- **Out of Scope**：明確排除項目
- **Further Notes**：補充說明

---

## 核心 Skill：prd-to-issues

### 流程

1. 取得 PRD（GitHub issue 編號或 URL）
2. 探索 codebase 理解現狀
3. 將 PRD 拆成 tracer bullet issues（垂直切片）
4. **向使用者確認**——展示每個 slice 的標題、AFK/HITL 類型、阻擋關係、對應的 user stories
5. 使用者確認後，按依賴順序建立 GitHub Issues

### 垂直切片規則

- 每個 slice 貫穿所有整合層（schema → API → UI → tests）
- 完成後可獨立 demo 或驗證
- 偏好多個薄切片而非少數厚切片

### AFK / HITL 分類

- **AFK**：可實作並合併，不需人類互動
- **HITL**：需要人類互動（架構決策、設計 review 等）
- 盡量偏好 AFK

### Issue 模板

```markdown
## Parent PRD
#<prd-issue-number>

## What to build
端到端行為的簡述。描述行為而非逐層實作。引用 PRD 而非複製內容。

## Acceptance criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Blocked by
- Blocked by #<issue-number>
或 "None - can start immediately"

## User stories addressed
- User story 3
- User story 7
```

---

## 核心 Skill：prd-to-plan

### 流程

1. 確認 PRD 在 context 中
2. 探索 codebase 理解架構、pattern、整合層
3. 辨識持久架構決策（routes、schema、data models、auth、第三方服務邊界）
4. 拆成 tracer bullet phases（垂直切片）
5. 向使用者確認粒度與分組
6. 寫入 `./plans/<feature-name>.md`

### 垂直切片規則（同 prd-to-issues）

額外規則：
- 不包含可能隨後續 phase 改變的具體檔名、函式名
- 包含持久決策：route paths、schema shapes、data model names

### Plan 模板

```markdown
# Plan: <Feature Name>
> Source PRD: <link>

## Architectural decisions
- Routes: ...
- Schema: ...
- Key models: ...

---

## Phase 1: <Title>
**User stories**: <list>

### What to build
端到端行為簡述

### Acceptance criteria
- [ ] ...
```
