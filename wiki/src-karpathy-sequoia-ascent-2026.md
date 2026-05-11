---
title: "Karpathy @ Sequoia AI Ascent 2026 — Software 3.0, Agentic Engineering, Jagged Intelligence"
type: source
sources: [sequoia-ascent-2026-summary-karpathy.md, 你可以外包思考但不能外包理解karpathy-最新訪談精華心得ai-時代的真正競爭力.md, Andrej Karpathy From Vibe Coding to Agentic Engineering.md]
created: 2026-05-11
updated: 2026-05-11
tags: [karpathy, sequoia, software-3-0, agentic-engineering, jagged-intelligence, verifiability]
---

# Karpathy @ Sequoia AI Ascent 2026

> 來源：[[Andrej Karpathy]] 於 2026-04-30 在 Sequoia Capital AI Ascent 2026 與 Stephanie Zhan 的 fireside chat。三方來源交叉參照：
> - 主源：[Karpathy 部落格 LLM 摘要 + 清理逐字稿](https://karpathy.bearblog.dev/sequoia-ascent-2026/)
> - YouTube 影片：[From Vibe Coding to Agentic Engineering](https://www.youtube.com/watch?v=96jN2OCOfLs)
> - 中文摘要：[雷蒙：你可以外包思考，但不能外包理解](https://raymondhouch.com/lifehacker/digital-workflow/outsource-thinking-not-understanding-karpathy/)

## 核心金句

> **You can outsource your thinking, but you can't outsource your understanding.**
>
> 你可以外包你的思考，但你不能外包你的理解。

## 12 個核心觀點

### 1. December 2025 是 Agentic Inflection Point

Karpathy 自稱「我從未感覺如此跟不上」。2025-12 前 [[Claude Code]] / Codex 等 agentic 工具仍需頻繁修正；2025-12 後**生成的程式塊變大、變一致、變可靠**，他開始信任 agent。

> 「The unit of programming changed from typing lines of code to delegating larger macro actions.」

對應 wiki 既有的 [[綜整-AI協作工程的六大趨勢]]——Karpathy 親自確認 2025-12 是質變點。

### 2. Software 3.0：Context Window 是新的程式

| 階段 | 程式形態 | 「程式設計」是什麼 |
|------|---------|-------------------|
| Software 1.0 | 人類寫顯式 code | 編寫 if/else、函式、類別 |
| Software 2.0 | 神經網路權重 | 設計資料集、目標函式、網路架構 |
| Software 3.0 | LLM Prompt / Context | 寫入 context window 的內容 = 程式 |

關鍵洞察：**LLM 是執行 context 的直譯器**；以前要寫 shell 腳本處理「跨平台安裝」，現在貼一段文字給 agent，它自己讀環境、debug、適應機器。

### 3. MenuGen 例子：軟體應該消失

- **舊版**：拍菜單照片 → 寫 OCR + image generator + Vercel app + DNS + auth + payments
- **新版**：把照片給 Gemini + Nano Banana → 「在每道菜的位置上畫圖」→ 直接回傳合成的菜單圖

> 「In that version, much of the app disappears. The neural network directly transforms input media into output media.」

啟示：**AI 不是讓舊應用變快——某些應用應該停止存在**。神經網路直接做端到端的媒體變換。

### 4. 新機會不是程式設計變快，而是資訊處理變可能

> 「Do not only ask: 'What existing workflow can AI speed up?' Also ask: 'What information transformation was impossible before, but is now natural?'」

⭐ Karpathy 親自舉的例子就是 [[LLM Wiki]]——他的 [gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 模式：增量編譯混亂文件成持久化 markdown wiki（含摘要、實體頁、概念頁、矛盾標記、交叉連結、log 與演化中的綜整）。

**這正是本 wiki 專案在實踐的模式**——Karpathy 在 Sequoia 上對 founders 直接點名 LLM Wiki 作為「以前不可能、現在自然」的代表案例。

### 5. Verifiability 解釋 AI 在哪些領域進步最快

> 「Traditional software automates what you can **specify**. LLMs and reinforcement learning automate what you can **verify**.」

如果任務有自動 reward / success signal，模型可以 practice → 數學、coding、testing、benchmarks、遊戲、許多工程任務之所以快速進步的原因。

### 6. Jagged Intelligence 有兩條軸

| 軸 | 描述 |
|----|------|
| Verifiability | 任務是否有 reward signal 可訓練 |
| Training Attention | labs 是否將該領域納入訓練重點（資料覆蓋、合成資料、RL 環境、benchmark 壓力、經濟價值）|

公式（非嚴格）：

```
capability spike ≈ verifiability × training attention × data coverage × economic value
```

經典反例：state-of-the-art 模型能重構十萬行 codebase 或找 zero-day 漏洞，**卻會告訴你「50 公尺走路去洗車」**——因為「車程 vs 步行的距離判斷」沒有大量訓練資料。

對 founder 的問題：**你的任務在不在模型的軌道上（on the model's rails）？**

### 7. Vibe Coding vs. Agentic Engineering

| 維度 | Vibe Coding | Agentic Engineering |
|------|------------|---------------------|
| 目標 | **raise the floor**（任何人都能造軟體） | **raise the ceiling**（專業團隊的天花板）|
| 適用場景 | 原型、個人工具 | 嚴肅產品、可靠系統 |
| 核心問題 | 「我能不能做出來？」 | 「我能不能又快又好又安全？」|
| 倍率 | 10× 已不夠形容 | 「比 10× 高很多」（Karpathy 原話）|

**Agentic engineer 不盲目接受生成 code，而是**：設計 spec、督導 plan、檢查 diff、寫 test、建立 eval loop、管理 permissions、隔離 worktree、保證品質。

#### MenuGen 支付 bug 案例

Agent 用 email 配對 Stripe 購買記錄與 Google 登入帳號——**但 Stripe email 與 Google email 可以不同！** 用戶可能拿不到買的點數。

Karpathy 結論：「**Agent 負責填空，你負責判斷該畫哪些空格。**」

### 8. Hiring 應該改變

傳統小型 coding 謎題 = 舊典範。新典範的面試：

> 「Build a substantial project with agents, deploy it, make it secure, and then have adversarial agents try to break it.」

→ 直接呼應 wiki 既有 [[src-bug-hunter]] 與 [[Multi-Agent 失敗分類學]] 中「adversarial multi-agent」設計思路；Karpathy 把它定義為「新世代工程師的核心技能」。

### 9. Founders：找有價值、可驗證、未被前沿 labs 訓練的領域

> 「If you can create a domain-specific environment where models can try actions and receive reliable rewards, you may be able to improve performance with fine-tuning or reinforcement learning even if the base model is not already excellent there.」

對應 wiki 既有概念 [[OSS Investment Scorecard]]（評估投資方向）與 [[PluginEval]]（領域特定 eval 環境）。

### 10. Agent-Native Infrastructure：為 agent 而非人類設計

> 「Docs say 'go to this URL, click this button.' But increasingly the user is not the human directly. The user is the human's agent.」

需要的 agent-native surfaces：
- Markdown docs（不是 click-here 教學）
- CLIs / APIs / MCP servers
- Structured logs / 機器可讀 schema
- 可貼上的 agent instructions
- 安全的 permissioning / Auditable actions / Headless setup flows

對應 wiki [[Skill vs Bash vs MCP]] 概念——MCP 是 agent-native infrastructure 的代表協定。

### 11. Ghosts, Not Animals

LLM **不是動物**——沒有生物驅力、肉身存活壓力、好奇、玩、內在動機。

LLM **是統計模擬**——pretraining、post-training、RL、產品 feedback、經濟誘因塑造的數位人造物。

實務意義：擬人化期待會誤導；模型在某些時刻聰明、另一些時刻荒謬。應採取**經驗主義熟悉度**——學會它在哪裡有效、哪裡失效。

### 12. Education：你可以外包思考，但不能外包理解

> 「Even if agents do more of the work, the human still needs understanding to direct them.」

需要知道：
- 什麼值得建構
- 什麼問題重要
- 什麼結果該起疑
- 什麼 tradeoff 可接受

連結到 Karpathy 的 [[LLM Wiki]] 興趣——「不只是答案機器，是把資訊轉成理解的工具」。

連結到他的 `microGPT` 專案：完整 GPT 訓練 + 推論在單一無依賴 Python 檔內。**人類專家貢獻精煉的 artifact 與背後的 taste；agent 負責對每個學習者互動式解釋**。

## 雷蒙中文摘要的附加觀點

中文摘要（raymondhouch.com）在英文部落格之外，額外提出：

### 支撐「理解」的三件 AI 偷不走的東西

1. **理解力**：對一件事「本質上在發生什麼」的把握
2. **品味**：判斷一個東西好不好、對不對、美不美的能力
3. **好奇心**：願意往「為什麼」再多問一層的內在驅動

### 如何養成這三件事（中文版具體方法）

1. 寫日記、寫筆記——把模糊感受變成清楚句子
2. 慢慢讀，且讀完要重組——用自己的話講一次或寫成知識卡
3. 跟領域以外的人聊天——品味需要「比較」才能養出
4. 把判斷拆解出來——說「比較好」時逼自己加「因為……」
5. 保留「沒有效率」的時間——散步、發呆、隨意玩樂

→ 這部分正是本 wiki 專案的精神內核：**用 LLM 維護持久化的個人知識結構**就是在實踐 Karpathy 的「養理解」方法。

## 跨 wiki 連動

### 強連結（核心概念）
- **[[Andrej Karpathy]]**：本場演講主角，2026-04-30 對 Sequoia founders 的指導性論述
- **[[LLM Wiki]]**：Karpathy 親自舉本 wiki 模式為「以前不可能、現在自然」的代表案例
- **[[src-LLM Wiki]]**：LLM Wiki 模式的源頭 gist
- **[[綜整-AI協作工程的六大趨勢]]**：Karpathy 確認 2025-12 為 agentic inflection point
- **[[Multi-Agent 失敗分類學]]**（MAST）：FM-2.6 Reasoning-Action Mismatch 對應 Karpathy 的「Agent 想一套做一套」直觀觀察
- **[[src-bug-hunter]]** / [[Multi-Agent 失敗分類學]]：Karpathy 的「adversarial multi-agent 面試」設計與 bug-hunter 思路同源
- **[[AI 品質共謀]]**：Karpathy 的 MenuGen 支付 bug 是個體 agent 的「結構性失敗」——人類失職時 agent 不會自動補救
- **[[Skill vs Bash vs MCP]]**：Agent-Native Infrastructure 段直接對位

### 中強連結（直接相關）
- **[[Claude Code]]**：Karpathy 明確使用 Claude Code 作為 agentic 工具代表
- **[[src-andrej-karpathy-skills]]**：Karpathy 對 LLM coding pitfalls 的觀察與本次 Sequoia 訪談同源
- **[[Anthropic]]**：[[Claude Code]] 是 Anthropic 產品
- **[[src-Code Review已死]]**：Karpathy 強調「agent 負責填空，人負責判斷」與該頁主題呼應
- **[[src-agent-model-body-harness]]**：Agent-Native Infrastructure 是 harness 的延伸

### 弱連結（延伸關聯）
- **[[OSS Investment Scorecard]]**：Karpathy 「找未被訓練的可驗證領域」對應投資 scorecard 維度
- **[[PluginEval]]**：可驗證環境的具體實作
- **[[Inference.sh]]**：indie agentic infrastructure 案例（呼應 Karpathy「indie 邊緣設備」軸）

## 觀察與限制

### 來源強度
- **A+ 級**：Karpathy 本人在 Sequoia 公開演講；Karpathy 部落格親自審核 LLM 整理版（「I used a top capability model and read the content and it reads ok」）
- **B 級**：雷蒙摘要為個人觀點延伸，新增「三件 AI 偷不走的事」框架為作者擴展非 Karpathy 原話

### 「Karpathy 親自背書 LLM Wiki」的意義
- 本 wiki 專案是 [[LLM Wiki]] 模式的具體實作
- Karpathy 在 Sequoia 對 founders 將其列為「以前不可能、現在自然」的代表案例
- → **本專案在做的事，是 Karpathy 正在向矽谷推銷的方法論的具體案例**

### 待後續觀察
- Software 3.0 是否成為主流命名（vs Anthropic 的「Agent」/「Skill」術語體系）
- Jagged Intelligence 的「on/off the rails」是否成為產品設計準則
- 「Agent-Native Infrastructure」是否帶起新一波 MCP / CLI / API 重寫浪潮
- Karpathy 的 `microGPT` 教育模式是否落地（人類提供 distilled artifact，agent 互動式解釋）

## 結語金句

> The work itself is being reorganized around agents. Software, research, education, infrastructure, and knowledge work are all becoming variations of the same pattern:
>
> - define the context
> - define the tools
> - define the feedback loop
> - define the guardrails
> - let agents work
> - **preserve human understanding**
