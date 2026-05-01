---
title: andrej-karpathy-skills — Karpathy 的 LLM Coding Pitfalls 觀察整理為 CLAUDE.md
type: source
sources: [github-forrestchangandrej-karpathy-skills-a-single-claudemd-file-to-improve-claude-code-behavior-derived-from-andrej-karpathy39s-observations-on-llm-coding-pitfalls-github.md, Untitled 2.md]
source_url: https://github.com/forrestchang/andrej-karpathy-skills
created: 2026-05-01
updated: 2026-05-01
tags: [karpathy, claude-code, claude-md, agent-skill, multica, forrestchang, jiayuan-pan]
---

# andrej-karpathy-skills

> 來源：GitHub `forrestchang/andrej-karpathy-skills`（**103k stars / 10.1k forks / 28 commits**——本月最爆紅的 CLAUDE.md 規則 repo）
> 一句話：**把 [[Andrej Karpathy]] 對 LLM coding pitfalls 的觀察，提煉為 4 條原則的 single CLAUDE.md，可一鍵套用到任何專案**

---

## 一句話定位

> 「A single `CLAUDE.md` file to improve Claude Code behavior, derived from Andrej Karpathy's observations on LLM coding pitfalls.」

作者 forrestchang（@jiayuan_jy on X）—— **同時也是 [[Multica]] / [[Devv.AI]] 團隊的開發者**（README 直接 plug：「Check out my new project Multica」）。從 [[src-multica-devv-ai盡調]] 的 3-4 人團隊脈絡看，這是 Multica 團隊個人成員的影響力擴散。

---

## Karpathy 觀察的核心問題（README 直引）

> 「The models make wrong assumptions on your behalf and just run along with them without checking. They don't manage their confusion, don't seek clarifications, don't surface inconsistencies, don't present tradeoffs, don't push back when they should.」

> 「They really like to overcomplicate code and APIs, bloat abstractions, don't clean up dead code... implement a bloated construction over 1000 lines when 100 would do.」

> 「They still sometimes change/remove comments and code they don't sufficiently understand as side effects, even if orthogonal to the task.」

來源：[Karpathy X 推文](https://x.com/karpathy/status/2015883857489522876)

---

## 四原則對應四個 Pitfall

| 原則 | 對應問題 |
|------|---------|
| **Think Before Coding** | 錯誤假設、隱藏困惑、漏掉 tradeoff |
| **Simplicity First** | 過度複雜化、bloated abstraction |
| **Surgical Changes** | 動到不該動的（orthogonal 編輯） |
| **Goal-Driven Execution** | LLM 透過「test-first + 可驗證成功標準」獲得槓桿 |

### 1. Think Before Coding —— 不假設、不藏困惑、表達 tradeoff
- State assumptions explicitly — 不確定就問，別猜
- Present multiple interpretations — 模糊時並列，別默默選
- Push back when warranted — 看到更簡單的就說
- Stop when confused — 點出哪裡不清楚並提問

### 2. Simplicity First —— 解決問題的最小程式碼，不投機添加
- 不超出需求的功能
- 不為單次使用建抽象
- 不主動加未要求的「彈性」「可配置性」
- 不為不可能的場景做錯誤處理
- **若 200 行可被 50 行重寫，就重寫**
- 自我測試：「資深工程師會說這太複雜嗎？」

### 3. Surgical Changes —— 只動該動的、只清自己造成的爛攤
- 不「順便」改鄰近程式碼/註解/排版
- 不重構沒壞的東西
- 配合既有風格，即使你不喜歡
- 看到無關 dead code 就點出，**別刪**
- 自己造的 orphan（未用 import/變數/函式）才該清
- **每一行修改都該追溯到使用者請求**

### 4. Goal-Driven Execution —— 定義成功標準，loop 到驗證通過
- 把祈使式任務轉為可驗證目標：

| Instead of... | Transform to... |
|--------------|-----------------|
| "Add validation" | "Write tests for invalid inputs, then make them pass" |
| "Fix the bug" | "Write a test that reproduces it, then make it pass" |
| "Refactor X" | "Ensure tests pass before and after" |

- 多步任務先寫簡短計畫：`1. [Step] → verify: [check]`
- 強成功標準讓 LLM 自己 loop；弱標準（「make it work」）需要不斷澄清

---

## 關鍵洞見（Karpathy 引言）

> 「LLMs are exceptionally good at looping until they meet specific goals... **Don't tell it what to do, give it success criteria and watch it go.**」

「Goal-Driven Execution」原則的本質——**把祈使式指令轉為宣告式目標 + 驗證迴圈**。

---

## 安裝方式

**方法 A**（推薦）：Claude Code Plugin
```
/plugin marketplace add forrestchang/andrej-karpathy-skills
/plugin install andrej-karpathy-skills@karpathy-skills
```

**方法 B**：直接 curl 到 CLAUDE.md
```bash
# 新專案
curl -o CLAUDE.md https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md

# 既有專案（追加）
echo "" >> CLAUDE.md
curl https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md >> CLAUDE.md
```

也支援 Cursor（`.cursor/rules/karpathy-guidelines.mdc`）。

---

## 與本知識庫的關係

### 直接呼應 [[Andrej Karpathy]] 條目

[[Andrej Karpathy]] 之前在本 wiki 出現於 [[src-向三位大師學AI筆記]]（他的 LLM Wiki 構想）、[[src-LLM Wiki]]、[[src-karpathy筆記實作]]——**Karpathy 對 LLM Wiki 觀察 → 對 LLM coding pitfalls 觀察**這條軸線都在影響 [[Claude Code]] 生態的最佳實踐標準化。

### 與 [[src-Harness Engineering]] 的對應

李宏毅版 Harness Engineering 三種控制手段中的「**認知框架**」（Natural Language Harness）——本 repo 的 4 條原則就是把抽象的 harness 概念落地為**單一可分享 CLAUDE.md 檔**。**3 萬行教學文 vs 1 個 CLAUDE.md 的比較**：後者證明「集中注意力於最少規則」往往比「列出所有可能 pitfall」更有效。

### 與 [[src-agent-model-body-harness]] 三層拆解的對應

四原則完全屬於 **harness 層**（行為校準），不動 model 也不動 body：
- 「Think Before Coding」= 思考過程 harness
- 「Simplicity First」= 輸出複雜度 harness
- 「Surgical Changes」= 編輯範圍 harness
- 「Goal-Driven Execution」= verification loop harness

**佐證 [[src-agent-model-body-harness]] 的核心論點**：harness 是行為校準層，不是 model 補丁——同一個 Opus/Sonnet/Haiku，加這個 CLAUDE.md 就會表現不同。

### 與使用者全域 CLAUDE.md 的對應

使用者個人 `/Users/shingowu/.claude/CLAUDE.md` 的 Engineering Conventions 區段已採用**完全相同的四原則**（Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution）。**本 wiki 第一次紀錄使用者已採用的具體 CLAUDE.md 來源**——可追溯到此 repo。

### 與 [[綜整-AI協作工程的六大趨勢]] 趨勢一

「環境比模型聰明」的最具體商業驗證——一個只有 4 條原則、28 commits 的單檔 repo 衝到 103k stars，反映社群對「**把抽象 harness 落地為可一鍵套用 CLAUDE.md**」的巨大需求。

### 與 [[src-AI-Agent避坑指南]] 的對應

[[src-AI-Agent避坑指南]] 的「Plan-and-Execute → Skill → 上下文隔離」三階段演進中，本 repo 屬於 **Skill 階段的最簡單形式**——4 原則用純 prompt 引導完成 90% pitfall 預防，不需 sub-agent 也不需 hooks。

### 與 [[Multica]] / [[Devv.AI]] 團隊脈絡

forrestchang（Jiayuan Pan）是 [[Multica]] 開發者之一——本 README 直接 plug Multica。從 [[src-multica-devv-ai盡調]] 的 3-4 人團隊規模看，這個 repo 的爆紅同時為 Multica 提供了大量曝光。**個人 OSS 為公司產品引流的典型案例**。

---

## 為什麼會 103k 星

| 原因 | 說明 |
|------|------|
| **Karpathy 名義加成** | Karpathy 在 LLM 社群的 thought leader 地位——任何「源自 Karpathy 觀察」的提取版都會獲關注 |
| **可一鍵套用** | curl 一行就能加入既有 CLAUDE.md，安裝門檻為零 |
| **規則精簡** | 只有 4 條，不是 40 條清單；對應 [[src-Harness Engineering]] 「agents.md 不能太長」原則 |
| **Cursor + Claude Code 雙平台** | 涵蓋兩大主流 coding agent，市場最大化 |
| **時機對** | 04 月 [[src-Code Review已死]] 主題、Anthropic postmortem 事件後，社群對「LLM coding 行為校準」需求達到高峰 |

---

## 查核備註

✅ Repo 內容、stars、forks、安裝指令均直接來自 GitHub README 擷取，可信。

⚠️ **103k stars** 數字看似誇張，但與 28 commits / 10.1k forks 的比例（forks/commits = 360）反映 GitHub Trending 加上 Karpathy 名義引流的爆發效應；實際採用 vs 「mark for later」的比例難以驗證——應視為「採用興趣」而非「實際使用」。

⚠️ **Karpathy X 推文 ID** 顯示為 `2015883857489522876`——Twitter post ID 通常 19 位，此 ID 稍長，可能為 README 編寫時誤鍵；Karpathy 確實有相關 LLM coding pitfall 推文（時間需驗證）。

---

## 相關頁面

- [[Andrej Karpathy]]（觀察源頭，本 wiki 重要實體）
- [[Claude Code]]（目標環境）
- [[src-Harness Engineering]]（CLAUDE.md = 認知框架 harness 的學術版本）
- [[src-agent-model-body-harness]]（四原則屬 harness 層，不動 model/body 的具體實證）
- [[Multica]]（作者 forrestchang 同團隊）
- [[src-multica-devv-ai盡調]](Multica 團隊背景)
- [[綜整-AI協作工程的六大趨勢]](趨勢一商業驗證)
- [[AI 輔助軟體工程]](方法論呼應)
- [[src-AI-Agent避坑指南]](Skill 階段最簡形式)
- [[src-Code Review已死]](LLM coding 行為校準需求高峰的時代背景)
