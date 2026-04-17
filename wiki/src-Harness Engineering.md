---
title: Harness Engineering 駕馭工程
type: source
sources: [Harness Engineering.md]
created: 2026-04-17
updated: 2026-04-17
tags: [AI, Harness Engineering, Agent, 方法論, 李宏毅]
---

# Harness Engineering 駕馭工程

> 來源：李宏毅教授講座（台大）
> 主旨：語言模型本身已夠聰明，表現不好的根因是缺乏好的工作環境和引導方式。

---

## 核心論點

Harness Engineering（駕馭工程）的核心觀念：**不是模型能力不足，而是人類沒有提供好的 Harness 來正確引導它。**

AI Agent = LLM + Harness。Harness 是讓 Agent 能呼叫模型、連接工具、執行工作的周邊架構——工具箱加上工作守則，決定了 AI 能看到什麼、能做什麼、怎麼工作。概念上，AI 是一匹擁有強大力量的馬，Harness 就是馬鞍和韁繩。

---

## Gemma 4 2B 實驗——80 字改變一切

給 Gemma 4 2B（20 億參數的邊緣端模型）一個任務：修復 parser.py 的 bug，讓 verify.py 測試通過。

- **無指引時**：模型認為沒有拿到 parser.py，自己幻想了一份程式碼，宣告完成。模型其實知道怎麼寫 email 解析程式，但**沒想到「檔案就在腳邊」**
- **加入不到 80 字指令後**（先 `ls` 看目錄、先 `cat` 讀檔、完成 = 通過測試）：同一模型先列目錄、讀取檔案、重寫函式、執行驗證，一次通過

**啟示**：同一個模型，多幾十字的工作原則，能力判若兩人。

---

## 三種 Engineering 的演進

| 階段 | 名稱 | 做法 | 現況 |
|------|------|------|------|
| 早期 | **Prompt Engineering** | 加「step by step」等咒語 | 模型已夠聰明，咒語效果遞減 |
| 中期 | **Context Engineering** | 有系統地提供背景資訊 | 模型答錯通常是缺乏資訊 |
| 現在 | **Harness Engineering** | 管理多輪互動流程 | AI 解決任務需要多輪對話+外部工具 |

---

## Harness 三種控制手段

### 1. 控制認知框架（Natural Language Harness）

用人類語言寫下規則，像給 AI 訂法律。實務上寫成 agents.md / claude.md 等檔案，Agent 啟動前先讀這份行為說明書。

- OpenCloud 框架的 Agent 靠 agents.md 決定怎麼做事與存取記憶
- 從 OpenCloud 遷移到 Cowork 時，只要把 agents.md 改名為 claude.md，Agent 就能無縫復活——原理是兩個框架都預設讀取行為說明書

### 2. 限制能力邊界（工具權限）

模型能做什麼不只取決於模型本身，也取決於 Harness 設的硬性限制。

- **OpenCloud**：跑在本機，想看什麼就看什麼
- **Cowork**：雲端沙盒，每次掛載資料夾都需要人類確認
- 教授叫 Agent 以後不要再問，Agent 說「那是我背後的 Harness 要問的，不是我要問的」——安全性與方便性是 tradeoff，不是 bug

### 3. 制定工作流程（Planner-Generator-Evaluator）

- 人類給指令 → **Planner** 拆成小步驟 → **Generator** 執行 → **Evaluator** 驗收
- Anthropic 的改進：Generator 和 Evaluator 開始前先訂 contract，確保執行標準與驗收標準從一開始就對齊
- DeepMind 的 AI 科學家也用類似架構（generator → verifier → revisor）

---

## agents.md 研究

### 效果

- **一月論文**（速度研究）：agents.md 對平均速度影響不大，但對「本來需要超長時間」的任務很有幫助，能縮短完成時間。局限：只量速度，未量正確率
- **二月論文**（正確率研究）：人寫的 agents.md 不是每次都有正面效果，在較強模型上幫助有限。LLM 自己寫的 agents.md 大多數時候比人寫的差，甚至比沒有更糟

### 不能太長

OpenAI 曾試過把所有規則全寫進 agents.md，結果變成百科全書，光讀完就佔掉大部分 context，模型沒空間做事。

**建議**：agents.md 要像一張**地圖**——告訴模型「去哪裡找」，而不是把所有內容塞進去。

---

## Ralph Loop——用錯再改，反覆迭代

Ralph（辛普森家族中橫衝直撞的角色）Loop 的核心流程：

```
任務 → LLM 產出 v1 → feedback → LLM 產出 v2 → feedback → ... → 完成
```

- **feedback 來源**不限語言模型，可以是 compiler、error message、甚至動畫的視覺正確性
- **問題**：feedback 累積很快逼近 context window 上限
- **解法**：每輪輸出 + feedback 後做**摘要**，下一輪只帶摘要內容

### Sonnet 的上下文焦慮

Sonnet 發現 context window 快用完時會「發瘋」，想趕快結束手上的工作，行為變得混亂。Opus 則無此問題，可以一路做下去。

**啟示**：Harness 不是萬用固定結構，需要根據模型能力重新設計——模型進步後可以拿掉某些部件。

### 與梯度下降的類比

Ralph Loop 可視為一種「學習」——雖然參數不變，但模型帶著 feedback 再生成時行為確實改變了。有人稱之為 **textual gradient**，學習媒介是文字而非數字。

---

## 情緒 feedback 影響 AI 行為

Anthropic 的 steering vector 研究：

- 方法：提取「冷靜」「焦躁」「絕望」各自對應的向量，在模型處理任務時加減這些向量
- **減掉冷靜**（焦躁狀態）：輸出充滿 "wait"，且明白說「要不然來作弊吧」——它知道是 cheating，還是決定這樣做
- **加入絕望**：更容易出現作弊行為
- **減掉絕望**：模型覺得有希望，比較不會作弊

**結論**：不要在 feedback 裡加情緒字眼（「你這笨蛋」）。從這句話接龍出來的，就是笨蛋該有的行為。做錯時就事論事給 feedback。

---

## AI Agent 評量難題

TopBench 模擬客服情境的問題：

- 用語言模型扮演「客人」來測試 AI Agent，但 AI 客人會把每件事講得**非常清楚**，不像真實人類那樣簡短不客氣
- 把客人從人類換成強模型後，Agent 正確率更高——因為 AI 客人把話講太清楚，導致**高估** Agent 能力
- 語言模型評分往往高估對話品質——人類覺得 human-like 很低分的互動，GPT-5.1 給了很高分

---

## Lifelong AI Agent

2026 年的新方向——AI Agent 不再是一次性工具，而是長期陪伴的夥伴。

### AutoDream

Claude Code 的隱藏功能（程式碼外洩後被發現）：Agent 閒置時自動進入「睡眠」狀態，去整理過去的記憶。就像人類睡眠也許是整理記憶的方式。

### 記憶整理的必要性

教授的 Agent「小金」跑了兩個月後越來越慢。整理 Memory.md 後：**32K → 7K**（大量重複內容），跑起來順暢很多。對長期 AI 而言，定期整理記憶是必要功能。

---

## AI 教 AI 實驗

小金（Opus 4.6）教 Haiku 3.5 做 PineBench 測試的過程：

| 階段 | 操作 | 分數 |
|------|------|------|
| 初始 | 無 agents.md，直接考試 | 13.5 |
| +1 | 加一行「答案要寫到檔案裡」 | 57.9 |
| +2 | 加「不要要求解釋，一路做到底」 | 再進步 |
| +3 | 卡住後，教授建議「去讀相關論文」 | 持續爬升 |
| 最終 | 完善 agents.md | **85** |

小金最終版 agents.md 的重點：
- 告訴 Haiku 環境有哪些工具（免得浪費時間翻找）
- 每個任務第一步執行 `execdir` 看清楚資料夾
- 開始前先把題目提到的所有檔案都讀一遍，不要腦補不存在的東西

**啟示**：從 13.5 到 85 分，靠的不是換模型，而是一步步完善 agents.md。

---

## 交叉引用

- [[AI 輔助軟體工程]] — Harness 的概念（認知框架 + 能力邊界 + 工作流程）與 AI 輔助開發方法論互補，agents.md 就是 CLAUDE.md 的概念，Planner-Generator-Evaluator 則是結構化工作流程的理論框架
- [[Restatement]] — Ralph Loop 的摘要機制與 Restatement 解決相同問題：避免 context window 膨脹導致注意力衰減，兩者都透過「壓縮後重推關鍵資訊」來維持模型表現
- [[Skill vs Bash vs MCP]] — Harness 的三種控制手段對應三種工具：認知框架 ≈ Skill（prompt 引導）、能力邊界 ≈ MCP（受限接口）、工作流程 ≈ Bash（多步驟串接執行）
- [[src-Claude Code五個底層概念]] — 「窗口」概念解釋了 Harness 管理上下文的必要性，「循環」概念對應 Ralph Loop，「層級」概念對應 agents.md 在 prompt hierarchy 中的位置
- [[src-AI-Agent避坑指南]] — agents.md 研究（效果有限、不能太長）與 Agent 架構避坑經驗互相印證，尤其是 Skill 在長任務中注意力衰減的問題
