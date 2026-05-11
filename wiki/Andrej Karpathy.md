---
title: Andrej Karpathy
type: entity
sources: [向三位大師學AI筆記.md, karpathy筆記實作.md, LLM Wiki.md, sequoia-ascent-2026-summary-karpathy.md, 你可以外包思考但不能外包理解karpathy-最新訪談精華心得ai-時代的真正競爭力.md]
created: 2026-04-13
updated: 2026-05-11
tags: [人物, AI, 深度學習, 教育者]
---

# Andrej Karpathy

深度學習與生成式 AI 領域最具辨識度的實作者與教育者之一。

## 背景

- Stanford 博士，師承視覺與學習研究脈絡
- 經典公開課 CS231n（卷積神經網路與視覺辨識）影響整代工程師
- OpenAI 創立初期研究科學家
- Tesla AI 總監（Director of AI），主導 Autopilot 神經網路與電腦視覺
- 近年再度與 OpenAI 深度合作
- 2024 年創辦 Eureka Labs，延伸至 AI 原生教育產品
- 提出「Software 2.0」「Software 3.0」「vibe coding」「Agentic Engineering」「Jagged Intelligence」「Ghosts vs Animals」等概念

## 知識管理貢獻

提出 [[LLM Wiki]] 模式——不是軟體，而是一種工作模式：

> 用不可變的原始資料當地基，用 LLM 維護一層持久性 wiki，再用一份 schema 約束攝入、查詢與健檢流程。

核心洞見：**好編纂勝過好檢索**——知識要在多次對話與多份來源中被寫進結構，而不是每次都從零拼湊。

隱喻：**羅盤**——你的知識庫應該像 wiki 一樣會長大，而不是像上傳檔案一樣被反覆檢索。

⭐ **2026-04-30 在 Sequoia AI Ascent**：Karpathy 對 founders 將 [[LLM Wiki]] 列為「以前不可能、現在自然」的代表案例——**本 wiki 專案是他向矽谷推銷之方法論的具體實踐**。

## 2026-04-30 Sequoia 訪談的核心金句

> **You can outsource your thinking, but you can't outsource your understanding.**

連結 Karpathy 的教育哲學——AI 把執行成本壓近零，但「方向、品味、判斷」的單價持續上漲。

## 概念貢獻

| 概念 | 簡述 | 主要來源 |
|------|------|----------|
| **Software 1.0** | 人類寫顯式 code | 早年命名 |
| **Software 2.0** | 神經網路權重學習 | 2017 blog |
| **Software 3.0** | LLM context window 是新程式 | Sequoia 2026 |
| **Vibe Coding** | 任何人都能造軟體 | 2024 推文 |
| **Agentic Engineering** | 專業團隊的天花板 | Sequoia 2026 |
| **Jagged Intelligence** | AI 能力分布鋸齒狀（高峰 + 深谷） | Sequoia 2026 |
| **Verifiability** | LLM 自動化可驗證任務 | bearblog post |
| **Ghosts vs Animals** | LLM 是統計模擬，不是生物智慧 | bearblog post |
| **LLM Wiki** | 用 agent 增量編譯知識庫 | gist + 2026 推廣 |

## 相關頁面

### Source 頁
- [[src-karpathy-sequoia-ascent-2026]] — ⭐ 最完整的 Karpathy 思想集成（2026-04-30 Sequoia 訪談）
- [[src-向三位大師學AI筆記]]
- [[src-karpathy筆記實作]]
- [[src-LLM Wiki]]
- [[src-andrej-karpathy-skills]]

### 概念頁
- [[LLM Wiki]]
- [[三大知識管理系統比較]]
- [[Multi-Agent 失敗分類學]] — Karpathy 提的「adversarial agent 測試」與 MAST 思路同源
- [[AI 品質共謀]] — MenuGen 支付 bug 是 Karpathy 親自舉的「結構性 agent 失敗」案例
