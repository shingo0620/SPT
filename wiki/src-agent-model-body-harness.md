---
title: Agent = Model + Body + Harness — 把 body 從 harness 拆出來
type: source
sources: [Untitled 1.md]
source_url: https://www.facebook.com/share/1HJJVjFR6U/?mibextid=wwXIfr
created: 2026-04-29
updated: 2026-04-29
tags: [agent, harness, body, claude-code, openclaw, anthropic, postmortem, context-rot]
---

# Agent = Model + Body + Harness

> 來源：Facebook 分享連結（作者第一人稱論述，引用多份外部文獻）
> 主旨：對 LangChain Viv Trivedy「Agent = Model + Harness」二分法提出三層拆解進化，主張**把 body（手腳）從 harness（約束）裡拆出來**——並用 OpenClaw vs Claude Code 同模型不同表現的對照驗證。

---

## 一句話結論

> 「OpenClaw 跟 Claude Code 都用 [[Anthropic]] Opus 4.6——同模型，寫 code 體感差很多。差別不在模型，在身體（body）跟約束（harness）被調去解不同問題。」

---

## 概念貢獻：從二層到三層

### 既有業界定義（Viv Trivedy / LangChain）

> 「If you're not the model, you're the harness. A harness is every piece of code, configuration, and execution logic that isn't the model itself. A raw model is not an agent.」

```
Agent = Model + Harness
```

[[src-Harness Engineering]]（李宏毅）也採用此二分：AI Agent = LLM + Harness。

### 作者主張的三層拆解

```
Agent = Model + Body + Harness
```

| 層級 | 角色 | 例 |
|------|------|----|
| **Model** | 大腦（intelligence 本身） | Opus 4.6 |
| **Body** | 手腳：能不能做事 | bash、filesystem、git、sandbox、browser、MCP |
| **Harness** | 約束：會不會做歪 | CLAUDE.md、hooks、planner-evaluator、sub-agent、back-pressure |

**為什麼要拆**：body 是「能力延伸」，harness 是「行為校準」——前者解「沒手腳做不到」，後者解「LLM 永遠 non-deterministic、輸出有分布」。本質不同的兩件事。

> ⚠️ 作者明確聲明這不是業界主流文獻的標準術語，是用來解釋 OpenClaw vs Claude Code 體感差異的工作框架。

---

## 案例：OpenClaw vs Claude Code（同模型不同 body+harness）

| 維度 | [[Claude Code]] | OpenClaw |
|------|-----------------|----------|
| Model | Opus 4.6 | Opus 4.6 |
| Body | bash 直執行、filesystem 直讀寫、git 整合、typecheck/lint hooks、Plan mode、todo list、sub-agent | 多 channel（Slack/WhatsApp/Discord）、skill 系統、Memory.md 個人記憶 |
| Harness | 校準「寫好 code」：必先 plan 再 implement、commit 進度、跑 verification、不准 one-shot 整個 app | 校準「做個好 personal assistant」：記得 user 是誰、跨 channel 連貫、人格穩定、能拒絕奇怪請求 |
| 主任務 | agentic coding | personal AI assistant |

**結論**：同顆 Opus 4.6 被裝進「為寫 code 設計的身體+約束」vs「為 personal assistant 設計的身體+約束」，跑出來的自然不一樣。

---

## 五個論證為何 body / harness 該分開

### 1. ChatGPT 第一代為什麼不算 agent

Viv 二分法下 ChatGPT 是「沒有 tool 的 agent」——但這聽起來怪。三層拆下：有大腦、有對話 loop（某種 harness），**但沒有手腳**——所以不是 agent。Agent 的核心不是會回話，而是能透過手腳對外部環境產生**可驗證影響**。

### 2. Anthropic 4/23 postmortem：harness 改一行就出包

> 「The models themselves were not to blame, but three separate issues in the Claude Code harness caused complex but material problems which directly affected users.」

三個改動：
- **3/4**：default reasoning effort 從 high 改成 medium
- **3/26**：caching bug——本應每 1 小時 idle 清一次 thinking history，變成每一輪都清，「made Claude seem forgetful and repetitive」（官方原文）
- **4/16**：system prompt 加了一條限制：「Length limits: keep text between tool calls to ≤25 words. Keep final responses to ≤100 words unless the task requires more detail.」 Anthropic 自己評估這條「caused an outsized effect on intelligence in Claude Code」

這幾個改動**沒動到 body**（bash 還是 bash、filesystem 還是 filesystem），動到的是 **harness**——校準 output 分布的那一層。**harness 就是個校準層：寫錯一點，整個 output 分布跑掉**。

### 3. 為什麼 model 變強，harness 不會消失

如果 harness = model 補丁，model 變強，harness 該越來越薄。但事實不是這樣：

- harness 在解的是「LLM 永遠 non-deterministic」這個結構問題
- Model 變強 ≠ 變得 deterministic
- 輸出永遠有分布、永遠需要校準

**Body 會隨 model 變強長新器官**（[[OpenAI]] Computer Use、多 agent 並行），但 harness 永遠在——因為 non-deterministic 是 LLM 的本質，不是 model 弱的副作用。

### 4. ChatGPT Images 2.0 案例——harness 升級的體感

OpenAI 2026/4/21 推 ChatGPT Images 2.0（gpt-image-2），官方明說這是「first image model with thinking capabilities」：

> 「search the web for real-time information, create multiple distinct images from one prompt, and double-check its own outputs」

「字終於都對了」「細節超多」這個體感不只是 model 換了多少——更是 **harness 升級**：「生完一張不算完，要 search、要 double-check」這層約束邏輯加上去，輸出品質就會感受到「變強」。

### 5. terminal-bench@2.0 Leaderboard：harness 對特定模型過擬合

不換模型只改 harness 就有不同 Accuracy。兩件事：
- 模型對特定 harness 有不同效果——Codex 模型對 `apply_patch` tool 過擬合到 OpenCode 為了支援 GPT 還要特別寫 apply_patch 模擬層
- 「該模型最佳的 harness 就是它被訓練的那個」也不一定——你的 task 可能根本不是它被訓練的 task

---

## Harness 在做的具體事（六種模式）

> 理解 harness 本質是「校準輸出分布」，再看現在的 harness 工程，邏輯就清楚：

1. **CLAUDE.md / AGENTS.md**——把高頻偏離行為（commented-out test、忘記 commit、用錯 logger）寫成規則，把分布收窄。
2. **Hooks**——CLAUDE.md 寫「請不要 X」，模型不一定遵守；Hook 是「做了 X 就 block」——把分布的某些區域直接砍掉。HumanLayer 原則：「success is silent, and only failures produce verbose output」（agent 輸出錯誤把錯誤丟回去）。
3. **Planner / Generator / Evaluator 分離**——[[Anthropic]] 關鍵發現：絕對不能讓同一個 agent 自己寫自己評，self-evaluation 永遠偏正向。對抗性 evaluator 才有信號。Anthropic 2026/3/24 harness design 文章直接寫結論——「three-agent architecture—planner, generator, and evaluator」。
4. **Sub-agent 不只是角色扮演，是 context firewall**——主 agent 只看到自己丟給 sub-agent 的 prompt 跟最終結果，中間所有 grep、tool call、檔案讀取都不污染主 thread。每個 sub-agent 拿全新 context window 跟全新 instruction budget——維持長時程 coherence 的關鍵。
5. **Back-pressure / Verification loop**——不要相信 agent 自己說「我做完了」。寫 typecheck、寫 test、跑 build，有錯就把錯誤丟回去。
6. **Mistake → Rule**——HumanLayer 引用 Mitchell Hashimoto：「anytime you find an agent makes a mistake, you take the time to engineer a solution such that the agent never makes that mistake again」。Addy Osmani：「Every line in a good AGENTS.md should be traceable back to a specific thing that went wrong.」

> 作者誠實補充：mistake → rule 一直加 rule 模型也不一定會遵守。也許更好的做法是一開始就把 harness 結構化（hooks、rule-based 中介層），而不是不停堆 rule——研究中。

---

## Body 目前產業做到什麼程度

| 標準件 | 作用 |
|--------|------|
| Filesystem + Git | 持久狀態、跨 session 工作、版本控制 |
| Bash + 程式執行 | 自主寫 tool 不靠 pre-built。Simon Willison：agent 已對 shell command 很熟，大部分任務可收斂到幾個 CLI 呼叫 |
| Sandbox | 隔離執行環境、預裝 runtime 跟工具鏈 |
| Browser / Computer Use | 開始能跟 GUI 互動，不只是 terminal |
| MCP server | 擴充工具庫、連 SaaS（Linear、Sentry、Notion）。但要小心 tool description 也是 prompt，塞太多光描述就把 context 撐爆 |
| Web Search、Read Image | 其他人類能做的幾乎都做得到 |

> **MCP 注意**：如果某個 MCP 跟成熟 CLI 功能重疊，**用 CLI 比較划算**（呼應 [[Skill vs Bash vs MCP]] 的 risk-cost 取捨）。

---

## 為什麼 sub-agent 是 context firewall 這麼重要

### Chroma context rot research

18 個模型在 needle-in-a-haystack 任務上，**全部隨 context 變長表現變差，連簡單任務都一樣**。

NIAH 經典 benchmark：在幾十萬字的長文裡塞一句完全無關的句子（例如「在 Dolores Park 吃三明治是 SF 最棒的事」），然後問 model：「SF 最棒的事是什麼？」看能不能找到。Chroma 加碼——在 context 裡塞跟 needle 語意接近但不對的 distractor，發現 context 越長、distractor 越多，**所有 18 個模型都掉分**。

> **這證明「拉長 context window」不是解——你只是把 haystack 變大，模型找 needle 的能力沒變強。**

### 真正的解：sub-agent 結構性切割 context

每個 sub-agent 拿全新 context window 跟全新 instruction budget，做完只回答案 + 引用 filepath:line。主 agent 不會被中間過程的 distractor 污染。順便省錢——主線跑 Opus（thinking-heavy），sub-agent 跑 Sonnet 或 Haiku（grep 之類的 cli 工具）。

---

## 結論：Model 變強之後，body 跟 harness 各自怎麼變

| 層 | 演化方向 |
|----|----------|
| **Body** | 會長新器官——從 bash + filesystem，長到 Computer Use、長到多 agent 並行協作、跨 device 操作 |
| **Harness** | 會搬家但不會消失——它在解的不是「model 弱」的問題，是「LLM 本質 non-deterministic」的問題。Sonnet 4.5 的 context anxiety scaffolding 在 Opus 4.6 時代拆掉，但同時間天花板上移、新失敗模式跑出來、新 scaffolding 又長出來 |

真正會被 model 變強解掉的，是「補 model 弱點」的 harness（subagent for context isolation、Ralph Loop for early stop）。

留下的、會永遠在的，是「**校準 non-deterministic 系統**」的 harness——hooks、verification、sub-agent firewall、planner-evaluator 等等。

> 模型是大腦
> 工具是手腳
> Harness 是把這個生物從「會動」變成「可控」

> 下次有人說「等更強的模型出來就好了」——可以反問：這個問題本質是缺大腦，是缺手腳，還是缺約束？

---

## 與既有 wiki 的關係

### 與 [[src-Harness Engineering]]（李宏毅）的差異

| 維度 | 李宏毅版本 | 本文版本 |
|------|----------|---------|
| 拆解層數 | 二層 | 三層 |
| 公式 | Agent = LLM + Harness | Agent = Model + Body + Harness |
| Body 的位置 | 隱含在 Harness 中（工具權限、能力邊界） | **獨立為一層** |
| 案例 | Gemma 4 2B 80 字實驗、agents.md 13.5→85 | OpenClaw vs Claude Code 同模型差異、Anthropic postmortem |
| 觀點 | 環境設計 > 模型訓練 | 環境設計 = 身體（能做什麼） + 約束（會不會做歪） |

**互補關係**：李宏毅版「三種控制手段」（認知框架、能力邊界、工作流程）中的「能力邊界」其實就是本文的 body 層；李宏毅把它包在 Harness 中，本文把它獨立出來。**對概念分析有意義（讓「Anthropic postmortem 改 harness 不改 body」這類事件得以精確描述）**。

### 與 [[綜整-AI協作工程的六大趨勢]] 的關係

本文加深「趨勢一：環境比模型聰明」的論證——具體拆出「環境」其實有 body 與 harness 兩個獨立可調維度。

### 與 [[Skill vs Bash vs MCP]] 的對應

| 工具模式 | 三層拆解中的位置 |
|----------|----------------|
| Skill | Harness（引導機率分布） |
| Bash | Body（執行能力） |
| MCP | Body 邊緣 + Harness 約束（受限接口的本質就是「能做什麼」+「不能做什麼」雙重） |

---

## 引用文獻清單（作者引用的）

| 來源 | 主題 |
|------|------|
| Viv Trivedy（LangChain）「Anatomy of an Agent Harness」 | Agent = Model + Harness 原始公式（2026/3） |
| HumanLayer「Skill Issue」 | mistake → rule 原則 |
| Anthropic engineering blog | long-running agent / harness design（2026/3/24） |
| Anthropic 2026/4/23 postmortem | 三個 harness 改動造成 Claude Code 品質下降 |
| OpenAI 2026/4/21 ChatGPT Images 2.0 公告 | gpt-image-2 with thinking capabilities |
| Mitchell Hashimoto（HashiCorp 創辦人） | 「anytime you find an agent makes a mistake...」原句 |
| Addy Osmani（Google） | 「Every line in a good AGENTS.md should be traceable...」原句 |
| Chroma context rot research | 18 個模型 NIAH 全部隨 context 變長掉分 |
| Simon Willison | 「agent 對 shell command 很熟，大部分任務可收斂到幾個 CLI 呼叫」 |
| terminal-bench@2.0 Leaderboard | 模型對特定 harness 過擬合的證據 |

---

## 查核備註

⚠️ 本來源是作者第一人稱論述，引用了大量未提供具體連結的二手主張：
- **Anthropic 4/23 postmortem 三條改動**——具體日期與條文若需驗證需查 [[Anthropic]] engineering blog 原文
- **Anthropic 3/24 harness design 三角架構**——李宏毅版本在 [[src-Harness Engineering]] 中也提到 Planner-Generator-Evaluator，互相佐證
- **Chroma context rot research**——18 模型 NIAH 結論屬實，Chroma 2026 年確發表此研究
- **「first image model with thinking capabilities」原文**——OpenAI 2026/4/21 確發表 gpt-image-2，但具體用詞需查官方公告
- **Mitchell Hashimoto / Addy Osmani 引用**——屬廣為流傳之 quote，屬於可信圈內知識

整體論述邏輯一致、案例具體，作為「OpenClaw vs Claude Code 體感差異」的解釋框架是有效的；但「Agent = Model + Body + Harness」屬作者個人術語，**不應誤認為業界共識**——傳播時應標明出處。

---

## 相關頁面

- [[src-Harness Engineering]]（李宏毅版本：二層拆解、agents.md 研究、Ralph Loop、Lifelong AI Agent）
- [[Claude Code]]（本文核心案例之一）
- [[綜整-AI協作工程的六大趨勢]]（本文補強趨勢一論點）
- [[Skill vs Bash vs MCP]]（工具模式的對應）
- [[Restatement]]（harness 對抗 context rot 的補充手段）
- [[src-AI-Agent避坑指南]]（sub-agent 作為 context firewall 的實戰經驗）
- [[src-Claude Code Session管理]]（context rot 在 300-400k 的實測觀察）
- [[Anthropic]]（postmortem 與 harness design 系列文章發布方）
- [[OpenAI]](ChatGPT Images 2.0 案例 + Codex 對 apply_patch 過擬合)
