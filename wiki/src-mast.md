---
title: "Why Do Multi-Agent LLM Systems Fail? — UC Berkeley MAST 分類學"
type: source
sources: [250313657-why-do-multi-agent-llm-systems-failopen-searchopen-navigation-menucontact-arxivsubscribe-to-arxiv-mailings.md]
source_url: https://arxiv.org/abs/2503.13657
created: 2026-05-09
updated: 2026-05-09
tags: [multi-agent, mas, failure-taxonomy, mast, uc-berkeley, arxiv, llm-systems]
---

# Why Do Multi-Agent LLM Systems Fail? — UC Berkeley MAST 分類學

> **arXiv:2503.13657**（v1 2025-03-17 / v2 2025-04-22 / **v3 2025-10-26 EMNLP 2025**）
> 作者：Mert Cemri 等 13 人（UC Berkeley + Sky Computing Lab；含 Matei Zaharia / Ion Stoica / Joseph E. Gonzalez / Dan Klein / Kurt Keutzer / Aditya Parameswaran / Kannan Ramchandran 等大咖）
> 一句話：**第一個多 agent LLM 系統失敗的學術級分類學——14 種失敗模式 / 3 大類，覆蓋 7 個主流 MAS 框架，整體失敗率 41-86.7%**

---

## 一句話定位

論文以 1,642 traces 系統性標註（人類專家 κ=0.88 + LLM-as-Judge κ=0.77）建立 **MAST**（Multi-Agent System failure Taxonomy），是迄今最嚴謹的「多 agent LLM 為何會失敗」研究。

---

## 核心發現：MAST 14 種失敗模式

### **FC1 System Design Issues（51.7% — 過半失敗）**

架構設計、prompt 規格、狀態管理層面的失敗。

| FM | 名稱 | 描述 | 流行率 / 範例 |
|----|------|------|-------------|
| FM-1.1 | Disobey Task Specification | Agent 不遵守任務約束 | ChatDev 即使被明確要求「隨機選詞」仍生成固定詞庫的 Wordle |
| FM-1.2 | Disobey Role Specification | Agent 違反定義的職責 | 「CPO agent 未經 CEO 共識自行終止對話」 |
| FM-1.3 | Step Repetition | 不必要重複已完成步驟 | **15.7%**（單一 FM 中第二高） |
| FM-1.4 | Loss of Conversation History | 上下文截斷導致回到先前狀態 | 2.80% |
| FM-1.5 | Unaware of Termination Conditions | 無法識別任務完成 | 12.4% |

### **FC2 Inter-Agent Misalignment（31.35%）**

agent 之間溝通、協作、協調的失敗。

| FM | 名稱 | 描述 | 流行率 / 範例 |
|----|------|------|-------------|
| FM-2.1 | Conversation Reset | 無故對話重置失去進度 | 2.20% |
| FM-2.2 | Fail to Ask for Clarification | agent 不問澄清直接執行 | 6.80% |
| FM-2.3 | Task Derailment | 偏離原始目標 | 7.40% |
| FM-2.4 | Information Withholding | 未對 peer 傳達關鍵資訊 | 「Phone Agent 未分享 API username 格式要求」 |
| FM-2.5 | Ignored Other Agent's Input | 無視 peer 建議 | 1.90% |
| FM-2.6 | **Reasoning-Action Mismatch** | **邏輯推理與執行行動矛盾**（想一套做另一套） | **13.2%**（單一 FM 中最高） |

### **FC3 Task Verification（16.5%）**

品質控制、驗證、輸出檢查機制的失敗。

| FM | 名稱 | 描述 | 流行率 / 範例 |
|----|------|------|-------------|
| FM-3.1 | Premature Termination | 在目標達成前結束 | 「AppWorld 經常過早終止」 |
| FM-3.2 | No/Incomplete Verification | 表面檢查漏掉錯誤 | 「Chess 程式 compile 通過但 runtime 違反遊戲規則」 |
| FM-3.3 | Incorrect Verification | 驗證關鍵資訊失敗 | 9.10% |

---

## 7 個 MAS 框架評估範圍

| 框架 | 架構 | 主要任務 |
|------|------|----------|
| **ChatDev** | 階層式工作流，模擬軟體開發階段 | 軟體開發協作 |
| **MetaGPT** | 流水線架構，模擬公司 SOP | 軟體開發協作 |
| **HyperAgent** | 階層式 + 中央 planner 協調 specialists | 軟體工程 |
| **AppWorld** | 星型拓撲跨服務 API 任務 | 跨應用任務執行 |
| **AG2** | 通用 agent 構建與互動管理框架 | 多任務 |
| **Magentic-One** | 通用系統用於開放 web/檔案任務 | 一般 agent |
| **OpenManus** | 階層式協作 agent 框架 | 開源 Manus 替代 |

---

## 關鍵統計

| 指標 | 數值 |
|------|------|
| 整體失敗率（state-of-the-art 系統） | **41-86.7%** |
| FC1 system design issues | 51.7% |
| FC2 inter-agent misalignment | 31.35% |
| FC3 task verification | 16.5% |
| 標註資料集規模 | 1,642 traces / 1,600+ 執行 |
| 人類 inter-annotator agreement | **κ=0.88**（高） |
| LLM-as-Judge agreement vs 人類 | κ=0.77 |
| 良好 MAS 設計改善幅度（同 base model） | +15.6% |

跨模型分析涵蓋：**GPT-4 / Claude 3 / Qwen2.5 / CodeLlama**；跨任務分析：coding / math / general agent。

---

## 核心結論

1. **設計而非模型能力決定失敗**——「Good MAS design requires organizational understanding」；同樣 base model 在好設計下表現提升 15.6%
2. **FC2 需要更深 reasoning，不是溝通協定**——agent 缺乏「theory of mind」對 peer 資訊需求的理解
3. **多層級驗證是關鍵**——當前 verifier 只做 superficial check（compilation、syntax），缺 functional validation
4. **沒有 one-size-fits-all 解方**——不同 MAS 因架構選擇有不同失敗 profile

---

## 與本 wiki 的關聯

### 與 [[AI 品質共謀]] — FC3 = 驗證鏈條失效的學術版

[[AI 品質共謀]]（敏捷三叔提出）指出 AI 同時寫 code + test 形成「同源誤解」；MAST 的 FC3 Task Verification（16.5%）是這個現象的**架構級實證**：
- FM-3.2 No/Incomplete Verification + FM-3.3 Incorrect Verification 共佔 ~10%+
- 例：「Chess program 通過 compile 但 runtime 違反遊戲規則」——典型的「形式上完整但功能上失敗」

### 與 [[src-bug-hunter]] — multi-agent adversarial 設計的學術正當性

[[src-bug-hunter]]（codexstar69）提出「跨 7+ agent 平台的 adversarial multi-agent bug hunter」——MAST 提供學術依據：
- FC2（31.35%）需要「不同視角的 agent 互審」是直接解方
- bug-hunter 的「不同 role agent」對應 MAST 對 theory of mind 的呼籲
- **bug-hunter 是 MAST 的工程化回應，雖然發布時未引用 MAST**

### 與 [[src-Code Review已死]] — Swiss-cheese 五層信任的學術版

[[src-Code Review已死]] 提出 Swiss-cheese 五層信任模型；MAST 的「multi-level verification」呼籲對應：
- 當前 superficial check（compilation、syntax）= Swiss-cheese 第一、二層
- functional / behavioral / spec-level verification 是 MAST 倡議的「未來層」
- MAST 學術化證明 Code Review 已死論點的核心：**單層驗證不夠**

### 與 [[src-andrej-karpathy-skills]] — 單 agent vs 多 agent 互補

[[src-andrej-karpathy-skills]] 4 條原則（Think Before / Simplicity / Surgical / Goal-Driven）針對**單 agent** LLM coding pitfalls；MAST 是**多 agent 系統級**的進階版：
- Karpathy 觀察 → MAST 系統化分類
- 4 條原則部分對應 MAST FC1 / FC2（如 Think Before = FM-2.2「不問澄清」的解方）
- 兩者形成「個體層 + 系統層」雙層 LLM coding 失敗論述

### 與 [[Scope Creep 守恆律]] — 個體 vs 系統的 overthinking

Kevin Lynagh 的 Scope Creep 守恆律是**個人 indie 開發者**的 overthinking；MAST FM-1.3 Step Repetition（15.7%）是**多 agent 系統**的 overthinking——agent 重複已完成步驟。共同性：**LLM 加速 → 但被多餘步驟抵消**。

### 與 [[綜整-AI協作工程的六大趨勢]]

MAST 補足趨勢二（review 是新瓶頸）+ 趨勢三（人類判斷向上游遷移）的學術依據：
- review 瓶頸 = MAST FC3 task verification
- 人類判斷上游 = MAST 倡議的「multi-level verification + theory of mind」需要人類設計

---

## 對「LLM 幻覺出根本不存在的 bug」query 的回應

⭐ 使用者前次 query 指向「LLM 幻想出根本不存在的 bug」，本論文提供**部分但重要的補充**：

### 論文明確說「不是 hallucinating bugs」

論文核心結論：MAST 失敗源於**架構與協調問題**（design failures），**不是個體 agent 的 hallucination**。

### 但結構上仍有「幻覺 bug」現象

雖然論文不以「hallucination」框架論述，但以下 FM 結構上對應「LLM 幻想出不存在的 bug 然後動手修」：

1. **FM-2.6 Reasoning-Action Mismatch（13.2% 最高 FM）**
   - agent 想了一套，做另一套——實務上常表現為「agent 認為某 code 有 bug 並改它，但其實沒有」
   - 在多 agent 系統中，這種「幻想 bug」會被**整個系統繼續處理**而非被質疑

2. **FM-3.3 Incorrect Verification（9.10%）**
   - 驗證錯誤導致系統認為「修好了不存在的問題」或「忽視真實問題」

3. **FM-1.1 Disobey Task Specification + FM-2.3 Task Derailment**
   - agent 「自我加碼」執行使用者沒要求的事——對應 [[Scope Creep 守恆律]] 的多 agent 版本

### 學術 vs 實務的差距

| 角度 | 論文（學術） | 實務（query） |
|------|------------|---------------|
| 框架 | 系統設計失敗 | 個體 agent 幻覺 |
| 數據 | 1,642 traces 統計 | 個案軼事 |
| 解方 | 架構重設計 + multi-level verification | prompt 校準 + 規格凍結 |
| 涵蓋 | 多 agent 系統 | 單 agent + 多 agent 混合 |

**結論**：MAST 是「多 agent 系統的失敗為何發生」的系統論述；個體 agent 幻覺出 bug 是其中一個微觀症狀，但需要 **架構級 + 個體級雙重解方**。

延伸概念見 [[Multi-Agent 失敗分類學]]（基於本論文建立的概念頁）。

---

## 公開資源

論文公開釋出：
- **MAST-Data**：1,642 標註 traces 資料集
- **MAST 分類學**：14 模式 / 3 類完整定義
- **LLM annotator pipeline**：可擴展標註工具

---

## 查核備註

✅ Abstract 內容、作者列表、版本歷史均直接來自 arxiv.org，可信。

✅ 14 個 FM、3 大類、流行率（15.7% / 13.2% / 12.4% / 9.10% 等）來自 HTML 全文版本（v3 2025-10-26）。

✅ EMNLP 2025 接受訊息：v3 提交時間（2025-10）對應 EMNLP 2025 主會議週期（2025-11）。

⚠️ 7 個 MAS 框架的具體失敗 profile 對比（哪個框架最常觸發哪個 FM）需要讀完整論文 PDF 才能取得，本頁僅含 abstract + HTML 版本可取得的內容。

---

## 相關頁面

- [[Multi-Agent 失敗分類學]]（基於本論文的概念頁）
- [[AI 品質共謀]]（FC3 task verification 的工程描述版）
- [[src-bug-hunter]]（multi-agent adversarial 設計，MAST 的工程化回應）
- [[src-Code Review已死]](Swiss-cheese 五層信任 = MAST 多級 verification)
- [[src-andrej-karpathy-skills]](單 agent pitfalls 觀察)
- [[Scope Creep 守恆律]]（單個體 overthinking）
- [[綜整-AI協作工程的六大趨勢]](review 瓶頸 + 人類判斷上游軸線)
- [[Specification by Example]](規格凍結對抗 FM-1.1 / FM-2.3)
