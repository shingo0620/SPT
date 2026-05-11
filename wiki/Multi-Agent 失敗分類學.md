---
title: Multi-Agent 失敗分類學（MAST）
type: concept
sources: [src-mast.md, sequoia-ascent-2026-summary-karpathy.md]
created: 2026-05-09
updated: 2026-05-11
tags: [multi-agent, mas, failure-taxonomy, mast, anti-pattern, llm-systems]
---

# Multi-Agent 失敗分類學（MAST）

## 定義

MAST（Multi-Agent System failure Taxonomy）是 UC Berkeley 團隊（Cemri et al., EMNLP 2025）建立的多 agent LLM 系統失敗模式分類框架，將 14 種失敗模式組織為 3 大類，基於 1,642 traces 跨 7 個主流 MAS 框架的實證標註。

## 核心結構

```
MAST 失敗（41-86.7% 整體失敗率）
├── FC1 System Design Issues (51.7%)        — 架構/規格/狀態管理
│   ├── FM-1.1 Disobey Task Specification
│   ├── FM-1.2 Disobey Role Specification
│   ├── FM-1.3 Step Repetition (15.7%)      ← FC1 最常見
│   ├── FM-1.4 Loss of Conversation History
│   └── FM-1.5 Unaware of Termination Conditions (12.4%)
├── FC2 Inter-Agent Misalignment (31.35%)   — 溝通/協作/協調
│   ├── FM-2.1 Conversation Reset
│   ├── FM-2.2 Fail to Ask for Clarification
│   ├── FM-2.3 Task Derailment
│   ├── FM-2.4 Information Withholding
│   ├── FM-2.5 Ignored Other Agent's Input
│   └── FM-2.6 Reasoning-Action Mismatch (13.2%)  ← 全 14 FM 中最高
└── FC3 Task Verification (16.5%)           — 品質/驗證/輸出檢查
    ├── FM-3.1 Premature Termination
    ├── FM-3.2 No/Incomplete Verification
    └── FM-3.3 Incorrect Verification (9.10%)
```

## 三類失敗的本質差異

| 類別 | 本質 | 核心解方方向 |
|------|------|-------------|
| **FC1 系統設計** | 規格 / 架構 / 狀態未明確定義 | 結構化規格（[[Specification by Example]]）+ 架構重設計 |
| **FC2 跨 agent 對齊** | agent 缺乏 theory of mind | 溝通協定 + 顯式 peer 資訊需求建模（不只是「更多訊息」） |
| **FC3 任務驗證** | 驗證鏈條失效（superficial check） | Multi-level verification（functional / behavioral / spec）+ 人類介入 |

## 「LLM 幻覺出不存在的 bug」在 MAST 的定位

> ⭐ 本概念頁特別處理 wiki [[index]] 上提及的知識缺口

「LLM 自己幻想出根本不存在的 bug 然後動手修」這個常見實務現象，在 MAST 中對應**多個 FM 的組合症狀**：

### 主要對應 FM（純多 agent 視角）

| FM | 對「幻覺 Bug」的貢獻 |
|----|--------------------|
| **FM-2.6 Reasoning-Action Mismatch（13.2% 最高）** | agent 想一套做另一套——實務常表現為「agent 認為 code 有 bug 並改它，但其實沒有」 |
| **FM-3.3 Incorrect Verification（9.10%）** | 驗證錯誤——系統認為「修好了不存在的問題」或「忽視真實問題」 |
| **FM-1.1 Disobey Task Specification** | 自我加碼執行使用者沒要求的事 = 多 agent 版的 [[Scope Creep 守恆律]] |
| **FM-2.3 Task Derailment** | 偏離原始目標走向「想像的問題」 |

### 多 agent 放大效應

論文提供的關鍵洞察：**個體 agent 幻覺，在多 agent 系統中會被「整個系統繼續處理」而非被質疑**——共謀放大版。對應：

- 沒有外部 reviewer agent 主動挑戰前 agent 的判斷 → FM-2.5 Ignored Other Agent's Input
- 沒有 spec-level verifier → FM-3.2 No/Incomplete Verification
- 沒有「停下來確認需求」機制 → FM-2.2 Fail to Ask for Clarification

### 與 [[AI 品質共謀]] 的同構性

[[AI 品質共謀]] = 單 agent 同時 code + test 的同源誤解；MAST FC3 = 多 agent 系統驗證鏈條失效——**結構同構，量級不同**。

---

## 與本 wiki 其他失敗論述的對位

### 「AI 寫 code 反模式三件套」的學術擴充

wiki 既有的「AI 寫 code 反模式三件套」（出自 [[src-overthinking-scope-creep-structural-diffing]]）：
1. [[AI 品質共謀]] — code + test 同源誤解
2. [[Scope Creep 守恆律]] — AI 加速被多餘抵消
3. [[Specification by Example]] — 規格凍結解方

**MAST 的擴充**：
- 提供前兩項的**多 agent 系統實證**（不再只是個案軼事）
- 證實第三項（[[Specification by Example]]）的必要性——FM-1.1 Disobey Task Specification 就是「規格不夠明確」的學術證據

### 與 [[src-andrej-karpathy-skills]] 4 原則的對位

| Karpathy 4 原則（單 agent） | MAST 對應的多 agent FM |
|------------------------|----------------------|
| Think Before Coding | FM-2.2 Fail to Ask for Clarification |
| Simplicity First | FM-1.3 Step Repetition + FM-2.3 Task Derailment |
| Surgical Changes | FM-1.1 Disobey Task Specification |
| Goal-Driven Execution | FM-1.5 Unaware of Termination + FC3 Task Verification |

**啟示**：Karpathy 4 原則本質上是「單 agent harness」，MAST 揭示這些原則放大到多 agent 系統時的**新失敗面向**——尤其是 FC2（agent 之間的協調）。

### 與 Swiss-cheese 模型對位（[[src-Code Review已死]]）

[[src-Code Review已死]] 的 Swiss-cheese 五層信任：
1. Code 審查
2. Build 過程
3. Test 系統
4. Spec / Acceptance
5. 監控 / 觀察

對應 MAST：
- 第 1-3 層失效 = FC3 No/Incomplete Verification
- 第 4 層失效 = FC1 Disobey Task Specification + FC3 Incorrect Verification
- 第 5 層失效 = MAST 倡議但未涵蓋的「線上行為驗證」（論文限制）

### 與 [[綜整-AI協作工程的六大趨勢]] 的證據基礎

| 趨勢 | MAST 提供的證據 |
|------|---------------|
| 趨勢二：review 是新瓶頸 | FC3 Task Verification 16.5%；多級驗證缺乏 |
| 趨勢三：人類判斷上游遷移 | FC1 51.7%——架構與規格設計仍需要人類 |
| 趨勢四：spec 比 code 更重要 | FM-1.1 Disobey Task Specification 反證規格不夠明確 |

---

## 工程化解方對位

| 解方類型 | 既有 wiki 概念 | MAST 對應的 FM |
|----------|--------------|----------------|
| 規格凍結 | [[Specification by Example]] | FM-1.1 / FM-2.3 |
| 對抗式多 agent | [[src-bug-hunter]] | FC2 全部 + FC3 全部 |
| 結構化方法論 | [[AI 輔助軟體工程]] | FC1 全部 |
| 上下文隔離 | [[src-AI-Agent避坑指南]] | FM-1.4 + FM-2.4 |
| Multi-LLM cross-review | `src-github-trending-2026-04` GodModeSkill | FC3 全部 |

---

## 量化重要性

MAST 的價值在於**首次提供量化基準**：
- 整體失敗率 41-86.7% — 多 agent 系統並非「比單 agent 好」的預設假設
- FC1 過半（51.7%）— 設計問題壓倒模型能力問題
- 同 base model 在好設計下提升 15.6% — 「環境比模型聰明」的學術證據

對應 [[src-agent-model-body-harness]]「agent = model + body + harness」三層拆解：
- MAST 的 FC1 = harness 層失敗
- MAST 的 FC2 = body 層協作失敗
- MAST 的 FC3 = harness + body 結合層失敗

**並非 model 層的 hallucination 問題**——這是 MAST 對「LLM 幻覺說」最重要的修正。

---

## Karpathy 在 Sequoia 2026 的對位

[[src-karpathy-sequoia-ascent-2026]]（2026-04-30）多處呼應 MAST：

| Karpathy 觀點 | MAST 對應 |
|--------------|----------|
| 「MenuGen 支付 bug：agent 用 email 配對 Stripe + Google」 | FM-1.4 Information Withholding（agent 沒主動問「用什麼 ID 連結」）+ FM-1.1 Disobey Specification（沒實作 persistent user ID）|
| 「Agent 負責填空，你負責判斷該畫哪些空格」 | FC1 51.7% 設計失敗——人類仍需設計 spec |
| 「Hire by adversarial multi-agent project」 | FC2 + FC3 = 48% 的失敗可透過 adversarial 設計暴露 |
| 「Vibe Coding raise floor / Agentic Engineering raise ceiling」 | MAST 量化了「ceiling」的具體障礙 |
| 「Jagged Intelligence」 | 解釋為何同一模型在 MAS 中 41-86.7% 失敗：on/off the model's rails |

→ **MAST 是 Karpathy「Agentic Engineering 是專業學科」論點的學術依據**。

---

## 來源

本概念由 [[src-mast]]（Cemri et al., arXiv:2503.13657, EMNLP 2025）提出。Karpathy Sequoia 訪談對位由 [[src-karpathy-sequoia-ascent-2026]] 補充。
