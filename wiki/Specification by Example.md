---
title: Specification by Example
type: concept
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [sbe, bdd, atdd, testing, requirements, ai-quality]
---

# Specification by Example（SBE）

> 本頁統整本 wiki 多處引用 SBE 的脈絡；來源為空表示為跨來源歸納。

## 一句話定位

由 Gojko Adzic 在 2011 年同名書中系統化的需求工程方法——**用具體例子建立規格、規格即自動化測試、測試即活文件**——讓「需求 → 測試 → 程式碼」三者透過共同的具體例子緊密對齊。

## 核心三主軸

1. **從例子建立規格**（Specification from Examples）
   - 不寫抽象描述（「系統應正確處理折扣」），而寫具體例子（「VIP 客戶買 3 件 8 折，VIP+生日 7 折」）
   - 例子由業務、開發、QA 三方在工作坊（specification workshop）共同確定
2. **規格即自動化測試**（Executable Specifications）
   - 例子寫成可執行的測試（Cucumber、SpecFlow、Robot Framework 等）
   - 規格不再是「Word 文件」，而是「Pass/Fail 的自動化驗證」
3. **活文件**（Living Documentation）
   - 測試套件即文件——永遠與程式碼同步，不會過時
   - 取代傳統需求文件、測試案例文件、API 文件分裂的問題

## 與 [[AI 品質共謀]] 的關聯（本 wiki 主要應用情境）

[[src-AI時代的測試管理]] 與 [[AI 品質共謀]] 將 SBE 視為**對抗 AI 同源誤解的核心解方**：

- **問題**：AI 同時寫 code 與測試時，雙方共用同一份「對需求的理解」——若理解錯誤，CI 全綠也通過，但 prod 直接出錯
- **SBE 解法**：
  1. **先用具體例子凍結需求**——例子由人類確定，AI 不參與
  2. **AI 寫 code 只能依例子**——不能自行擴展邏輯
  3. **AI 寫測試只能依例子**——不能依 code 反推測試案例
  4. **測試 = 規格 = 文件**——三者統一於具體例子，避免 AI 雙寫時的同源漂移

## 與 BDD / ATDD 的關係

| 方法 | 提出者 | 主要差異 |
|------|-------|---------|
| **TDD**（Test-Driven Development） | Kent Beck | 「先寫測試」——技術視角，主要面向開發者 |
| **ATDD**（Acceptance TDD） | 多人提出 | TDD 升級至「驗收層」——含業務人員定義 acceptance 條件 |
| **BDD**（Behavior-Driven Development） | Dan North | ATDD + Given-When-Then 句式——強調溝通用語 |
| **SBE**（Specification by Example） | Gojko Adzic | BDD 的方法論完整版——強調 specification workshop 與活文件 |

實務上 SBE 與 BDD 高度重疊，差異在於 SBE 更強調「workshop 過程 + 活文件成果」，BDD 更強調「Gherkin 語法 + 行為描述」。

## 工具

- **Cucumber**（Ruby/JavaScript/Java）——Gherkin 語法的最經典實作
- **SpecFlow**（.NET）
- **Robot Framework**（Python）——關鍵字驅動，較少 Gherkin 風格
- **JBehave**（Java）

## 在 [[AI 輔助軟體工程]] 中的關鍵地位

SBE 是 [[綜整-AI協作工程的六大趨勢]] 中**「規格驅動開發」**主軸的具體實作技術。當 AI 大量產出 code 時：
- 沒有 SBE → AI 自由發揮 → [[AI 品質共謀]]
- 有 SBE → AI 受規格約束 → 品質可預期

## 相關頁面

- [[AI 品質共謀]]（SBE 的主要應用情境）
- [[src-AI時代的測試管理]]（敏捷三叔詳細說明 SBE 與 AI 測試的整合）
- [[src-Code Review已死]]（提到 spec-driven development 為核心趨勢）
- [[綜整-AI協作工程的六大趨勢]]（規格驅動是六大趨勢之一）
- [[AI 輔助軟體工程]]（SBE 是其關鍵 enabler）
