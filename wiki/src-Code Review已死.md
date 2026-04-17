---
title: Code Review 已死——從審程式碼到審意圖
type: source
sources: [how-to-kill-the-code-review-by-ankit-jain-latentspace.md]
created: 2026-04-17
updated: 2026-04-17
tags: [Code Review, AI, 方法論, Spec-driven, BDD]
---

# Code Review 已死——從審程式碼到審意圖

## 來源資訊

- 作者：Ankit Jain（Aviator 創辦人兼 CEO）
- 發表：2026-03-02，Latent.Space（客座文章）
- 連結：https://www.latent.space/p/reviews-dead

## 核心主張

> 人類寫的程式碼在 2025 年已死，Code review 將在 2026 年死亡。

## 數據基礎

來自 Faros.ai 對 10,000+ 開發者、1,255 個團隊的調查（[原始資料](https://www.faros.ai/blog/ai-software-engineering)）：

| 指標 | 高 AI 採用率團隊表現 |
|------|---------------------|
| 完成任務量 | **+21%** |
| 合併 PR 數 | **+98%** |
| PR review 時間 | **+91%**（瓶頸加劇） |

兩件事同時指數成長：變更的**數量**與**規模**。人類無法消化這麼多程式碼，手動 code review 已無法匹配工作型態。

## 為什麼 AI Code Review 也只是買時間

- AI 寫程式碼 → AI 審程式碼，為什麼還需要漂亮的 review UI？
- 「fresh eyes」在 agent 時代只是另一個有相同盲點的 agent
- 價值在迭代循環中，不在事後的核准關卡
- 人類「我曾抓到 AI 犯蠢，所以必須永遠檢查」的直覺在當前規模下不可行

## 從 Review Code 到 Review Intent

- 檢查點可以移動——從瀑布式簽核到 CI，現在再次前移
- **Spec 成為 source of truth**，code 是 spec 的產物
- 人類審 spec、plan、constraints、acceptance criteria——不是 500 行 diff
- Human-in-the-loop 從「你寫對了嗎？」變成「**我們在解決正確的問題，用正確的約束嗎？**」
- 最有價值的人類判斷在**第一行程式碼生成之前**，不是之後

## Swiss-cheese 五層信任模型

> 沒有單一關卡能攔住所有問題。疊加不完美的過濾器，直到漏洞不再對齊。

| 層級 | 名稱 | 機制 | 說明 |
|------|------|------|------|
| Layer 1 | **Compare Multiple Options** | 多 agent 競爭 | 不讓一個 agent 做對，讓三個 agent 各自嘗試，選最佳方案。可用通過驗證步驟數、diff 大小、是否引入新依賴來排序 |
| Layer 2 | **Deterministic Guardrails** | test、type check、contract verification | 定義 pass/fail 的驗證步驟，agent 無法跟 failing test 談判。包含四個子層：coding guidelines → 組織級不變量 → domain contracts → acceptance criteria |
| Layer 3 | **Humans Define Acceptance Criteria** | BDD 框架驗證 | 人類定義「正確」長什麼樣，agent 實作，BDD 框架驗證。驗證標準必須來自 spec，不是來自實作 |
| Layer 4 | **Permission Systems as Architecture** | 最小權限範圍 | 修 `utils/dates.py` 的 bug → 只給該檔案與其測試檔的存取權。觸碰 auth、DB schema、新依賴 → 自動升級為人類審查 |
| Layer 5 | **Adversarial Verification** | Red team / Blue team 自動化 | 寫程式碼的 agent 與驗證的 agent 互不知情、互不信任。第三個 agent 主動攻擊，找邊界情況與失敗模式 |

## BDD 的復興

- 過去：BDD 是好主意但從未真正普及——因為寫 spec 是「寫程式碼之外的額外工作」
- 現在：**spec 不是額外工作，spec 就是主要產物**
  - 人類寫 spec（Given/When/Then）
  - Agent 實作
  - BDD 框架驗證
  - 人類不需讀實作，除非有東西壞了
- 人類做人類擅長的事：定義「正確」的意思、編碼商業邏輯與邊界情況、思考可能出錯的地方

## 結論

> **Ship fast, observe everything, revert faster.**
>
> 而不是：review slowly, miss bugs anyway, debug in production.

人類不可能在閱讀速度上超過機器。我們需要在**上游**——決策真正重要的地方——超越它們的思考能力。

## 交叉引用

- [[AI 輔助軟體工程]] — 「架構決策由人類做」的原則直接對應本文的「Review Intent not Code」。本文進一步論證：人類最有價值的判斷在第一行程式碼之前，不是之後
- [[src-mattpocock-skills]] — write-a-prd skill 正是 spec-driven development 的具體實踐。PRD 先行、acceptance criteria 驅動，與本文五層模型的 Layer 3 完全吻合

## 相關頁面

- [[AI 輔助軟體工程]]
- [[src-mattpocock-skills]]
- [[src-AI輔助工作流程]]
