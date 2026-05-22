---
title: "Scaling Managed Agents — Decoupling the brain from the hands"
type: source
sources: [scaling-managed-agents-decoupling-the-brain-from-the-hands-anthropic.md]
created: 2026-05-21
updated: 2026-05-21
tags: [anthropic, managed-agents, harness, agent-architecture, meta-harness, context-engineering]
---

# Scaling Managed Agents：Decoupling the Brain from the Hands

> [[Anthropic]] Engineering Blog，**2026-04-08 發佈**；作者 Lance Martin、Gabe Cemaj、Michael Cohen
> 原文：https://www.anthropic.com/engineering/managed-agents
> （2026-05-21 由使用者手動放入 vault 補 ingest）

## 一句話定位

Anthropic 官方工程文章，闡述 **Managed Agents**（hosted 的 long-horizon agent 服務）如何用「穩定的 interface」把 agent 三組件——**brain / hands / session**——解耦，使底層 harness 能自由演進而上層介面不變。核心命題：**harness 編碼了「Claude 還做不到什麼」的假設，而這些假設會隨模型變強而過時（go stale）**。

## 核心論點

### 1. Harness 的假設會過時（Bitter Lesson 應用）
- 引用 Sutton《The Bitter Lesson》：harness 對「Claude 不能做什麼」的假設需被頻繁質疑
- 實例：Sonnet 4.5 有「**context anxiety**」（感知 context 上限將至就提前收尾任務），於是在 harness 加 context resets；但同一 harness 換到 Opus 4.5，該行為已消失，resets 變成 **dead weight**

### 2. OS 類比：為「尚未想到的程式」設計
- 如同作業系統把硬體虛擬化為 process / file 等抽象（`read()` 不管底層是 1970s 磁碟還是現代 SSD），抽象比硬體長壽
- Managed Agents 同樣虛擬化 agent 的三組件，讓各自實作可被抽換而不擾動其他：
  - **session**：append-only 的「所有發生事件」日誌
  - **harness**：呼叫 Claude、並把 Claude 的 tool call 路由到對應基礎設施的迴圈
  - **sandbox**：Claude 執行程式碼、編輯檔案的執行環境

### 3. Decouple the brain from the hands（核心架構）
- **brain**（Claude + harness）/ **hands**（sandbox + tools）/ **session**（事件日誌）三者解耦，各自可獨立失敗或替換
- **pets vs cattle**：原本把全部組件塞進單一 container＝養了「寵物」（container 一死，session 就丟，還得「照護」卡住的 session）；解耦後 container 變「牲口」，harness 用 `execute(name, input) → string` 呼叫它，死了就用 `provision({resources})` 重建
- **harness 自身也變 cattle**：session log 在 harness 之外，故 harness crash 後可用 `wake(sessionId)` 重啟、`getSession(id)` 取回事件流、從最後一個事件續跑；過程中以 `emitEvent(id, event)` 寫入持久紀錄
- **安全邊界**：解耦讓憑證永不暴露於「Claude 生成程式碼運行的 sandbox」（防 prompt injection 偷 token）——Git 用 repo token 在 sandbox 初始化時接上 remote、之後 push/pull 不經 agent 之手；自訂工具用 MCP，OAuth token 存 vault、Claude 經 dedicated proxy 呼叫，**harness 全程不接觸憑證**

### 4. Session ≠ Claude 的 context window
- 長任務常超出 context window，傳統 compaction / trimming 都是「**不可逆的取捨**」，難預知未來輪次需要哪些 token
- session 作為「context window 之外」的持久 context object，介面 `getEvents()` 可做位置切片查詢（回看某事件前的脈絡、重讀某動作前的 context、從上次停讀處接續）
- 取出的事件可在 harness 內任意轉換（含為提高 **prompt cache 命中率**而組織 context）——把「可復原的儲存」（session 保證）與「任意 context 管理」（harness 自由）分離，因為無法預測未來模型需要哪種 context engineering

### 5. Many brains, many hands
- 解耦後 container 由 brain 按需 provision（不需 container 的 session 不必等它）——**TTFT（time-to-first-token）p50 降約 60%、p95 降逾 90%**
- 一個 brain 可連多個 hands；每個 hand 就是 `execute(name, input) → string`，harness 不在乎 sandbox 是 container、手機、還是 **Pokémon 模擬器**；且因 hand 不綁定特定 brain，brains 之間能互相傳遞 hands

### 6. Meta-harness 定位
- Managed Agents 是「**meta-harness**」——不對「具體該用哪種 harness」有意見，而是提供能容納多種 harness 的通用 interface；[[Claude Code]] 是其中一個優秀 harness，task-specific 的窄領域 harness 也能被容納，隨 Claude 智能演進而調適

## 與本 wiki 的關聯

- **直接對位 [[src-agent-model-body-harness]]**：該頁「Agent = Model + Body + Harness」三層拆解，正是本文「brain（Model+Harness）/ hands（Body＝sandbox）」的官方架構版；本文再補上 **session** 作為第三軸（持久狀態）
- **工程版配對 [[src-anthropic-managed-agents]]**：那篇是 Managed Agents 的 **PM 視角**（產品定位、6 產品線），本篇是 **工程實作**（架構/介面/TTFT 數據）——PM＋Eng 雙視角互補
- **「harness 假設會過時」** 呼應 [[src-armin-agent-design-hard]]（Armin 的 agent 工程實戰：cache points / reinforcement injection）與 [[Andrej Karpathy]] 的 Software 3.0
- **session 作為 context object** 呼應 [[Restatement]]、[[src-Claude Code Session管理]] 的 compact / context rot 討論
- **安全邊界（token 不入 sandbox）** 呼應本月供應鏈/prompt injection 資安主軸（如 [[src-hn-2026-05]] 多起憑證外洩/npm 蠕蟲事件）

## 相關頁面
- [[src-agent-model-body-harness]] — Agent 三層解剖（Model/Body/Harness），本文的概念前身
- [[src-anthropic-managed-agents]] — Managed Agents PM 視角（本文工程版的配對）
- [[Anthropic]] — Managed Agents 為其 6 產品線之一
- [[Claude Code]] — 文中點名的「優秀 harness」範例
- [[src-Harness Engineering]] — harness 工程主題
- [[Restatement]] — context 控制機制
- [[Andrej Karpathy]] — Software 3.0 / harness 假設隨模型演進
