https://www.facebook.com/share/1HJJVjFR6U/?mibextid=wwXIfr

OpenClaw 跟 Claude Code 都用 Opus 4.6 — 為什麼做同一件事，結果差這麼多？

不是模型問題 — 是它們的「身體」跟「性格」根本不一樣

——

Viv Trivedy（LangChain）3 月寫了《Anatomy of an Agent Harness》把這個概念寫得最經典，HumanLayer 接著寫《Skill Issue》，Anthropic 自己 engineering blog 也用這個詞發了 《long-running agent》、《harness design》這幾篇

《Anatomy of an Agent Harness》原文：
「If you’re not the model, you’re the harness. A harness is every piece of code, configuration, and execution logic that isn’t the model itself. A raw model is not an agent.」

裡面提到的等式是：

Agent = Model + Harness

但我參透 OpenClaw vs Claude Code 差異之後，覺得這個等式可以再細（它把兩件本質不同的事，混在一起叫 harness）

——

【我認為 Agent = Model + Body + Harness】

這不是業界主流文獻的標準術語，是我用來解釋 OpenClaw 跟 Claude Code 體感差異的工作框架

我認為應該拆成三層：
・Model — 大腦，intelligence 本身
・Body — 手腳：tool use、filesystem、bash、sandbox、browser、MCP — 決定它能不能做事
・Harness — 約束：CLAUDE.md、hooks、planner-evaluator 拆分、sub-agent 結構、back-pressure — 決定它會不會做歪

我自己的區分是 — body 跟 harness 是不同東西

Body 是能力延伸 — 沒有手腳，再聰明的大腦也只能在腦內喊「我想做 X」

Harness 是行為校準 — LLM 永遠是 non-deterministic 的，輸出有分布

Harness 在做的事是把這個分布收窄、收到可預測的範圍

——

【拆 OpenClaw vs Claude Code】

回到一開始那個問題 — 為什麼同樣 Opus 4.6，Claude Code 寫 code 強，OpenClaw 普普 (不好意思，個人體感，哈)

Model 一樣，都是 Opus 4.6

Body 不一樣：
・Claude Code 出生就是給工程師寫 code 的 — bash 直接執行、filesystem 直接讀寫、git 整合、自帶 typecheck/lint hook、Plan mode、todo list、sub-agent
・OpenClaw 是個 personal AI — body 設計給 personal assistant 用：多 channel（Slack/WhatsApp/Discord）、skill 系統、Memory.md 累積個人記憶。寫 code 是它的能力之一，但不是它的器官中心

Harness 不一樣：
・Claude Code 的 system prompt 跟內建 skill 全部在校準「寫好 code 的行為」 ，例如，一定要先 plan 再 implement、commit 進度、跑 verification、不准 one-shot 整個 app
・OpenClaw 的 harness 在校準「做個好的 personal assistant」 ，例如，記得 user 是誰、跨 channel 連貫、人格穩定、能拒絕奇怪請求

同一顆 Opus 4.6，被裝進

「為寫 code 設計的身體 + 為寫 code 設計的約束」
「為 personal assistant 設計的身體 + 為 personal assistant 設計的約束」

跑出來的自然就不一樣

所以不是模型強弱問題，是身體跟約束被調去解不同問題

——

【為什麼選擇這個拆法】

把 body 跟 harness 分開講，下面這些事就會更容易理解：
 1. ChatGPT 第一代為什麼不算 agent
Viv 的定義會說它是「沒有 tool 的 agent」— 但這聽起來怪怪的
依我這裡採用的定義 — 它有大腦、有對話 loop（某種 harness），但沒有手腳 — 所以不是 agent

在我的框架裡，agent 的核心不是只會回話，而是能透過手腳對外部環境產生可驗證影響

 2. 為什麼 Anthropic 改 verbosity 限制會出包
2026 年 4 月，Anthropic 官方 postmortem 承認，Claude Code 近期的品質問題來自三個 product / harness 層變更，而不是 API 模型本身退化

4/23 postmortem 原文：
「The models themselves were not to blame, but three separate issues in the Claude Code harness caused complex but material problems which directly affected users.」

三個改動分別是：
・3/4 把 default reasoning effort 從 high 改成 medium
・3/26 一個 caching bug，本來應該每 1 小時 idle 才清一次 thinking history，結果變成每一輪都清，「made Claude seem forgetful and repetitive」（官方原文）
・4/16 在 system prompt 加了一條限制，原文是：
「Length limits: keep text between tool calls to ≤25 words. Keep final responses to ≤100 words unless the task requires more detail.」

這條限制 Anthropic 自己評估「caused an outsized effect on intelligence in Claude Code」

這幾個改動不是動到 body（bash 還是 bash、filesystem 還是 filesystem），動到的是 harness — 在校準 output 分布的那一層

Harness 改一行就出包，因為它是個校準層：寫錯校準一點點，整個 output 分布就跑掉

 3. 為什麼 model 變強，harness 不會消失
如果 harness = model 補丁，那 model 變強，harness 該越來越薄

但事實不是這樣，這個拆法解釋了為什麼 — harness 在解的是「LLM 永遠是 non-deterministic」這個結構問題
Model 變強 ≠ 變得 deterministic

輸出永遠有分布，永遠需要校準

Body 會隨 model 變強長新器官（Computer Use、多 agent 並行），但 harness 永遠在 — 因為 non-deterministic 是 LLM 的本質，不是 model 弱的副作用

——

【關於 ChatGPT 生圖】

OpenAI 在 2026/4/21 推出 ChatGPT Images 2.0（gpt-image-2），官方明說這是「first image model with thinking capabilities」

官方原文寫它能做的事：

「search the web for real-time information, create multiple distinct images from one prompt, and double-check its own outputs」

很明顯
「字終於都對了」
「細節超多」

底層 model 換了多少、新增多少 reasoning capability，OpenAI 沒講清楚到能讓我下結論。但讀者體感的「變強」很明顯

這就是 harness 升級的體感樣態之一 — 不管 model 換了多少、即使完全沒換，「生完一張不算完，要 search、要 double-check」這層約束邏輯加上去，輸出品質就會可能感受到「變強」

Coding agent 也是一樣

OpenClaw 跟 Claude Code 都用 Opus 4.6 — model 一樣

差別在 Claude Code 在 coding 這件事上加了多層 harness：context 壓縮、行為邊界、記憶精煉、verification loop

OpenClaw 是 personal assistant，主要還是以記憶更新、long-running 助理為主軸 — 所以同顆 Opus，寫 code 時的「自我檢查嚴格度」差很多

依我的框架，Harness 就是 agent 的「行為約束」那一層

——

【Harness 在做的具體事】

理解了 harness 的本質是「校準輸出分布」，再看現在大家在做的具體 harness 工程，邏輯就很清楚：
 1. CLAUDE.md / AGENTS.md — 把高頻偏離行為（commented-out test、忘記 commit、用錯 logger）寫成規則，把分布收窄（不過這邊還有一個進階的題目要討論：context compression 後造成的遺忘）

 2. Hooks — CLAUDE.md 若寫「請不要 X」，模型輸出不一定會遵守。Hook 是「做了 X 就 block」— 把分布的某些區域直接砍掉。HumanLayer 有一條原則就是在做這個 — 「success is silent, and only failures produce verbose output」（agent 輸出錯誤，把錯誤丟回去）

 3. Planner / Generator / Evaluator 分離 — Anthropic 一個關鍵發現：絕對不能讓同一個 agent 自己寫自己評，self-evaluation 永遠偏正向。對抗性的 evaluator 才有信號

Anthropic 2026/3/24 那篇 harness design 直接寫了結論 — 「three-agent architecture—planner, generator, and evaluator」

 4. Sub-agent 不只是角色扮演、換人看，是 context firewall — 主 agent 只看到自己丟給 sub-agent 的 prompt 跟最終結果，中間所有 grep、tool call、檔案讀取都不污染主 thread

每個 sub-agent 拿全新 context window 跟全新 instruction budget — 這是維持長時程 coherence 的關鍵

 5. Back-pressure / Verification loop — 不要相信 agent 自己說「我做完了」。寫 typecheck、寫 test、跑 build，有錯就把錯誤丟回去

 6. Mistake 要變 Rule — HumanLayer 引用 Mitchell Hashimoto 的話 — 「anytime you find an agent makes a mistake, you take the time to engineer a solution such that the agent never makes that mistake again」

每一條 CLAUDE.md 規則、每一個 hook，都應該追得回某次具體的失敗 — Addy Osmani 的觀點：「Every line in a good AGENTS.md should be traceable back to a specific thing that went wrong.」

(這個我自己還在想…體感上 mistake → rule 一直加 rule 模型也不一定會遵守。也許更好的做法是一開始就把 harness 結構化（hooks、rule-based 中介層），而不是不停堆 rule，研究中，我也不知道)

——

【Body 目前產業現在做到什麼程度】

Body 是「能做什麼」的層，這幾年累積出的標準件：
・Filesystem + Git — 持久狀態、跨 session 工作、版本控制
・Bash + 程式執行 — 自主寫 tool 不靠 pre-built。Simon Willison：agent 已經對 shell command 很熟，大部分任務可以收斂到幾個 CLI 呼叫
・Sandbox — 隔離執行環境、預裝 runtime 跟工具鏈
・Browser / Computer Use — 開始能跟 GUI 互動，不只是 terminal
・MCP server — 擴充工具庫，連接 SaaS 服務（Linear、Sentry、Notion）。但要小心：tool description 也是 prompt，塞太多 server 光描述就把 context 撐爆
・Web Search、Read Image、控制瀏覽器，其他人類能做的幾乎都做得到

關於 MCP 還有一個要注意的 — 如果某個 MCP 跟成熟 CLI 功能重疊，用 CLI 比較划算

——

【為什麼 sub-agent 是 context firewall 這麼重要】

這邊岔出去多講一點，因為這個觀念對寫多 agent 並行的場景是關鍵

Chroma 有一篇 context rot research — 18 個模型在 needle-in-a-haystack 任務上（在草堆上找針），全部隨 context 變長表現變差，連簡單任務都一樣

NIAH 是個經典 benchmark — 在幾十萬字的長文裡塞一句完全無關的句子（例如「在 Dolores Park 吃三明治是 SF 最棒的事」），然後問 model：「SF 最棒的事是什麼？」看它能不能找到

Chroma 把難度加碼 — 在 context 裡塞跟 needle 語意接近但不對的 distractor，發現 context 越長、distractor 越多，所有 18 個模型都掉分

這證明「拉長 context window」不是解 — 你只是把 haystack 變大，模型找 needle 的能力沒變強

真正的解是 sub-agent 結構性切割 context

每個 sub-agent 拿一個全新 context window 跟全新 instruction budget，做完只回答案 + 引用 filepath:line

主 agent 不會被中間過程的 distractor 污染，順便還能省錢 — 主線跑 Opus（thinking-heavy），sub-agent 跑 Sonnet 或 Haiku（grep 之類的 cli 工具）

——

【terminal-bench@2.0 Leaderboard 紀錄】

不換模型，只改 harness，就有不同的 Accuracy

兩件事：
・模型對特定 harness 有不同效果 — Codex 模型對 apply_patch tool 過擬合到 OpenCode 為了支援 GPT 還要特別寫一個 apply_patch 模擬層
・「該模型最佳的 harness 就是它被訓練的那個」也不一定 — 你的 task 可能根本不是它被訓練的 task

回到 OpenClaw vs Claude Code — 同樣的 model，被裝進不同 harness，跑分跟跑 task 的體感不一樣就會是預料內的了

所以我同一個問題，會讓不同的 Run-time / harness 試看看，反而有意外的驚喜

——

【結論：Model 變強之後，body 跟 harness 各自怎麼變】

回到開頭：OpenClaw 跟 Claude Code 都用 Opus 4.6，寫 code 體感差很多 — 因為身體跟約束被調去解不同問題

這個拆法的重點是 — Model 變強之後，body 跟 harness 走的方向不一樣：
・Body 會長新器官 — 從 bash + filesystem，長到 Computer Use、長到多 agent 並行協作、長到跨 device 操作。Model 變強，body 用得更熟、能長更多東西
・Harness 會搬家但不會消失 — 因為它在解的不是 model 弱的問題，是 LLM 本質 non-deterministic 的問題。Sonnet 4.5 的 context anxiety scaffolding 在 Opus 4.6 時代拆掉了，但同時間天花板上移，新失敗模式跑出來，新的 scaffolding 又長出來

真正會被 model 變強解掉的，是「補 model 弱點」的 harness（subagent for context isolation、Ralph Loop for early stop）

留下的、會永遠在的，是「校準 non-deterministic 系統」的 harnes，例如，hooks、verification、sub-agent firewall、planner-evaluator 等等

模型是大腦
工具是手腳
Harness 是把這個生物從「會動」變成「可控」

——

下次有人說「等更強的模型出來就好了」

我可能會問：這個問題本質是缺大腦，是缺手腳，還是缺約束？