---
title: AI Agent 避坑指南——從冗餘架構到注意力管理
type: source
sources: [做 AI Agent 最痛苦的事：明明看了很多教程，最后还是做不对....md]
created: 2026-04-16
updated: 2026-04-16
tags: [AI Agent, 架構設計, Skill, Restatement, Context Engineering, 長任務]
---

# AI Agent 避坑指南——從冗餘架構到注意力管理

## 來源資訊

- 作者：数字黑魔法
- 連結：https://www.youtube.com/watch?v=eWFKPPgHMCw
- 發布日期：2026-04-07
- 類型：YouTube 逐字稿（約 20 分鐘）

## 摘要

作者用三個月實作一個 AI 視頻生成 Agent（自動產生講解動畫），歷經三次架構轉變，從教科書式的 Plan-and-Execute 出發，踩過冗餘設計、長任務失控、輸出同質化等坑。全文刻意避免推銷特定框架名詞，而是聚焦「為什麼需要這個東西」的底層邏輯。

## 三次架構演進

### 第一版：標準 Plan-and-Execute

```
主 Agent（Orchestration）
 ├── Design Sub-Agent
 └── Coding Sub-Agent
```

**問題**：
- 小改動成本太高——改一行代碼也要走完整編排流程
- 主 Agent 越權——不管怎麼在 prompt 強調職責邊界，它還是自己動手改代碼
- 與 OpenCode 等成功開源專案對照：真實產品的主 Agent 既能編排又能寫代碼，Sub-Agent 也能寫代碼——「工整的分層」是架構強迫症

**洞察**：Plan-and-Execute 是一種**工作方式**，不是組織架構圖。不必為它建專門的 Planner 和 Executor 組件。

### 第二版：Skill 取代 Sub-Agent

將 Sub-Agent 的 system prompt 原封不動變成 Skill（動態 prompt 注入），在需要時注入主 Agent 的上下文。

**結果**：
- 效能不降反升，Token 開銷降低
- 上下文天然繼承——不需要設計「如何傳圖片給 Sub-Agent」等通訊流程
- 整個 Infra 被「壓平」，架構更簡單、通訊鏈路更短

**核心洞察**：不是 Skill 替代了 Sub-Agent，而是 Skill 暴露了**原本的 Sub-Agent 就是冗餘設計**。

### 第三版：Sub-Agent 回歸（上下文隔離）

擴展到 100+ 段代碼的長任務後，即使有 TodoList 記憶系統，仍出現三大問題：

| 症狀 | 表現 | 根因 |
|------|------|------|
| 趕工 | 後期把 80-85 段一起生成 | 上下文越長，模型傾向壓縮輸出 |
| 規則失效 | Skill 規則到後期不再被遵守 | 早期注入的 Skill 被大量內容「埋掉」 |
| 同質化 | 後期輸出複製前面的寫法 | 模型看到前面的代碼就傾向模仿 |

三個症狀指向**同一個根因**：LLM 注意力分布不均——System Prompt 和最新內容注意力最強，中段資訊被忽略。

**解法**：重新引入 Sub-Agent，但目的完全不同——**上下文隔離**。給局部任務乾淨的上下文窗口，注入必要的 [[Restatement]] 資訊，屏蔽已生成的代碼結果。

## Restatement 機制（重點）

TodoList 真正的價值不是「記錄」而是「重申」——不斷把任務資訊推回注意力最強的位置。

### 靜態 vs 動態資訊的放置策略

| 類型 | 內容 | 放置位置 | 原因 |
|------|------|----------|------|
| 靜態規則 | 代碼風格、輸出格式 | System Prompt | 始終可見、KV Cache 可複用 |
| 動態資訊 | 計劃、TodoList、Skill | 上下文尾端追加 | 避免改動 System Prompt 導致 KV Cache 失效 |

### KV Cache 的實務影響

- 模型對已計算的上下文做 KV 快取，新增內容只需計算增量
- **修改 System Prompt 的任何一個字**，從修改位置起的整條快取鏈都要重算
- 因此動態 Restatement 應追加到尾端，不應反覆修改 System Prompt

### Restatement 的完整內容

僅重申 TodoList（做到哪一步）是不夠的，還需週期性重申：
- **下一步是什麼**（任務）
- **下一步怎麼做**（Skill 規則）
- **Findings 和 Plan**（累積發現與整體計劃）

> 在長任務裡面，適當地重複、適當地廢話，不是浪費，而是必要的控制手段。

## 核心哲學

- 不要因為「看起來高級」就套用架構——問自己「我的系統真的需要這個東西嗎？」
- 每個概念（Skill、Harness、Sub-Agent）之所以被提出，是因為在某些場景被驗證有效，但不代表適用於你的場景
- 真正的進步來自：閱讀 AI 的實際輸出 → 找到哪裡不好 → 理解為什麼不好 → 一點一點改

## 相關頁面

- [[Restatement]]——本文核心概念的獨立頁面
- [[Skill vs Bash vs MCP]]——Skill 的定位與限制
- [[AI 輔助軟體工程]]——Agent 架構演進的更大脈絡
- [[LLM Wiki]]——知識管理中也面臨長上下文問題
