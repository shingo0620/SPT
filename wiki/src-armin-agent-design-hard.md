---
title: "Agent Design Is Still Hard — Armin Ronacher 的 agent 工程實戰心得"
type: source
sources: [agent-design-is-still-hard-armin-ronachers-thoughts-and-writings.md]
created: 2026-05-11
updated: 2026-05-11
tags: [armin-ronacher, agent-engineering, anthropic, vercel-ai-sdk, claude-code, mcp]
---

# Agent Design Is Still Hard

> 來源：[Armin Ronacher（mitsuhiko）blog](https://lucumr.pocoo.org/2025/11/21/agents-are-hard/) | 發表 2025-11-21

[Armin Ronacher](https://lucumr.pocoo.org/2025/11/21/agents-are-hard/about/)（Flask / Jinja2 / Pocoo 創辦人；現於 [Earendil](https://earendil.com/)）分享建立 agent 的實戰心得。

## TL;DR

> Building agents is still messy.

- **SDK 抽象在真實 tool use 下會破**
- **Caching 自己管比較好**，但跨模型差異大
- **Reinforcement 比預期更重要**
- **失敗要嚴格隔離**避免污染 loop
- **共享狀態用 file-system-like 層** 是重要 building block
- **Output tooling 出乎意料地棘手**
- **Model choice 仍依任務而定**

## 7 個實戰議題

### 1. Agent SDK 該用哪個？

- **選項 A**：直接用 OpenAI SDK / Anthropic SDK（[[Anthropic]]）
- **選項 B**：高階抽象——Vercel AI SDK / Pydantic

**Armin 結論**：他們原本用 Vercel AI SDK（只用 provider abstraction，自己跑 agent loop），現在會選 A。原因：

1. **模型間差異大**：cache control、reinforcement 需求、tool prompts、provider-side tools 等。在「正確的抽象未明」時，直接 SDK 保留全控制
2. **Provider-side tools 處理困難**：Anthropic 的 web search tool 透過 Vercel SDK routine destroy message history
3. **錯誤訊息更清楚**：直接 SDK 的錯誤更可讀
4. **Cache 管理更容易**：直接 SDK 控制更多

⚠️ 這是 2025-11 時的觀察，可能改變。

### 2. Caching 教訓

[[Anthropic]] 的「**顯式 cache 管理**」原本看似笨重，現在 Armin 喜歡：

> 「I initially found the manual management pretty dumb. Why doesn't the platform do this for me? But I've fully come around and now vastly prefer explicit cache management.」

**好處**：
- 成本與快取使用率可預測
- 可以「split off conversation」並行跑兩個方向
- 可以做 context editing
- 比較容易理解 agent 的成本結構

**Anthropic 標準快取點配置**：
- 1 個快取點放在 system prompt 之後
- 2 個快取點放在對話開頭（最後一個隨對話尾移動）
- 「現在時間」之類動態訊息要**晚一點塞**，否則 trash cache

### 3. Reinforcement in the Agent Loop

每次 agent 跑 tool，可以「不只回 tool 結果，還回更多 context」：

- 提醒整體目標與個別任務狀態
- tool 失敗時給 hint 怎麼成功
- 通知背景 state changes
- 處理 parallel execution 的狀態變化

#### Self-reinforcement 案例

> 「In [[Claude Code]], for instance, the todo write tool is a self-reinforcement tool. All it does is take from the agent a list of tasks that it thinks it should do and echo out what came in. It's basically just an echo tool; it really doesn't do anything else. But that is enough to drive the agent forward better than if the only task and subtask were given at the beginning of the context and too much has happened in the meantime.」

→ **Claude Code 的 TodoWrite 本質是 echo 工具**，卻足夠驅動 agent。這是 [[Claude Code]] 內部工具設計哲學的重要洞察。

### 4. Isolate Failures（隔離失敗）

兩個方法：

#### 方法 A：Subagent 跑可能失敗的任務
- 主 agent 看不到失敗細節，只看到最終成功 + brief 摘要「哪些方法不行」
- agent 學到失敗模式才能在下個任務避開

#### 方法 B：Context editing（[[Anthropic]] 限定）
- 把失敗從 context 移除以省 token
- **缺點**：自動 invalidate caches
- Armin：「to far we haven't had a lot of success with context editing」——還在實驗中

### 5. Sub Agents / Sub Inference + Virtual File System

> 「You should try to build an agent that doesn't have dead ends. A dead end is where a task can only continue executing within the sub-tool that you built.」

例：圖像生成 tool 只能 feed 圖回給另一個 tool，但不能塞進 code execution 的 zip——是 dead end。

**解方**：**virtual file system 作共享狀態**——所有 tool 都吃/吐路徑：
- `ExecuteCode(path)` 與 `RunInference(path)` 用同一個 fs

對應 [[Anthropic]] 近期推的「memory tool」與 [[Claude Code]] 的 file-based context 設計思路。

### 6. Output Tool 的意外困難

Armin 的 agent **不是 chat session**——中間訊息不可見，最終用「output tool」（如送 email）對外溝通。問題：

1. **語氣難控制**：透過 output tool 的措辭 vs 主 loop 的 text output，前者意外地難 steer
2. **「Output tool 跑 sub-LLM 調語氣」失敗**：增加延遲、降低品質、漏資訊
3. **Agent 有時不呼叫 output tool**：解方——loop 結束時若沒呼叫過，注入 reinforcement 訊息

### 7. Model Choice

| 用途 | 推薦 |
|------|------|
| Main agent loop | **Haiku + Sonnet 仍是最佳 tool callers**；Gemini 次之 |
| Large document / PDF summarization | **Gemini 2.5** |
| Image extraction | **Gemini 2.5**（[[Anthropic]] Sonnet 容易撞 safety filter）|
| **不推薦** | GPT 家族（主 loop 用得不順手）|

**關鍵洞察**：「token cost 單獨不能決定 agent 成本——更好的 tool caller 用更少 token 完成工作」。

### 8. Testing and Evals（最難解的問題）

> 「This is not entirely surprising, but the agentic nature makes it even harder. Unlike prompts, you cannot just do the evals in some external system because there's too much you need to feed into it.」

需要 observability-based 或 instrumented test runs。Armin 自己也沒找到讓他滿意的方案——「I have to report that at the moment we haven't found something that really makes us happy」。

→ 對應 wiki [[PluginEval]] 提出的解方框架（三層評估 × 10 維度 × 統計 CI）正是試圖填補這個空缺。

## Coding Agent 個人偏好

- 主要工具：[[Claude Code]]
- 試用中：**Amp**（Sourcegraph）
- 為何 Amp：「Oracle 與 main loop 的 sub-agent 互動設計很美」
- 觀察：「Amp + Claude Code 都讓人感覺『產品團隊真的在用自家工具』」

## 推薦的延伸閱讀（Armin 自選）

1. ⭐ **[What if you don't need MCP at all?](https://mariozechner.at/posts/2025-11-02-what-if-you-dont-need-mcp/)** by Mario Zechner——批評多數 MCP servers 過度工程化、吃太多 context；提出「minimal CLI tools + Bash」替代方案。Armin 已基於此做出 [browser skill](https://github.com/mitsuhiko/agent-commands/tree/main/skills/web-browser)
2. **[The fate of "small" open source](https://nolanlawson.com/2025/11/16/the-fate-of-small-open-source/)** by Nolan Lawson——AI 時代「小型單一用途 OSS lib」將消亡（Armin 加註「Thank fucking god」）
3. **Tmux is love**——若有「interactive system that agent should work with」，給 agent [Tmux skill](https://github.com/mitsuhiko/agent-commands/tree/main/skills/tmux)
4. **[LLM APIs are a Synchronization Problem](https://lucumr.pocoo.org/2025/11/22/llm-apis/)**——Armin 自己另一篇延伸文

## 跨 wiki 連動

### 主要連結
- **[[Claude Code]]**：Armin 的主要 agent；TodoWrite 作 self-reinforcement 的觀察極具洞察力
- **[[Anthropic]]**：cache management、context editing、Sonnet/Haiku tool calling 的具體實戰
- **[[Skill vs Bash vs MCP]]**：Mario Zechner 的「不要 MCP」觀點是這個概念頁的重要反證
- **[[src-bug-hunter]]** / [[Multi-Agent 失敗分類學]]：sub-agent isolation、failure containment 是該主題的具體 implementation
- **[[src-karpathy-sequoia-ascent-2026]]**：Karpathy 的「Agentic Engineering」抽象，Armin 是其具體 hands-on 細節

### 中強連結
- **[[PluginEval]]**：Armin 痛苦的「testing & evals」問題，PluginEval 的三層評估是解方
- **[[src-mast]]**：MAST 的 14 FM 對應 Armin 看到的多數 agent 問題
- **[[src-andrej-karpathy-skills]]** / [[src-mattpocock-skills]] / [[src-addyosmani-agent-skills]]：Armin 的 [agent-commands](https://github.com/mitsuhiko/agent-commands) 是同類 skill 生態的一員
- **[[Armin Ronacher]]**（待建 entity 頁）：本來源 + 5/8 GitHub Trending #7 mitsuhiko/pi-ds4 已達 2 source，可考慮建獨立 entity 頁

### 弱連結
- **[[Inference.sh]]**：indie agentic infrastructure 案例
- **[[antirez]]**：另一位 indie 邊緣設備跑 LLM 的代表（Pi llama.cpp 實驗）

## 觀察

### 文章定位
- **B+ 級實戰文**：Armin 是 Flask / Jinja2 / Pocoo 的創辦人，技術權威性高
- **時效性**：2025-11-21 發表，至 2026-05 仍多數有效；唯「Vercel AI SDK 不如直接 SDK」可能隨 SDK 改進變化

### 對 wiki 的補充價值
與 Karpathy Sequoia 訪談形成「抽象 + 具體」雙層：
- Karpathy 提出 **Software 3.0、Agentic Engineering** 等抽象框架
- Armin 提供 **caching points 配置、reinforcement injection、virtual fs 設計、output tool 模式**等具體實作細節

### TodoWrite 是 echo tool 的洞察
> 「In Claude Code, the todo write tool is a self-reinforcement tool. It's basically just an echo tool.」

→ 這個觀察解釋為何 [[Claude Code]] 的 TodoWrite 在實際使用上「明顯讓 agent 行為更聚焦」——本質不是儲存 task，而是強制 agent 重述目標。

### Mario Zechner 的反 MCP 觀點
> 「Many MCP servers are overengineered and include large toolsets that consume lots of context.」

對應 wiki [[Skill vs Bash vs MCP]] 既有概念——Mario 與 Armin 的立場：**簡單 CLI tools + Bash 比複雜 MCP server 更實用**。本 wiki 應在 [[Skill vs Bash vs MCP]] 中追加這個反觀點。

## 結語

Armin 全文最關鍵的一句：

> 「Everything has to be rewritten. Most things are still fundamentally written for humans.」

呼應 Karpathy 的「Agent-Native Infrastructure」——但 Armin 的版本更尖銳：**整個產業的軟體都要為 agent 重寫**。
