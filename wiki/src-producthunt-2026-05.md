---
title: Product Hunt 月報 — 2026-05
type: source
sources: [producthunt-2026-05-08.md, producthunt-2026-05-07.md, producthunt-2026-05-06.md, producthunt-2026-05-05.md, producthunt-2026-05-04.md, producthunt-2026-05-03.md, producthunt-2026-05-02.md, producthunt-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-09
tags: [producthunt, monthly-digest]
---

# Product Hunt — 2026 年 5 月

> 每日自動收集 Product Hunt 當日新產品，由 LLM 翻譯彙整。依日期新到舊排列。

## 2026-05-08 — YC Application 季 + Agent 工具鏈細分（11/15 帶 YC Application 標籤）

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | RankSpot | 由深度競品分析驅動的 AI SEO Blog | 342 | Marketing / SEO / YC Application | [PH](https://www.producthunt.com/products/rankspot) |
| 2 | **Monid 2.0** | OpenRouter for agent tools——agent 工具的 OpenRouter | 292 | Dev Tools / AI / YC Application | [PH](https://www.producthunt.com/products/monid) |
| 3 | **Minions** | Open source mission control for Hermes agent——Hermes agent 的開源任務中心 | 218 | Open Source / GitHub / YC Application | [PH](https://www.producthunt.com/products/minions) |
| 4 | **Kuku: open source** | Your open-source, local second brain for every AI | 153 | Text Editors / SaaS / YC Application | [PH](https://www.producthunt.com/products/kuku) |
| 5 | GitHired | 用 proof of work 找 100x 工程師而非 resume keyword | 143 | Hiring / GitHub / YC Application | [PH](https://www.producthunt.com/products/githired-2) |
| 6 | Flare | AI-native voice-first social app for GenZ | 135 | Social Media / AI / YC Application | [PH](https://www.producthunt.com/products/flare-9) |
| 7 | Fluent Frame | 像出貨功能一樣快地出貨精緻產品影片 | 126 | Social Media / Marketing / YC Application | [PH](https://www.producthunt.com/products/fluent-frame) |
| 8 | Ara | Agentic Wispr flow computer-use-agent living in your notch（Mac 瀏海中的 agent） | 108 | Open Source / Dev Tools / Computers | [PH](https://www.producthunt.com/products/dereference-the-100x-ide) |
| 9 | **APIEval-20** | An open benchmark for AI agents that test APIs——AI agent 測 API 的開放 benchmark | 105 | API / Dev Tools / AI | [PH](https://www.producthunt.com/products/kushoai) |
| 10 | Google Health | A new relationship with your health | 99 | Android / Health / AI | [PH](https://www.producthunt.com/products/google) |
| 11 | Contral | The agent which teaches while you build | 97 | Education / Dev Tools / YC Application | [PH](https://www.producthunt.com/products/contral) |
| 12 | Sutra | Decision Intelligence for hardware teams | 91 | Hardware / Change Management / YC Application | [PH](https://www.producthunt.com/products/sutra-4) |
| 13 | Donely Knowledge Layer | Queryable company knowledge base + Closed-loop AI employees | 91 | YC Application | [PH](https://www.producthunt.com/products/donely) |
| 14 | **Fabraix** | Find gaps in your AI agents before users do——在使用者前找到 AI agent 的漏洞 | 91 | Dev Tools / AI / YC Application | [PH](https://www.producthunt.com/products/nyx-4) |
| 15 | SuperIsland | Dynamic Island for macOS with Extensions | 88 | Productivity / Music / YC Application | [PH](https://www.producthunt.com/products/superisland) |

> **05-08 觀察**：
>
> ### YC Application 季全面啟動
>
> - **15 件中 11 件帶 YC Application 標籤**——YC W26 申請季開始（4-6 月通常為 W 批次申請密集期）；上榜為 YC 申請者「公開亮相 + 收集流量證據」傳統管道。對比 5/6 PH 全 0 件 YC Application 標籤——一日內結構性轉變
>
> ### Agent 工具鏈細分大爆發（4 件直接相關）
>
> - **#2 Monid 2.0「OpenRouter for agent tools」（292 分）**——元層次工具：給 agent 用的「工具路由器」；類比 LLM router 但對應 tools。**生態演化訊號**：tool 已多到需要路由
> - **#3 Minions「mission control for Hermes agent」（218 分）**——Hermes 是 OpenAI 的 agent 平台；Minions 是其開源管理面板。對應 [[綜整-AI協作工程的六大趨勢]] 的「agent 控制台」軌道
> - **#9 APIEval-20「open benchmark for agents that test APIs」**——對應 [[PluginEval]] 的「agent 評估」框架競爭者；**開放 benchmark** 的方向呼應 4 月 [[src-wshobson-agents]] 的 PluginEval 統計級評估
> - **#14 Fabraix「Find gaps in your AI agents before users do」**——⭐ **直接呼應 [[AI 品質共謀]]**：AI agent 自己會漏掉的場景，需要外部工具找出；**正是「不同 agent 角色＝不同視角」對抗性設計的商業化**——同 [[src-bug-hunter]] 的 multi-agent adversarial 思路
>
> ### 知識管理工具持續演化
>
> - **#4 Kuku「open-source local second brain」（153 分）**——⭐ 直接呼應 [[LLM Wiki]] 概念；「local second brain for every AI」是「每個 AI 都需要自己記憶層」的 indie 解法。對比 5/6 PH #1 Kanwas（團隊大腦）——個人 vs 團隊雙軌
> - **#13 Donely Knowledge Layer「Queryable company knowledge base + Closed-loop AI employees」**——把知識管理 + agent 結合成「閉環 AI 員工」；對應 [[Cloudflare]] 5/8 HN #7 裁員 20% + 5/6 HN #5 「agents 自主買域名 + 部署」的轉型訊號——**人類員工 → AI 員工** 過渡敘事商業化
>
> ### 影像/影片創意工具
>
> - **#7 Fluent Frame「ship product videos as fast as you ship features」**——對應 [[src-claude-for-creative-work]] / [[src-blender-ai-video-workflow]] 的 AI 影片生態
> - **#11 Contral「agent teaches while you build」**——教學型 coding agent，對應教育 + agent 軌道

## 2026-05-07 — Anthropic 推 Finance Agents + GPT-5.5 Instant + agent socialnet

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **FlowMarket** | A social network of AI agents generating B2B deals——AI agents 互相生成 B2B 交易的社交網路 | 306 | Sales / Marketing / AI | [PH](https://www.producthunt.com/products/flowmarket-2) |
| 2 | **[[Claude Code|Claude Agents for Financial Services]]** | Finance agent templates for pitches, KYC, and closing books——金融服務的 agent 模板 | 173 | Fintech / Investing / AI | [PH](https://www.producthunt.com/products/claude-code) |
| 3 | **GPT‑5.5 Instant** | Smarter, more personal answers as ChatGPT's new default | 151 | Productivity / AI / Bots | [PH](https://www.producthunt.com/products/openai) |
| 4 | **MESA** | Describe your Shopify workflow. MESA builds it. | 134 | AI / E-Commerce / No-Code | [PH](https://www.producthunt.com/products/mesa) |
| 5 | Lingo.dev v1 | Localization engineering platform for consistent translation | 132 | API / Dev Tools / AI | [PH](https://www.producthunt.com/products/lingodotdev) |
| 6 | ExploreYC | Your data layer for Y Combinator's startup ecosystem | 113 | Dev Tools / AI / Data | [PH](https://www.producthunt.com/products/yc-company-explorer) |
| 7 | reMarkable Paper Pure | The reMarkable 2 successor goes back to basics | 101 | Productivity / Hardware | [PH](https://www.producthunt.com/products/remarkable-paper-pro) |
| 8 | ProductClank | Borrow Distribution, Not Capital | 100 | Marketing / Growth / Pitch Tel Aviv | [PH](https://www.producthunt.com/products/productclank) |
| 9 | Google Pomelli Catalog | Turn a product catalog into branded campaign assets | 100 | Design / Photography / E-Commerce | [PH](https://www.producthunt.com/products/google) |
| 10 | Lovie Formation - Incorporation MCP | Incorporate your next company easily. | 94 | SaaS / Dev Tools / AI | [PH](https://www.producthunt.com/products/lovie-the-ai-native-formation-mcp) |
| 11 | Propello | Create the pipeline you never had | 94 | Marketing / Growth / Pitch Tel Aviv | [PH](https://www.producthunt.com/products/propello) |
| 12 | Gyro Autopilot - Easy Flight Refunds | 100s of Dollars Could Be Sitting in Your Inbox 📥 | 85 | Travel / AI / Pitch Tel Aviv | [PH](https://www.producthunt.com/products/gyro-autopilot) |
| 13 | Genrate.ai | The military-grade recon machine for revenue teams. | 84 | Sales / BI / Pitch Tel Aviv | [PH](https://www.producthunt.com/products/genrate-ai) |
| 14 | Seemore Data | 40% autonomous cost reduction on Snowflake environments | 80 | Analytics / AI / Pitch Tel Aviv | [PH](https://www.producthunt.com/products/seemore-data) |
| 15 | Memory Tags | Scan text to make flashcards and improve your memory | 79 | iOS / Productivity / Education | [PH](https://www.producthunt.com/products/memory-tags) |

> **05-07 觀察**：
>
> ### Anthropic 進攻金融服務 + OpenAI 模型升級同日
>
> - **#2 Claude Agents for Financial Services（173 分）**——⭐ 重大事件：[[Anthropic]] 推垂直行業（finance）agent 模板；KYC、pitches、closing books——**Anthropic 從通用 model → 行業 agent 解決方案**戰略轉型。PH 頁面為 `/products/claude-code` 顯示是 Claude Code 平台延伸
> - **#3 GPT-5.5 Instant（151 分）**——[[OpenAI]] ChatGPT 新預設模型；「Smarter, more personal」訴求；對應 4 月 GPT-5.5 + Codex 3.0 連發節奏。**Anthropic vs OpenAI 同日對打** PH 第 2-3 名
> - **#5 Lingo.dev v1**——本地化平台，對應 [[Anthropic]] 的多語言模型擴張
>
> ### Agent socialnet 新概念
>
> - **#1 FlowMarket（306 分當日最高）**——「AI agents 之間生成 B2B deals 的社交網路」——**agent-to-agent 商業交易層**新概念；對應 5/6 HN #5 Cloudflare agents 自主買域名 + 5/8 PH #2 Monid 2.0「OpenRouter for agent tools」軌道；**「agent 經濟」基礎設施成形**
>
> ### Workflow agent 細分
>
> - **#4 MESA**「描述 Shopify 工作流，MESA 建造」——垂直平台（Shopify）+ no-code workflow + agent；對應 5/4 PH MESA 軌跡（同一產品再次上榜？或更新版？）
> - **#10 Lovie Formation Incorporation MCP**——成立公司 = MCP 操作；公司註冊 agent 化
> - **#14 Seemore Data 40% 自主減 Snowflake 成本**——對應 5/6 PH #9 WOZCODE「Claude Code 成本減 50%」+ 5/4 PH agent ROI 軌；**autonomous cost optimization** 細分
>
> ### YC 生態工具
>
> - **#6 ExploreYC**——「YC 生態的資料層」；對應 [[OSS Investment Scorecard]] 投研工具趨勢
> - **多件 Pitch Tel Aviv 標籤**（#8/#11/#12/#13/#14 共 5 件）——以色列創業推介會專場
>
> ### 硬體小品
>
> - **#7 reMarkable Paper Pure 101 分**——電子紙「回歸基礎」；硬體文創（不加 AI）
>
> ### 跨來源連動
>
> - 與 5/7 HN #2 AlphaEvolve（DeepMind）+ #13 Agent-harness-kit 形成「**5/7 三大平台 agent 工具同日爆發日**」

## 2026-05-06

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Kanwas** | 你團隊的開源大腦 | 307 | Productivity / AI | [PH](https://www.producthunt.com/products/kanwas) |
| 2 | **Shadow 2.0** | 會議結束前完成會議產生的工作 | 285 | Productivity / Meetings / YC | [PH](https://www.producthunt.com/products/shadow-6) |
| 3 | **Superset 2.0** | 從任何地方在任何機器上運行 100s coding agents | 262 | Text Editors / Dev Tools / AI | [PH](https://www.producthunt.com/products/superset-5) |
| 4 | **pay.sh** | 自主探索、訪問、付費任何 API | 214 | API / Open Source / Dev Tools | [PH](https://www.producthunt.com/products/solanafndn) |
| 5 | Custom Integrations by Databox | 不寫程式把缺失的資料接進 Databox | 186 | Analytics / SaaS / Dev Tools | [PH](https://www.producthunt.com/products/databox) |
| 6 | Gyro Autopilot | 收件匣裡可能有幾百美金 | 164 | Travel / AI / Personal Finance | [PH](https://www.producthunt.com/products/gyro-autopilot) |
| 7 | Alumni Founder | 為任何公司繪製創辦人網絡圖 | 152 | VC / SaaS / Tech | [PH](https://www.producthunt.com/products/alumni-founder) |
| 8 | **Ads in ChatGPT** | 創建、管理、評估你的 ChatGPT 廣告 | 129 | Marketing / Advertising / AI | [PH](https://www.producthunt.com/products/chatgpt) |
| 9 | **WOZCODE** | 把 Claude Code 成本降低 50% | 126 | Productivity / Dev Tools / AI | [PH](https://www.producthunt.com/products/wozcode) |
| 10 | Magic | 把你的內容融入真實世界場景 | 122 | Marketing / AI / Video | [PH](https://www.producthunt.com/products/magic-13) |
| 11 | Realtime TTS-2 | 像聲音一樣好的 voice AI | 121 | API / Dev Tools / AI | [PH](https://www.producthunt.com/products/inworld-ai) |
| 12 | Contrario | 由專家招募者驅動的 AI 招聘平台 | 113 | Hiring / AI / Tech | [PH](https://www.producthunt.com/products/contrario) |
| 13 | DevAlly | 為快速出貨團隊的 AI 無障礙合規 | 113 | Productivity / Software Eng / Dev Tools | [PH](https://www.producthunt.com/products/devally) |
| 14 | damnlines.com | 沒人喜歡排隊 | 111 | Hardware / Sensors / Cameras | [PH](https://www.producthunt.com/products/damnlines-com) |
| 15 | Magic Studio by Once UI | 把 Once UI 變成價值 1 萬美金的代理機構 | 97 | Productivity / Freelance / Dev Tools | [PH](https://www.producthunt.com/products/magic-studio-by-once-ui) |

> **05-06 觀察**：
>
> ### Agent 自主經濟與成本敏感
> - **#3 Superset 2.0「100s of coding agents 任何機器」+ #4 pay.sh「自主 API 付費」+ #8 Ads in ChatGPT + #9 WOZCODE「減 Claude Code 成本 50%」**——四件 agent 經濟主題同日上榜
> - **意義**：agent 已從「能不能做」進到「成本與規模」優化階段
> - **#9 WOZCODE 解讀**：CC 成本減半的工具竟在 PH 一日上榜——印證 [[src-codeburn]] 的「token 觀測」需求成熟，從追蹤進到主動優化
> - **#4 pay.sh + 5/6 HN #5 Cloudflare agents 自主買域名**——「**autonomous payment**」成獨立軌道，agent 不再依賴人類設信用卡
>
> ### 會議產出 vs 個人腦袋
> - **#1 Kanwas「團隊開源大腦」**+ **#2 Shadow 2.0「會議結束前完成會議產出的工作」**——團隊知識管理 + 會議自動化雙件 Top 2；對應 [[LLM Wiki]] / [[綜整-AI協作工程的六大趨勢]] 的 AI 知識協作主題
>
> ### 商業基礎建設
> - **#7 Alumni Founder**——「找出某公司歷代創辦人」工具；VC 盡調工具持續細分
> - **#5 Databox 自訂整合**——資料源整合 no-code 化
> - **#10 Magic「內容融入真實場景」**——AR/AI 影像合成；對應 [[src-blender-ai-video-workflow]] 的 AI 媒體生成生態

## 2026-05-05

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Kilo Code v7 for VS Code** | parallel agents、diff reviewer、multi-model 比較 | 347 | Open Source / Software Eng / Dev Tools | [PH](https://www.producthunt.com/products/kilocode) |
| 2 | Velo 2.0 | 即時把語音與螢幕變成可分享影片 | 288 | Productivity / Sales / Video | [PH](https://www.producthunt.com/products/velo-4) |
| 3 | **Flowstep 1.0** | AI 設計工程師：把想法變成可編輯 UI | 206 | Dev Tools / AI / Vibe coding | [PH](https://www.producthunt.com/products/flowstep) |
| 4 | **Waydev Agent** | 證明 AI 開支 ROI 是否真的回本 | 179 | Pitch NYC | [PH](https://www.producthunt.com/products/waydev) |
| 5 | Ghostwriter | 在 LinkedIn 與 X 寫並發文 | 132 | Productivity / Writing / Social | [PH](https://www.producthunt.com/products/ghostwriter-5) |
| 6 | Oriane | 行銷者與其 AI 的感知層 | 110 | Influencer / Social marketing / Pitch NYC | [PH](https://www.producthunt.com/products/oriane) |
| 7 | **Intuned Agent** | AI 自建並維護的 production browser automation | 104 | Productivity / Dev Tools / AI | [PH](https://www.producthunt.com/products/intuned) |
| 8 | PaceBar | 給 Mac 的安靜步調儀表 | 100 | Mac / Productivity / Menu Bar | [PH](https://www.producthunt.com/products/pacebar) |
| 9 | Hestus | Native CAD autocomplete——快 2.5 倍、少 4 倍點擊 | 90 | Design Tools / 3D Print / Pitch NYC | [PH](https://www.producthunt.com/products/hestus) |
| 10 | Firstwork | 為前線招聘與 onboarding 的 agentic AI | 89 | Hiring / HR / Pitch NYC | [PH](https://www.producthunt.com/products/firstwork-2) |
| 11 | Unity AI | AI agents 直接內建到 Unity workflows | 87 | AI / Games / Development | [PH](https://www.producthunt.com/products/unity) |
| 12 | Dina | 從螢幕到精緻影片只需數分鐘 | 86 | Productivity / Marketing / Video | [PH](https://www.producthunt.com/products/dina) |
| 13 | Steam Controller | Steam Input，現在以控制器形式 | 79 | Home / Hardware / Games | [PH](https://www.producthunt.com/products/steam-machine) |
| 14 | AWEAR | 即時心智洞察的隱密腦波穿戴 | 78 | Wearables / Biohacking / Pitch NYC | [PH](https://www.producthunt.com/products/awear) |
| 15 | **Kodezi** | codebases 的 AI CTO | 74 | Pitch NYC | [PH](https://www.producthunt.com/products/kodezi) |

> **05-05 觀察**：
>
> ### Coding agent 平台戰
> - **#1 Kilo Code v7「parallel agents + diff reviewer + multi-model」**——VS Code 平台的 agent IDE，與 [[Zed]] / Cursor / Codex 戰局多一個玩家。**「parallel agents」+「multi-model 比較」**是核心差異化
> - **#3 Flowstep 1.0「AI 設計工程師」**——標 vibe coding 分類，「想法→可編輯 UI」是 design-to-code 軌道
> - **#7 Intuned Agent「production browser automation」**——agent 維護爬蟲，與 5/6 trending #7 just-scrape 共軌
> - **#11 Unity AI**——agent 直接內建遊戲引擎；對應 [[src-AI輔助工作流程]] 的工具鏈整合趨勢
> - **#15 Kodezi「codebase 的 AI CTO」**——agent 角色化（不只是工具，是組織職位）
>
> ### Agent ROI 成主題
> - **#4 Waydev Agent「證明 AI 開支 ROI」179 分（Pitch NYC）**——企業導入 AI 後第一個系統性問題：「真的回本了嗎？」對應 [[src-codeburn]] 的成本觀測 + 5/6 #9 WOZCODE 的成本優化形成完整堆疊
> - **#10 Firstwork「frontline hiring agentic AI」**——藍領職位招募/onboarding agent；agent 滲透到非白領
> - **#6 Oriane「行銷與其 AI 的感知層」**——「感知層（perception layer）」是新行銷概念
>
> ### Pitch NYC 群聚
> - 多件來自 Pitch NYC 活動（#4 Waydev、#9 Hestus、#10 Firstwork、#14 AWEAR、#15 Kodezi）——5/5 是 NYC PH 路演日

## 2026-05-04

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Mindra** | 你真的可以委派的 Agent Teams | 199 | Productivity / Marketing / AI | [PH](https://www.producthunt.com/products/mindra) |
| 2 | **Codex Pets** | 你的 Codex workflow 動畫夥伴 | 165 | Pets / AI | [PH](https://www.producthunt.com/products/openai) |
| 3 | Aaavatar | 一鍵品牌團隊大頭照 | 163 | Design Tools / Productivity / AI | [PH](https://www.producthunt.com/products/aaavatar) |
| 4 | Flowly | 你的 macOS 原生個人 AI 助理 | 145 | Android / Productivity / AI | [PH](https://www.producthunt.com/products/flowly-6) |
| 5 | **Claude Code & Codex Usage Trading Cards by Rudel** | 根據你的 CC & Codex 使用資料生成交易卡 | 130 | Open Source / Dev Tools / AI | [PH](https://www.producthunt.com/products/rudel) |
| 6 | Dropy | 追蹤 Amazon、eBay、AliExpress 等商店價格 | 124 | Chrome Extensions / Shopping | [PH](https://www.producthunt.com/products/dropy-price-tracker-price-history) |
| 7 | Visitor profiles and timeline by Croct | 揭露每次點擊背後的故事優化網站 | 122 | UX / A/B Testing / Data Viz | [PH](https://www.producthunt.com/products/croct) |
| 8 | Regulus by Cumbuca | 巴西央行法規訓練的 AI chatbot | 102 | Fintech / Legal / AI | [PH](https://www.producthunt.com/products/cumbuca) |
| 9 | Sleek Analytics for iOS | 你口袋裡的網站分析 | 98 | Analytics / Marketing / Privacy | [PH](https://www.producthunt.com/products/sleek-analytics) |
| 10 | Panels Store | 買 DRM-free 漫畫並立即在 Panels 閱讀 | 98 | iOS / Comics | [PH](https://www.producthunt.com/products/panels-store) |
| 11 | Manex | 把有用的答案、修正、上下文保留為記憶 | 97 | Productivity / SaaS / AI | [PH](https://www.producthunt.com/products/manex) |
| 12 | Replyke V7 | 為使用者驅動產品的預建 infra 與 client SDK | 96 | API / Dev Tools / SDK | [PH](https://www.producthunt.com/products/replyke) |
| 13 | **Mobilewright** | iOS 與 Android 的 Playwright，免費開源 | 31 | Open Source / Dev Tools / AI | [PH](https://www.producthunt.com/products/mobilewright) |
| 14 | DANCING CATS App | 把貓照片變成跳舞影片 | 28 | Pets / Photography / AI | [PH](https://www.producthunt.com/products/dancing-cats-app) |
| 15 | Doomscroll Calculator (by Habit Doom) | 你的手機會偷走多少年 | 20 | Productivity / Time Tracking / Health | [PH](https://www.producthunt.com/products/doomscroll-calculator) |

> **05-04 觀察**：
>
> ### Agent 角色化／工作流動畫化
> - **#1 Mindra「真的可以委派的 Agent Teams」199 分**——延續 W18 PH agent SaaS 趨勢；「委派」核心訴求
> - **#2 Codex Pets 165 分**——延續 5/2 GH trending petdex/codex-pets-react；OpenAI Codex 開發者文化「給 agent 一個寵物」進入 PH 主流；對應 [[src-oh-my-codex]]
> - **#5 CC & Codex Trading Cards 130 分**——使用者使用 CC/Codex 統計可視化為「交易卡」；遊戲化成癮機制應用於 dev tools；對應 [[src-codeburn]] token 觀測 + 5/5 PH #4 Waydev Agent ROI 證明
> - **#4 Flowly「macOS native AI 助理」**——對抗網頁版 ChatGPT/Claude 的桌面原生 LLM 應用
> - **#11 Manex「保留有用回答 + 修正 + 上下文成為 memory」**——agent 長期記憶工具；對應 [[LLM Wiki]] 的個人知識庫主題
>
> ### 開源測試 / 跨平台
> - **#13 Mobilewright「iOS Android 的 Playwright」**——browser automation 範式擴展到 native mobile，開源；對應 5/5 PH #7 Intuned Agent + 5/6 trending #7 just-scrape 的「agent 自主執行外部任務」浪潮
> - **#3 Aaavatar「一鍵品牌團隊大頭照」**——AI 生成 + 統一品牌；對應 [[src-claude-for-creative-work]] 創意 connector
>
> ### 區域性 / 細分市場
> - **#8 Regulus by Cumbuca「巴西央行法規 chatbot」**——區域 vertical AI；對應 [[Anthropic]] 5/5 finance agents 戰略

## 2026-05-03

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Radar** | 缺失的開源 Kubernetes UI | 220 | Open Source / Dev Tools / AI | [PH](https://www.producthunt.com/products/radar-7) |
| 2 | **Huddle01 VMs** | 為你的 agents 提供虛擬機 | 208 | Dev Tools / AI / Development | [PH](https://www.producthunt.com/products/huddle01-cloud-2) |
| 3 | Mockin 2.0 | UX/UI 與產品設計師的職涯工具包 | 186 | Hiring / Education / Career | [PH](https://www.producthunt.com/products/mockin-for-product-designers) |
| 4 | **PandaProbe** | 開源 agent engineering 平台 | 168 | Open Source / Dev Tools / AI | [PH](https://www.producthunt.com/products/pandaprobe) |
| 5 | **Rosentic** | 在 merge 前抓住 coding agents 互相破壞 | 127 | Open Source / Dev Tools / AI | [PH](https://www.producthunt.com/products/rosentic) |
| 6 | Aximote In-Car App | 你車的「健身追蹤器」 | 105 | Android / Cars / EV | [PH](https://www.producthunt.com/products/aximote-in-car-app) |
| 7 | IsraelVC | 史上最乾淨的以色列 VC 地圖 | 27 | Investing / VC / Database | [PH](https://www.producthunt.com/products/israelvc) |
| 8 | Vfoli | 發布你的 venture portfolio | 16 | Productivity / VC / AI | [PH](https://www.producthunt.com/products/vfoli) |
| 9 | TinyLottie | 高效能 SaaS 用的 Lottie 智慧優化 | 14 | Design Tools / SaaS / Dev Tools | [PH](https://www.producthunt.com/products/tinylottie) |
| 10 | Deskboard | 把 PC 資料夾變視覺化 boards | 10 | Productivity / Notes / Wallpaper | [PH](https://www.producthunt.com/products/deskboard) |
| 11 | Loova Agents | 你的 AI 導演，輕鬆做電影感影片 | 9 | Marketing / AI / Video | [PH](https://www.producthunt.com/products/loova-agents) |
| 12 | **Iconstack: MCP-Native Icon Search** | 語意搜尋 + MCP + API，5 萬 icons，永遠免費 | 8 | Icons / Development / Design | [PH](https://www.producthunt.com/products/iconstack-mcp-native-icon-search) |
| 13 | PostGun | 在每個社群網路上 build/remix/post | 8 | Productivity / Social Media / AI | [PH](https://www.producthunt.com/products/postgun) |
| 14 | Uncluttr | tab bar 不該裝 80+ tabs，讓 AI 整理 | 8 | Productivity / UX / AI | [PH](https://www.producthunt.com/products/uncluttr-clean-up-your-tabs) |
| 15 | Posting Machine AI | 把 LinkedIn 變 B2B 創業者的銷售管道 | 8 | Sales / Marketing / LinkedIn | [PH](https://www.producthunt.com/products/posting-machine) |

> **05-03 觀察**：
>
> ### Agent 工具基礎設施成熟
>
> - **#2 Huddle01 VMs** + **#4 PandaProbe** + **#5 Rosentic** 三件 agent 基礎設施同日上榜（合共 503 票）：
>   - **VM for agents**——延續 [[src-producthunt-2026-05]] 5/2 #2 Manus Cloud Computer 主題（agent 需要專屬計算資源）
>   - **Agent engineering 平台**——agent 開發者工具開始模組化
>   - **Catch when coding agents break each other**——多 agent 系統中的「agent vs agent」沖突偵測；對應 [[src-AI-Agent避坑指南]] 中的 context 隔離主題
>   - 與 [[src-multica-devv-ai盡調|Multica]] 競爭同一市場
> - **#1 Radar Kubernetes UI**（220 票）——OSS k8s UI 工具仍有缺口
> - **#12 Iconstack MCP-native**——MCP server 進入創意資源市場
>
> ### 跨來源連動（agent 主題）
>
> - 三日累積 PH 上的 agent 工具：5/1 Postiz/Buda、5/2 Manus Cloud/explainx、5/3 Huddle01 VMs/PandaProbe/Rosentic——**「面向 agent 的 SaaS 基礎設施」連發週**
> - **5/3 信號 vs [[src-github-trending-2026-05]] 5/3**——PH 高品質 agent 產品 vs GitHub Trending 的詐騙/外掛崩壞——同一日，**兩個社群信號品質落差極大**

## 2026-05-02

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Scholé** | 把日常工作變成個人化 AI 學習 | 156 | AI / Online Learning | [PH](https://www.producthunt.com/products/schole-2) |
| 2 | **Cloud Computer by Manus** | 為 bots 與 software 設計的雲端機器 | 150 | Productivity / Dev Tools / AI | [PH](https://www.producthunt.com/products/manus) |
| 3 | Feather | 內建 local AI 的相片編輯器 | 124 | UX / Photography / AI | [PH](https://www.producthunt.com/products/feather-18) |
| 4 | **Microsoft Copilot Health** | 整合個人健康資料的 dedicated space | 109 | Health & Fitness / Analytics / AI | [PH](https://www.producthunt.com/products/copilot-health) |
| 5 | YouTube TV Custom Multiview | 同時混合最多 4 個直播 | 98 | Video Streaming / Sports / TV | [PH](https://www.producthunt.com/products/google) |
| 6 | Ara | 透過簡訊建立整個生意 | 95 | Messaging / Payments / SaaS | [PH](https://www.producthunt.com/products/dereference-the-100x-ide) |
| 7 | Filect | AI 整理檔案 | 91 | Mac / Productivity / AI | [PH](https://www.producthunt.com/products/filect) |
| 8 | Breaks | menu bar 中的安靜 Pomodoro | 86 | Productivity / Open Source / GitHub | [PH](https://www.producthunt.com/products/breaks) |
| 9 | **explainx ai** | 探索與貨幣化 AI skills, agents, tools, MCP servers | 40 | AI / Tech news | [PH](https://www.producthunt.com/products/explainx) |
| 10 | BookstoRead.ai | 用 AI 找你的書籍配對 | 40 | AI / Books | [PH](https://www.producthunt.com/products/bookstoread-ai) |
| 11 | Sakyura | 看 AI 在你的類別中推薦誰 | 12 | Analytics / SEO / AI | [PH](https://www.producthunt.com/products/sakyura) |
| 12 | AI Workflow Generator | 從一個輸入產生完整 AI workflow | 11 | Productivity / SEO / AI | [PH](https://www.producthunt.com/products/ai-workflow-templates) |
| 13 | **Spredly** | 直接和你的試算表對話，用 local LLM 或 Claude | 10 | Productivity / Spreadsheets / AI | [PH](https://www.producthunt.com/products/spredly) |
| 14 | **fossel** | 給 AI context repo 的 local MCP memory server | 9 | Open Source / Dev Tools / GitHub | [PH](https://www.producthunt.com/products/fossel) |
| 15 | LazySEO | 從關鍵字到排名內容只要幾分鐘 | 9 | Writing / Marketing / SEO | [PH](https://www.producthunt.com/products/lazyseo) |

> **05-02 觀察**：
>
> ### Agent 計算資源（VM/Cloud）獨立成分類
>
> - **#2 Manus Cloud Computer**——「dedicated cloud machine for bots/software」明確把 agent 視為使用者；與 5/3 #2 Huddle01 VMs 形成「agent VM」雙產品市場驗證
> - **#9 explainx ai**——「discover & monetize AI skills, agents, tools, MCP servers」延伸 [[skills.sh]] 模式；MCP server 商業化趨勢
>
> ### 企業 AI 持續推
>
> - **#1 Scholé**——AI 個人化學習；HR/L&D 市場
> - **#4 Microsoft Copilot Health**——[[Anthropic]] vs [[OpenAI]] vs Microsoft Copilot 三大 AI 助理進入「個人資料整合」階段
> - **#13 Spredly + #14 fossel**——LLM/MCP 在 spreadsheet 與 agent 持久 context 兩個領域的應用例
>
> ### 跨來源連動
>
> - **#13 Spredly「talk to spreadsheets, use Claude」**——對應 [[Anthropic]] / [[Claude Code]] 在生產力工具的滲透
> - **#14 fossel「local MCP memory server for persistent AI context」**——MCP server 進入「給 AI 持久記憶」這個 wiki 重點主題（與本 wiki 自身的 LLM Wiki 概念呼應）

## 2026-05-01

| # | 產品 | 一句話 | 票數 | 分類 | 連結 |
|---|------|-------|------|------|------|
| 1 | **Postiz** | Agentic 社群媒體排程器（與 OpenClaw 等 agent 整合） | 236 | Social Media / Marketing | [PH](https://www.producthunt.com/products/postiz) |
| 2 | **Zed 1.0** | 高效能、開源、多人協作程式編輯器 | 166 | Open Source / Text Editors | [PH](https://www.producthunt.com/products/zed) |
| 3 | Marx Finance | AI agents 辯論市場 | 139 | API / AI / Finance | [PH](https://www.producthunt.com/products/marx-finance) |
| 4 | Buda | 招募 agents 像同步團隊一樣經營公司 | 115 | Productivity / AI | [PH](https://www.producthunt.com/products/buda-2) |
| 5 | Bitgrain | 比 Figma 輕、比 Canva 靈活的設計工作室 | 99 | Design Tools / Art | [PH](https://www.producthunt.com/products/bitgrain) |
| 6 | Genspark for Word | 在 Microsoft Word 內 AI 起草、編輯、研究 | 90 | Productivity / Writing / AI | [PH](https://www.producthunt.com/products/genspark) |
| 7 | Montage | UI Agentic framework，更快輸出、更少 token 消耗 | 83 | UX / Dev Tools / AI | [PH](https://www.producthunt.com/products/montage-3) |
| 8 | Ghosted: Smart Presence | 離開時自動暫停媒體 / 鎖屏 | 78 | Productivity / Menu Bar Apps | [PH](https://www.producthunt.com/products/ghosted-smart-presence) |
| 9 | TrafficClaw | 用對話查詢 SEO 與 analytics 資料 | 78 | Analytics / SEO / SaaS | [PH](https://www.producthunt.com/products/trafficclaw) |
| 10 | ScreenVeil | 隱藏電腦上不該被看到的內容 | 77 | Privacy / Menu Bar Apps | [PH](https://www.producthunt.com/products/screenveil) |
| 11 | Beauty Diagram | 看起來不像 auto-generated 的圖表 | 76 | Productivity / Dev Tools / Data Viz | [PH](https://www.producthunt.com/products/beauty-diagram) |
| 12 | nudge | 丟入 tasks，AI 自動排整週行程 | 74 | Task Management / Calendar / AI | [PH](https://www.producthunt.com/products/nudge-26) |
| 13 | PeekFocus | 一鍵模糊 active 視窗以外的所有內容 | 72 | Mac / Productivity / Menu Bar Apps | [PH](https://www.producthunt.com/products/peekfocus) |
| 14 | LaunchCut | 互動式 iOS Demo Builder | 70 | Marketing / Dev Tools | [PH](https://www.producthunt.com/products/launchcut-2) |
| 15 | AnyDrop | 瀏覽器版 AirDrop：分享檔案、聊天、同步筆記 | 70 | Web App / Productivity / Privacy | [PH](https://www.producthunt.com/products/anydrop-3) |

> **05-01 觀察**：
>
> ### Agent / AI 主題持續霸榜
>
> 15 件中 AI/agent 相關 8 件（#1, #3, #4, #6, #7, #9, #11, #12），佔 53%。延續 [[src-producthunt-2026-04]] 04 月趨勢——Product Hunt 已被 AI 工具壟斷。
>
> - **#1 Postiz** + **#4 Buda**——「為 agent 設計的 SaaS」興起：產品定位是「給 AI agent 用的工具」而非給人用，社群排程器本身要能被 agent 操作（API/MCP 友善），呼應 [[AI 輔助軟體工程]] 中「人機分工」的延伸
> - **#3 Marx Finance**——多 agent 辯論機制應用到金融分析；agent debate 是 [[Anthropic]] 等公司探討的研究方向
> - **#6 Genspark for Word**——AI 進入既有生產力工具腹地（vs [[Anthropic]] / [[OpenAI]] 各自的 Word/Docs 整合策略）
> - **#7 Montage**「UI Agentic framework，更少 token」——LLM cost optimization 已成為 agent framework 的賣點
>
> ### 編輯器戰局
>
> - **#2 [[Zed]] 1.0**——Zed 終於發布 1.0，開源 + 高效能 + 多人協作三大賣點，166 票第二高。**對應編輯器戰場**：Cursor、Zed、VS Code、JetBrains 在 AI 整合 + 協作軸線上競爭。Zed 走 native（Rust 寫的）+ 開源差異化
>
> ### macOS productivity menu bar 微工具浪潮
>
> 4 件 menu bar app（#8, #10, #11, #13）+ #14 LaunchCut：
> - **共同模式**：「私密性 / 專注 / 隱藏」是賣點——遠端工作 + 視訊會議 + 共享螢幕的場景需求
> - **#10 ScreenVeil + #13 PeekFocus**——同題 differentiation：覆蓋全螢幕 vs 只模糊背景視窗
> - **產品同質化**——這類「一鍵 X」工具進入紅海
>
> ### 跨來源連動
>
> - **whatcable** 在 GitHub Trending #1（[[src-github-trending-2026-05]]）+ HN #12（[[src-hn-2026-05]]），但今日 PH 沒有——三源強信號的 whatcable 可能會在後續 PH 上榜
> - **AI agent 趨勢呼應 [[src-skills-trending-2026-05]] Top 4**：infsh-skills 自家 agent 工具壟斷 trending Top 4，PH 上的 agent SaaS 與 skills.sh 上的 agent skill 形成「面向開發者」（skills.sh）vs「面向產品團隊」（PH）的兩個市場
>
> ### 設計／diagram 工具
>
> - **#5 Bitgrain**——Figma 與 Canva 中間的差異化定位（輕巧 + 靈活）
> - **#11 Beauty Diagram**——明確訴求「不要 AI auto-generated 那種粗糙感」，反 AI slop 設計賣點
