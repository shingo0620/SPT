---
title: Claude Code Session 管理與 1M Context
type: source
sources: [Using Claude Code-Session Management and 1M Context.md]
created: 2026-04-19
updated: 2026-04-19
tags: [claude-code, context-management, llm, workflow]
---

# Claude Code Session 管理與 1M Context

> 來源：[Using Claude Code: Session Management and 1M Context — trq212 on X](https://twitter.com/trq212/article/2044548257058328723)
> 閱讀日期：2026-04-19
> 作者：Anthropic Claude Code 團隊成員（trq212，文章提到「my recent calls with Claude Code users」）

## 一句話

**1M context 是雙面刃**——讓 Claude Code 能跑更長任務、更可靠，但如果不刻意管理 session，context pollution 會嚴重影響表現。每次 Claude 結束一輪，你都站在分歧點上：繼續、rewind、clear、compact、或派 subagent，五個選擇各有 context 管理意涵。

---

## 核心概念

### Context Rot（上下文衰減）

Context window 涵蓋 system prompt、所有對話、每個 tool call 與結果、讀過的每個檔案。Claude Code 有 1M token。

**Context rot**：隨著 context 變大，模型表現下降。注意力被攤薄在更多 token 上，舊的、無關的內容開始干擾當前任務。

- 1M context 模型的 context rot 大約在 **300-400k tokens** 開始明顯
- 但高度依賴任務特性，不是硬性規則
- Context window 是硬切——接近上限時必須 compact

### 每個 turn 都是分歧點

Claude 結束一輪後，你有五個選擇：

| 選擇 | 操作 | Context 效果 |
|------|------|-------------|
| **Continue** | 在同一 session 發下一則訊息 | 累加（最自然、但也最容易污染） |
| **Rewind** | `esc esc` 或 `/rewind`，跳回某個前面的訊息重發 | 丟棄該點之後的所有訊息 |
| **Clear** | `/clear` 開新 session，通常帶著你從前一輪萃取的 brief | 完全重置 |
| **Compact** | 把 session 摘要後取代歷史，繼續作業 | 有損壓縮 |
| **Subagent** | 把下一個工作交給有獨立 context 的 agent，只拉最終結果回來 | 隔離 + 摘要回收 |

最自然的是 continue，但其他四個都是 context 管理工具。

---

## 五個選擇的實務準則

### 何時開新 session

**經驗法則：開新任務就開新 session**，即使 context 還沒用完。

**灰色地帶**：做相關任務但只需要部分 context。例如實作完後寫 docs——新 session 需要重讀檔案（慢、貴）、保留 session 則多攜帶無關 context。若任務不需要太高智能（如寫文檔），保留 context 值得效率增益。

### Rewind — 取代糾正

> 如果要挑一個代表好 context 管理的習慣，那就是 **rewind**。

- Claude 讀了五個檔案、試了某個方法、失敗了
- 直覺會打「那個沒用，試 X」——但更好的做法是 **rewind 到 file reads 之後**，帶著學到的東西重新 prompt：「不要用 A 方法，foo module 不暴露那個，直接走 B」
- 也可以用「summarize from here」讓 Claude 產出學習 handoff 訊息，像是給「未來的自己」的一封信

**為什麼更好**：失敗嘗試留在 context 裡會污染後續推理，rewind 後重 prompt 讓模型帶著正確方向一次到位。

### Compact vs Clear

一旦 session 變長，有兩種減重方式：`/compact` 和 `/clear`。看起來像，行為截然不同。

**`/compact`**
- 讓模型自行摘要對話，然後用摘要取代歷史
- 有損——你信任 Claude 判斷什麼重要
- 可導引：`/compact focus on the auth refactor, drop the test debugging`
- 好處：不用自己寫，Claude 可能比你更全面收錄重要學習與檔案

**`/clear`**
- 你自己寫下什麼重要（「我們在重構 auth middleware、約束是 X、重要檔案是 A、B、已排除 Y 方案」）然後從零開始
- 較多手工，但 context 是你決定的

### Bad Compact 的成因

> 模型無法預測你接下來要往哪個方向走時，compact 會特別糟。

**例子**：autocompact 在長 debug session 後觸發、摘要了整個調查，你下一句是「現在去修 bar.ts 的另一個 warning」——但因為 session 聚焦在 debug，那個 warning 可能被從摘要中丟掉。

**為什麼難解**：compact 發生在模型**最不聰明的時刻**（因為 context rot）。1M context 給你更多空間**主動** `/compact` 並帶上說明。

### Subagent & 獨立 context

**心智測試**：「我等會還會用到這個 tool output 嗎，還是只要結論？」只需要結論 → 用 subagent。

Claude Code 會自動呼叫 subagent，但也可以明確指示：
- 「起一個 subagent 依這個 spec 驗證這份工作」
- 「起一個 subagent 讀這個 codebase、摘要它如何實作 auth flow，然後你按同一個方式實作」
- 「起一個 subagent 依 git changes 幫我寫這個 feature 的 docs」

---

## 與既有 wiki 的關聯

### 與 [[src-Claude Code五個底層概念]]

這篇文章是「窗口（Context Window）」一節的**操作層展開**：
- 五底層概念說明「為什麼」上下文管理重要（注意力稀疏、無狀態、知識 cutoff）
- 本篇說明「怎麼做」——rewind vs correct、compact vs clear、subagent 派工的決策準則
- **context rot 在 300-400k tokens 開始明顯**這個量化資料是五底層概念沒給的

### 與 [[src-Harness Engineering]]

Harness Engineering 提出「認知框架 + 能力邊界 + 工作流程」三層駕馭工程，本篇的五個選擇正是**工作流程層**的具體做法：
- Ralph Loop 對應 subagent 派工的極致——每步都是獨立 context
- agents.md 研究中「清晰指令勝過包山包海」呼應 `/clear` 時主動萃取 brief 的原則

### 與 [[src-Claude Code Routines]]

Routines 是把 session 管理**推到極致**——每個 routine 都是獨立雲端 session，trigger 觸發時從頭跑。文章中的「開新任務就開新 session」建議在 routine 化之後變成預設：
- 無法 rewind、無法 continue 同一 session
- 每次都靠 prompt 本身和 repo 狀態傳遞 context
- 對應文章結論：「Claude 以後會幫你處理這些決定」——routines 就是一種預先打包的決定

### 與 [[Restatement]]

Bad compact 的成因與 Restatement 要解決的問題同源：**模型在 context 龐大時遺忘早期資訊**。Restatement 是被動地週期性重申，本篇提到的主動 `/compact` 帶說明、`/clear` 帶 brief 是**使用者端的 Restatement**。

### 與 [[AI 輔助軟體工程]]

「Rewind 勝於糾正」是 AI 協作方法論的一個具體實踐：失敗嘗試被保留會讓下一次嘗試**偏誤**，就像 review 時看到錯誤實作會影響對 spec 的理解。本篇加深了「人機分工」裡「人類判斷」的顆粒度——不只判斷要不要這個方案，也判斷什麼該留、什麼該丟。

---

## 關鍵要點摘錄

- Context rot 實測點：**300-400k tokens**（1M 模型），但依任務變動
- 「每個 turn 都是分歧點」這個心智模型把 continue 從預設變成五選一之一
- Rewind 的真正價值在**避免污染**，不只是取消
- `/compact` 可以帶 focus 說明——這是多數使用者不知道的技巧
- Subagent 的決策規則是「tool output 還會用嗎」
- Bad compact 的本質：壓縮發生在**模型最不聰明的時刻**

---

## 相關頁面

- [[src-Claude Code五個底層概念]]（窗口概念的具體操作層）
- [[src-Harness Engineering]]（上位的駕馭工程框架）
- [[src-Claude Code Routines]]（把 session 管理推到雲端自動化）
- [[Restatement]]（context 管理的另一種應對）
- [[AI 輔助軟體工程]]（人機分工方法論）
- [[src-AI-Agent避坑指南]]（100+ 步驟後規則失效 = context rot 的實務觀察）
