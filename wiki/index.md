# 索引

> 本索引由 LLM 自動維護。每次匯入或更新時同步更新。

## 來源摘要

### AI 與知識管理

- [[src-overthinking-scope-creep-structural-diffing]] — Kevin Lynagh 從 indie 開發者視角談「overthinking + scope creep + LLM 寫 code 後的 structural diff 工作流」（來源數：1）
- [[src-agent-model-body-harness]] — 三層拆解進化：Agent = Model + Body + Harness，OpenClaw vs Claude Code 同 Opus 4.6 體感差異 + Anthropic 4/23 postmortem 解析（來源數：1）
- [[src-oh-my-codex]] — OpenAI Codex CLI 的 harness 工具（27k stars / TypeScript），4 個 skill 命令（$deep-interview / $ralplan / $ralph / $team）+ tmux runtime + wiki MCP server（來源數：1）
- [[src-claude-for-creative-work]] — Anthropic 2026-04-28 推出 8 個 MCP connector（Blender / Adobe / Autodesk / Ableton / Splice 等），Claude 進入創意產業工具鏈（來源數：1）
- [[src-blender-ai-video-workflow]] — 太陽鴿鴿 2026-03-28 影片：Blender + Seedance 2.0 + Nano Banana 2 三步工作流，AI 視頻控制性差的解法（社群比 Anthropic 加入 Blender Dev Fund 早 1 個月）（來源數：1）
- [[src-andrej-karpathy-skills]] — forrestchang（同 [[Multica]] 團隊）的 103k stars CLAUDE.md repo，把 Karpathy 的 LLM coding pitfalls 觀察提煉為 4 條原則（Think Before / Simplicity / Surgical / Goal-Driven）（來源數：1）
- [[src-codeburn]] — getagentseal/codeburn 4.7k stars，AI coding token 成本可觀測 TUI dashboard，跨 16 個 AI coding 工具，本地執行（來源數：1）
- [[src-wshobson-agents]] — wshobson/agents **35k stars**：Claude Code Plugins Marketplace（80 plugins / 185 agents / 153 skills / 16 workflows / 100 commands）+ three-tier model strategy + PluginEval 統計級評估框架；個人專案 bus factor = 1（來源數：1）

> 月報 2026-05-04 ingest：5 月月報補完 05-02、05-03 兩日（共 14+ 個 daily raw + bug-hunter 手動 source）；ast-grep 安裝數 4,073（04-30）→ 4,173（05-01）→ 4,263（05-02）→ 4,324（05-03），日增 100→90→61 進入自然衰減平台期。**重大事件 5/3**：skills.sh trending `infsh-skills` repo 改名 `inference-skills` 觸發單日 −7,000 安裝重置（非真實流失）；GitHub Trending 信號崩壞日（11/15 ❌ 詐騙/外掛/盜版）；xixu-me/skills 4 件占 Top 10 #7-#10。lint P1-P4 修正完成（前次）。

> 月報 2026-05-07 ingest：5 月月報補完 05-04、05-05、05-06 三日（共 24 個 daily raw）。**重大發現**：（1）**ast-grep 衰減假設失效**——5/4-5/6 日增 +106/+116/+157 V 字反彈，[[週綜整-2026-W18]] 的「自然平台期」推論被推翻；（2）**Inference.sh install 24h 完全恢復**（5/3 20.5k → 5/4 31.4k +10.8k 同步躍升），確認改名是統計層級重置；（3）**find-skills 4 日 +60% 暴漲**（11.7k → 18.6k），可能解釋 ast-grep 連動加速；（4）HN 5/5 #12 **Bun 從 Zig 遷至 Rust 666 分**（語言生態地震）+ HN 5/6 #5 **Cloudflare agents 可建帳號 + 買域名 + 部署 518 分**；（5）PH 5/5-5/6 agent ROI / parallel agents / 成本優化（Kilo Code v7 / Waydev Agent / WOZCODE）；（6）GitHub Trending **#9 rihebty/flow-kit 整合 8 個 skill 框架**（bmad/spec-kit/OpenSpec/GSD/claude-task-master/superpowers/gstack/skills）。
- [[src-向三位大師學AI筆記]] — 三位科技領袖的 AI 知識管理方法論比較（來源數：1）
- [[src-karpathy筆記實作]] — LLM Wiki 實作教學與 RAG 比較（來源數：1）
- [[src-LLM Wiki]] — Karpathy 的 LLM Wiki 原始構想文件完整版（來源數：1）
- [[src-Skill Bash MCP]] — Skill、Bash、MCP 三種 LLM 工具的定位與選擇（來源數：1）
- [[src-dotLLM]] — 用 C#/.NET 打造 LLM 推論引擎，含 AI 輔助開發方法論（來源數：1）
- [[src-AI輔助工作流程]] — Tech Lead 的 7 步驟結構化 AI 開發工作流（來源數：1）
- [[src-API-Key設計]] — 多租戶 API Key 設計，從 SHA-256 到 SHAKE256（來源數：1）
- [[src-mattpocock-skills]] — Matt Pocock 的 Claude Code Skills 合集，含 PRD/Issue/Plan 具體模板（來源數：1）
- [[src-AI-Agent避坑指南]] — 三次 Agent 架構演進實戰：Plan-and-Execute → Skill → 上下文隔離（來源數：1）
- [[src-Claude Code五個底層概念]] — 概率、窗口、模型、循環、層級——駕馭 LLM Agent 的心智模型（來源數：1）
- [[src-Harness Engineering]] — Harness Engineering 駕馭工程：agents.md、Ralph Loop、Lifelong AI Agent（來源數：1）
- [[src-Code Review已死]] — Code Review 已死：Spec-driven development + Swiss-cheese 五層信任模型（來源數：1）
- [[src-Claude Code Routines]] — Claude Code Routines：排程／API／GitHub 事件驅動的雲端自主任務，Lifelong AI Agent 第一版可用產品（來源數：1）
- [[src-Claude Code Session管理]] — Anthropic 團隊講 Claude Code session 管理：context rot、rewind、compact vs clear、bad compact、subagent 決策準則（來源數：1）
- [[src-AI時代的測試管理]] — 敏捷三叔：AI 寫 code 時代的測試與 Bug 管理盲點，提出「AI 品質共謀」概念（來源數：1）
- [[src-multica-devv-ai盡調]] — Multica / Devv.AI 盡調：3 人團隊 10k stars、OSS Investment Scorecard v1.3.1（來源數：1）
- [[src-multica-github-readme]] — Multica 官方 GitHub README（2026-04-21）：8 種 CLI 支援、Next.js 16 + Go + PostgreSQL/pgvector 技術棧、vs Paperclip 對比（來源數：1）
- [[src-addyosmani-agent-skills]] — Addy Osmani 的 20 個 Production-Grade Agent Skill，覆蓋完整 SDLC 6 階段，支援 8 個主流 agent 平台（來源數：1）
- [[src-obsidian-llm-wiki]] — aster-life/obsidian-llm-wiki：Obsidian + Claude Code 的 LLM Wiki 懶人包，架構與本 wiki 高度對齊（來源數：1）

### 遊戲設計與開發

- [[src-遊戲引擎的未來]] — 秦无邪 OvO 影片：商用 vs 自研引擎、Unity 風險、未來「人 + AI 代理共用」遊戲引擎、遊戲文藝復興類比（來源數：1）
- [[src-遊戲製作流程]] — 遊戲開發五大階段架構級拆解，含大量 3A 案例（來源數：1）
- [[src-MDA框架]] — MDA 框架介紹，遊戲設計的系統性分析語言（來源數：1）
- [[src-遊戲發想四問]] — 心智圖四問法，將靈感轉化為具體開發方向（來源數：1）
- [[src-零基礎用AI做遊戲]] — 用 AI 全程開發遊戲的實戰記錄，含免費美術工作流（來源數：1）

### 商業與顧客管理

- [[src-顧客管理50問]] — 50 題自我診斷問卷，顧客基本面、回購行為、分級、CLV、關係管理（來源數：1）

### 獨立開發與架構

- [[src-Solo SaaS架構]] — Steve Hanov 的 $20/月 solo SaaS 架構分析：Go + SQLite + 本地 GPU 的反直覺決策（來源數：1）

### 每日新知（月報）

#### 2026-05（當月）

- [[src-reddit-til-2026-05]] — Reddit r/todayilearned 2026 年 5 月（含事實查核）
- [[src-reddit-eli5-2026-05]] — Reddit r/explainlikeimfive 2026 年 5 月
- [[src-hn-2026-05]] — Hacker News 2026 年 5 月
- [[src-github-trending-2026-05]] — GitHub Trending 2026 年 5 月
- [[src-producthunt-2026-05]] — Product Hunt 2026 年 5 月
- [[src-wikipedia-2026-05]] — Wikipedia Featured 2026 年 5 月
- [[src-skills-picks-2026-05]] — skills.sh Picks 2026 年 5 月（延續無新 pick 狀態，僅追蹤 ast-grep 安裝數）
- [[src-skills-trending-2026-05]] — skills.sh Trending Top 10 月報 2026 年 5 月（按 installs 降序，05-01 起新增追蹤）

#### 2026-04

- [[src-reddit-til-2026-04]] — Reddit r/todayilearned 2026 年 4 月（含事實查核）
- [[src-reddit-eli5-2026-04]] — Reddit r/explainlikeimfive 2026 年 4 月
- [[src-hn-2026-04]] — Hacker News 2026 年 4 月
- [[src-github-trending-2026-04]] — GitHub Trending 2026 年 4 月
- [[src-producthunt-2026-04]] — Product Hunt 2026 年 4 月
- [[src-wikipedia-2026-04]] — Wikipedia Featured 2026 年 4 月
- [[src-skills-picks-2026-04]] — skills.sh Picks 2026 年 4 月（月報索引）⚠️ 04-19 起 skills.sh 停發新 pick；表中 04-19~04-30 為 fetcher fallback 假象，已撤回相關推論

### Skill 解析

- [[src-skill-character-arc]] — character-arc：角色弧線診斷 skill，純 prompt engineering 的 diagnostic 範本（來源數：1）
- [[src-skill-3b1b-style-animation-skill]] — 3b1b-style-animation-skill：Manim 數學動畫 skill，將 3Blue1Brown 教學哲學整合成 agent 工作流（來源數：1）
- [[src-skill-ast-grep]] — ast-grep：AST 結構化代碼搜尋 skill，skills.sh **2026-04-18 唯一一次精選**，安裝數從 2,941（04-18）→ 4,073（04-30）→ 4,324（05-03）→ **4,703（05-06，5/4-5/6 V 字反彈推翻 W18 衰減假設**），擴散驅動為 GitHub Trending Skill 生態爆發 + Claude Code 文化普及 + find-skills 暴漲帶動發現（非 skills.sh 持續精選；⚠️ 原「連 N 日精選」說法為 fetcher fallback 假象，已撤回）（來源數：1）
- [[src-skill-guizang-ppt]] — guizang-ppt（歸藏）：雜誌風 horizontal swipe HTML PPT skill，「強約束派」設計（5 主題 / 10 layout 不可自訂）（來源數：1）
- [[src-bug-hunter]] — bug-hunter（codexstar69）：跨 7+ agent 平台的 adversarial multi-agent bug hunter + auto-fix skill；首個明確「multi-agent + adversarial」設計（來源數：1，僅 URL 標籤）

## 實體

### 人物

- [[Andrej Karpathy]] — 深度學習實作者與教育者，LLM Wiki 提出者（來源數：3）
- [[Tobi Lütke]] — Shopify CEO，QMD 提出者（來源數：1）
- [[Garry Tan]] — YC 總裁，GBrain 建立者（來源數：1）
- [[Marc LeBlanc]] — 遊戲設計師，MDA 框架共同創建者（來源數：1）
- [[3Blue1Brown]] — Grant Sanderson 的數學教育頻道，Manim 發明者（來源數：1）
- [[antirez]] — Salvatore Sanfilippo，Redis 原作者，2026-04-26 以 DeepSeek V4 llama.cpp 實驗進入本月追蹤（來源數：1）
- [[antfu]] — Anthony Fu，Vue/Vite 核心、UnoCSS 作者，「single-purpose、type-safe、微型 OSS」風格代表（來源數：0，LLM 跨來源歸納）
- [[levelsio]] — Pieter Levels，indie hacker 標誌人物，公開 revenue 與 12 startups 挑戰（來源數：0，LLM 跨來源歸納）

### 組織

- [[Anthropic]] — Claude 模型系列與 Claude Code 開發商（來源數：0，LLM 跨來源歸納）
- [[Apple]] — 2026-04-20 Tim Cook → John Ternus CEO 交接事件為本月追蹤焦點（來源數：2）
- [[Devv.AI]] — 3-4 人上海新創，AI 搜尋引擎 → Coding Agent → Multica 三階段演化（來源數：1）
- [[DeepSeek]] — 杭州幻方量化旗下 AI，2026-04-24 V4 發布為本月關鍵事件（HN/PH/GitHub Trending 三榜聯動）（來源數：0，LLM 跨來源歸納）
- [[Google]] — TPU + Gemini + Workspace Intelligence 三戰線，2026-04-22~24 連發企業 AI（來源數：0，LLM 跨來源歸納）
- [[月之暗面]] — Moonshot AI / Kimi 模型線，本月因 Attention Residuals 復現專案進入追蹤（來源數：1）
- [[OpenAI]] — GPT 系列、Codex 開發者工具、ChatGPT 消費級產品，2026-04-22 ChatGPT Images 2.0、04-24 GPT-5.5 + Codex 3.0（來源數：0，LLM 跨來源歸納）
- [[Inference.sh]] — AI 媒體 skill 主要發行者，5 件 skill 占 skills.sh trending Top 1-5；2026-05-03 GitHub repo 從 `infsh-skills` 改名 `inference-skills` 觸發單日 −7,000 安裝重置；**5/4 install 單日 +10.8k 完全恢復至 31.4k 確認是統計層級事件**（來源數：6） 
- [[拉瑞安工作室]] — Larian Studios，博德之門 3 開發商（來源數：1）

### 工具與平台

- [[Claude Code]] — Anthropic 官方 agent CLI，本 wiki 多處參照的核心實體（來源數：0，LLM 跨來源歸納）
- [[skills.sh]] — Agent Skill 策展平台（來源數：0，LLM 跨來源歸納）
- [[Multica]] — Vendor-neutral 的多 Agent 協作平台，Devv.AI 團隊開源（來源數：1）
- [[Qwen]] — Alibaba 開源 LLM 系列，2026-04 Qwen3.6-27B / Max-Preview 雙規格切入 coding agent 市場（來源數：0，LLM 跨來源歸納）
- [[defuddle]] — Obsidian 生態的網頁正文擷取工具，可作 markdown.new fallback（來源數：0，LLM 跨來源歸納）
- [[Godot]] — 免費開源遊戲引擎，AI 輔助開發首選（來源數：1）
- [[Manim]] — Python 數學動畫引擎，3Blue1Brown 開發並開源，ML/教育內容事實標準（來源數：1）
- [[Redis]] — antirez 建立的 in-memory data structure store，本月因 DeepSeek V4 llama.cpp 實驗被提及（來源數：1）
- [[Zed]] — 高效能 Rust native 開源程式編輯器，2026-05-01 發布 1.0；編輯器戰局與 Cursor/VS Code/JetBrains 競爭（來源數：1）

## 概念

### AI 與知識管理

- [[LLM Wiki]] — 以 LLM 維護持久 wiki 的知識管理模式（來源數：3）
- [[QMD]] — 本地優先的混合搜尋引擎（來源數：1）
- [[GBrain]] — 企業級個人知識管理系統（來源數：1）
- [[Skill vs Bash vs MCP]] — LLM Agent 三種工具模式的比較與選擇方法論（來源數：2）
- [[AI 輔助軟體工程]] — 結構化 AI 開發方法論：規劃文件、人機分工、雙重 review（來源數：5）
- [[Restatement]] — LLM 長任務中週期性重申關鍵資訊的控制機制（來源數：1）
- [[AI 品質共謀]] — AI 同時寫 code 與測試時形成的隱形同源誤解，CI 綠燈下的幻覺式品質（來源數：1）
- [[Specification by Example]] — SBE 需求工程方法論，「從例子建立規格、規格即測試、測試即活文件」——AI 品質共謀的核心解方（來源數：0，LLM 跨來源歸納）
- [[Scope Creep 守恆律]] — AI 降低實作成本後，省下的時間被更多想法、抽象化與 structural diff 吃掉的反模式（來源數：1）
- [[PluginEval]] — Claude Code skill 品質評估框架（三層評估 × 10 維度 × 統計 CI）；wshobson/agents 內建，**第一個科學化 skill 評估系統**（來源數：1）

### 商業與顧客管理

- [[顧客終身價值]] — CLV 與 CAC 的核心概念，客戶分級與留存優先策略（來源數：1）
- [[OSS Investment Scorecard]] — 匿名 VC 作者的 OSS 投研框架 v1.3.1，含 Star 健康度、Commit 集中度、匿名團隊追溯 SOP（來源數：1）

### 遊戲設計與開發

- [[MDA 框架]] — Mechanics-Dynamics-Aesthetics，遊戲設計的系統性分析語言（來源數：1）
- [[遊戲開發流程]] — 立項→前期製作→正式開發→測試→製作後期（來源數：1）
- [[垂直切片]] — 前期製作中接近最終品質的完整關卡驗證手段（來源數：1）
- [[遊戲發想]] — 心智圖四問法，從靈感到具體開發方向（來源數：1）
- [[AI 輔助遊戲開發]] — 用 AI 寫程式碼與生成美術的遊戲開發方法論（來源數：1）

### 程式語言與工具

- [[AST]] — 抽象語法樹：源碼的樹狀語義表徵，支撐 linter/compiler/refactor/結構化搜尋的理論基礎（來源數：0，LLM 知識）

## 綜整與分析

- [[三大知識管理系統比較]] — LLM Wiki vs QMD vs GBrain 並排比較（來源數：1）
- [[綜整-AI協作工程的六大趨勢]] — 六大結構性趨勢 + 五個應強化方向，綜合 13 個來源（來源數：13）

### 月綜整

- [[月綜整-2026-04]] — 知識庫首月，從 0 建到 87 頁；AI 廠商三方陣營資金重組 + Apple CEO 交接 + LLM Wiki 概念主流化擴散弧 + ⚠️ skills.sh fallback 假象校正（來源：跨頁整理）

### 週綜整（每週橫向 + 縱向，完整週過完才做）

- [[週綜整-2026-W18]] — 驗證與校正週（04-27 ~ 05-03），主動撤回 W17 累積 12 日 fetcher fallback 假象 + Anthropic Creative Work 8 connector + Inference.sh 改名事件 + GitHub Trending 信號崩壞 + agent VM 浪潮 + Zed 1.0（來源：跨頁整理）
- [[週綜整-2026-W17]] — 成熟營運週（04-20 ~ 04-26），18 個新實體/概念建立，外部 AI 模型密集發布日 + Anthropic 雙金主 + LLM Wiki 上 HN 主流（來源：跨頁整理）
- [[週綜整-2026-W16]] — 知識庫起點週（04-13 init → 04-19 規模達 52 頁），AI 協作工程方法論成形（來源：跨頁整理）
