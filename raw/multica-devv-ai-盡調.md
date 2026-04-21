#被牆清零後，兩個工程師帶一群 Agent 扛住 50 萬用戶？

#Multica 背後的「極限小團隊生存樣本」

三個月，破10000星，團隊僅有四人。

Multica 是我近期挖到最有料的開源專案。不是因為它的 OSS 評分有多頂，而是整個盡職調查（Due diligence）的過程，比結果本身更值得玩味。

#Multica 是一個什麼專案？

大家現在大概都習慣用 Claude Code 或 Codex 寫程式了。單拉一個 Agent 跑單線任務很順，但如果你的團隊有十個 Agent 同時在跑不同支線，誰來派發工作？進度怎麼追？某個 Agent 學到的 Skill 怎麼讓其他 Agent 復用？

目前市場上，Linear 負責管「人」的任務；Anthropic 剛推的 Claude Managed Agents 專注管「單一 Agent Session」的安全。但在「多 Agent 團隊級協作」這層，Multica 補足了之前的生態空白。

Multica 的核心玩法是把 Agent 當作真實的 Team Member。在專案看板上，Agent 有獨立的 Profile，直接和人類工程師並列在 Assignee 下拉選單里。發個 Issue 給它，它會自動認領、實作、回報進度，被 Block 時還會主動出聲。解完的方案直接沈澱成 Skill，供日後調配復用。

更香的是它的 Vendor-neutral（供應商中立）特性——不論是 Claude Code、Codex、OpenClaw 還是 OpenCode 都能無縫接入，Daemon 會自動偵測你本機裝的 CLI 進行串接。相比 Anthropic 只能跑自家的 Claude，Multica 的開放架構直接打中了企業對於「Vendor Lock-in（供應商鎖定）」的焦慮。

#從開源社群數據來看：

3 個月拿了 10.3k Stars、1.3k Forks、33 位 Contributors。去翻 Issue，有海外用戶敲碗 GitHub 深度整合，也有中文社群提議 Workspace 分層，外部 PR 也是實打實在修 Self-host 部署的 Bug。為了確認這不是灌水的流量，我跑了一套 「自研」Star 健康度診斷：Star/Fork 比 8.1 倍、Star/Issue 比 73 倍、Fork 率 12.4%，指標全落在健康水位。

但也是這套機制，抖出了更有意思的洞察。

Top-4 貢獻者包攬了 97.4% 的 Commit，外部 Commit 僅佔 3%。這根本不是什麼草根的「社群專案」，而是某個正規軍團隊外流的產物。

#背後的藏鏡人是誰？GitHub Org 成員全數隱藏，About 頁面也找不到任何人名。如果只是一般查證，到這邊大概就斷線了。

但我透過 Contributors API 爬出這四位核心開發的 Handle 逐一比對。

榜首 forrestchang（710 Commits），Bio 寫著「Building @multica-ai」，信箱掛著 jiayuan@multica.ai。交叉比對後確認，這就是 Devv.AI 的 Founder「Jiayuan Zhang」 。這老兄之前在 GitHub 上靠一個 CLAUDE.md 最佳化專案狂攬過 1.5w 星。
第二位 Bohan-J（433 Commits），確認為 Devv.AI 的 Co-founder 蔣博涵（Bohan Jiang）。多倫多大學 CS 科班出身，待過字節跳動，做過破千星的 ReadPilot，ProductHunt 上的抬頭也直接標明瞭身分。

#那麼 Devv.AI 到底在做什麼？

這是 Jiayuan 在 2023 年於上海的一個「開發者專屬 AI 搜尋引擎」專案。護城河在於他們自建了一套垂直索引（Index），專門爬取官方 Docs、Stack Overflow、GitHub 程式碼，再用 RAG 結合 LLM 來回復。白話文就是：不靠 ChatGPT 瞎掰，而是基於真實技術文件生成解答，準確度直接碾壓通用型 AI。

Jiayuan 曾在 Indie Hackers 盤過創業歷程。動工前他深訪了 50 位 Developer，抓准了「苦於通用 AI 吐出垃圾程式碼」的痛點。產品上線後純靠口碑發酵，幾個月內用戶衝破 50 萬大關。2024 年中在 ProductHunt 打榜時，LinkedIn 帖文透露數據已突破 60 萬。

但是由於 GFW（防火長城）限制了專案訪問。一夜之間，核心盤歸零。

Jiayuan 在 2025 年的 LinkedIn 長文中解釋過：Agent 革命爆發後，「搜尋答案」的解法顯得太慢，市場的剛需變成了「直接生成並交付（Generate & Deliver）」。

這就催生了 Devv 2.0：「第一個幫你交付 AI 產品的 Coding Agent」。目標客群直接從純後端工程師，外擴到 PM、Designer 以及沒有技術背景的 Founder。

2023 → 開發者 AI 搜尋引擎（垂直索引 + RAG）

2025 → AI Coding Agent（從搜尋答案到生成產品）

2026 → Agent 管理平台（Multica：管理多個 Coding Agent 的工作流）

每一步都在往工具鏈（Toolchain）更底層的 Infra 扎，扛起這條線的只有 3 到 4 個人。之前 Indie Hackers 披露 Devv 早期靠 3 人編制達到 $30K 的 MRR。

摸清了這個脈絡，Multica 誕生的邏輯就不難推演了。這部分沒有客觀事實支撐屬於我的推理：

Multica 極高機率是他們為了消化內部龐大的 Agent 工作流而開發的自用工具，驗證可行後才轉作開源。

他們 About 頁面那句 Slogan："A small team shouldn't feel small, two engineers and a fleet of agents can move like twenty." 讀起來完全是這伙人的實戰體悟。兩個工程師帶著一群 Agent 扛住 50 萬用戶，接著又用同一套模式炸出了三個月破萬星的開源專案。

#這個故事起底直接翻轉了我的評估結論。

在 OSS Investment Scorecard 框架里，原先 B 維度（Team）因為是匿名團隊只給了 4.5 分。底牌掀開後直接上調到 6.0，總分從 5.30 硬生生拔到 5.56，剛好卡在 Watch 和 Pass 的邊緣。

但比起分數，更硬核的是這個盡調過程。這次評估直接讓我在更新當下分析框架至 v1.3.1 框架，增加三套外掛模組：

R-1: Star 健康度診斷模組：用 GitHub API 抓 5 個量化指標，20 分鐘鑒別專案熱度是否灌水，作 A 維度的輔佐參考。

R-2: Commit 集中度分析模組：當作 Bus Factor（公車指數）的 Proxy。Multica 97.4% 的畸形集中度，一眼分出「草根社群」與「正規軍外流」的差異。

R-3: 匿名團隊身分追溯 SOP：5 步打通任督二脈（API -> 資料欄位 -> LinkedIn / ProductHunt / Indie Hackers 交叉比對），把完全未知的團隊背景搜索出來。

上次 Aryn/Sycamore 的 Case 逼出了 v1.2 的 Acqui-hire 標記機制；這次 Multica 直接催生了 v1.3.1 的三個新外掛。Framework 就是要在這種實戰中不斷吃燃料迭代。

總結來看，Agent Management 這層還在搶定義權的拓荒期，Multica 底層的任務狀態機（State Machine）、Skill 持久化和 Multi-runtime 架構非常有看頭。而 Devv 團隊極小編制操盤萬星專案的存活路數，本身更是教科書級別的新創樣本。

但從投研視角來看，能不能起底這層底細，直接決定了該專案在早期階段的生死判定。

---------------------------------------
⭕️  我歷經兩次創業成功退出，目前擔任新加坡風險投資機構入駐企業家（E.I.R）。我正身處中美 AI 科技一線，親歷時代賦予的這一段波瀾壯闊，十五年產品商業化戰略和資本運作經驗，深度關注全球華人科技創業，歡迎你隨時找我交流創業題目！
如果你喜歡我的文章； 歡迎在評論區訂閱我的 Substack 頻道查閱過往我撰寫的內容！