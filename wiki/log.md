# 日誌

> 僅追加記錄。格式：`## [YYYY-MM-DD] 操作 | 標題`

## [2026-04-13] init | 知識庫初始化
- 主題：個人知識庫（主題隨時間與趨勢演進）
- 語言：繁體中文
- 來源類型：Markdown、PDF、圖片、URL

## [2026-04-13] ingest | 向三位大師學AI筆記
- 來源：raw/向三位大師學AI筆記.md
- 新建頁面：[[src-向三位大師學AI筆記]], [[Andrej Karpathy]], [[Tobi Lütke]], [[Garry Tan]], [[LLM Wiki]], [[QMD]], [[GBrain]], [[三大知識管理系統比較]]
- 頁面總數：8（1 來源摘要 + 3 實體 + 3 概念 + 1 比較）

## [2026-04-13] ingest | karpathy筆記實作
- 來源：raw/karpathy筆記實作.md
- 新建頁面：[[src-karpathy筆記實作]]
- 更新頁面：[[LLM Wiki]]（新增「為什麼取代 RAG」與「實作方式」章節）, [[Andrej Karpathy]]（新增來源引用）

## [2026-04-13] ingest | LLM Wiki 原始構想文件
- 來源：raw/LLM Wiki.md
- 新建頁面：[[src-LLM Wiki]]
- 更新頁面：[[LLM Wiki]]（大幅豐富——新增三種操作詳述、索引與日誌、為什麼有效、Obsidian 工具整合、Memex 歷史脈絡、擴展適用場景）, [[Andrej Karpathy]]（新增來源引用）

## [2026-04-13] ingest | Skill、Bash、MCP
- 來源：raw/Skill、Bash、MCP.md
- 新建頁面：[[src-Skill Bash MCP]], [[Skill vs Bash vs MCP]]
- 備註：主題為 LLM 工具選擇方法論，與知識管理系統主題不同但互補

## [2026-04-13] lint | 交叉引用修正
- 修正項目：3 個缺少交叉引用
- 影響頁面：[[QMD]]（加連結至 Skill vs Bash vs MCP）, [[Skill vs Bash vs MCP]]（加連結至 QMD）, [[src-Skill Bash MCP]]（加連結至相關來源摘要）

## [2026-04-14] ingest | 遊戲製作流程（批次 1/3）
- 來源：raw/一个视频搞懂整个游戏制作流程，架构级拆解梳理，揭秘3A大厂踩过的坑。.md
- 新建頁面：[[src-遊戲製作流程]], [[遊戲開發流程]], [[垂直切片]], [[拉瑞安工作室]]
- 頁面總數：4（1 來源摘要 + 2 概念 + 1 實體）
- 備註：知識庫新增「遊戲設計與開發」分類，index.md 按主題分群

## [2026-04-14] ingest | MDA 框架（批次 2/3）
- 來源：raw/什麼是好玩？怎樣才叫好玩？一套改變遊戲設計史的理論，教你如何拆解分析遊戲.md
- 新建頁面：[[src-MDA框架]], [[MDA 框架]], [[Marc LeBlanc]]
- 頁面總數：3（1 來源摘要 + 1 概念 + 1 實體）

## [2026-04-14] ingest | 遊戲發想四問（批次 3/3）
- 來源：raw/(96) 如何把💡靈感變成遊戲？ 15堂課學會遊戲開發 🔧1發想 遊戲編劇做遊戲 2.md
- 新建頁面：[[src-遊戲發想四問]], [[遊戲發想]]
- 頁面總數：2（1 來源摘要 + 1 概念）

## [2026-04-14] ingest | 零基礎用 AI 做遊戲
- 來源：raw/零基礎用 AI 做遊戲：不花一分錢，從陽春到華麗的全過程.md
- 新建頁面：[[src-零基礎用AI做遊戲]], [[AI 輔助遊戲開發]], [[Godot]]
- 更新頁面：[[遊戲開發流程]]（新增 AI 對開發流程的影響段落）, [[遊戲發想]]（團隊規模差異加入 AI 擴展能力、新增交叉引用）
- 頁面總數：3 新建 + 2 更新

## [2026-04-15] ingest | Matt Pocock Skills Repo
- 來源：raw/mattpocock-skills-repo.md（從 GitHub repo 擷取）
- 新建頁面：[[src-mattpocock-skills]]
- 更新頁面：[[AI 輔助軟體工程]]（新增第 3 來源，加入交叉引用）
- 備註：提供了 write-a-prd、prd-to-issues、prd-to-plan 三個核心 skill 的具體模板與流程

## [2026-04-15] ingest | AI 輔助工作流程 + API Key 設計
- 來源：raw/My AI-Assisted workflow.md, raw/My adventure in designing API keys.md
- 新建頁面：[[src-AI輔助工作流程]], [[src-API-Key設計]]
- 更新頁面：[[AI 輔助軟體工程]]（新增第 2 來源，加入完整 7 步驟工作流程、AFK/HITL 分類、實踐建議 6-7）
- 頁面總數：2 新建 + 1 更新

## [2026-04-15] ingest | 每日新知 5 來源首次建立月報
- 處理日期：2026-04-15
- 新建頁面：[[src-hn-2026-04]], [[src-reddit-eli5-2026-04]], [[src-github-trending-2026-04]], [[src-producthunt-2026-04]], [[src-wikipedia-2026-04]]
- GitHub Trending 月報僅保留有意義的專案（過濾無描述/低品質項目，15→7）
- index.md 重組「每日新知（月報）」分類，統一管理 6 個來源

## [2026-04-15] lint | 健康檢查修正
- index.md：將 src-reddit-til-2026-04 從「概念」移至「來源摘要」正確分類
- LLM Wiki.md：新增交叉引用至 [[AI 輔助軟體工程]]
- Skill vs Bash vs MCP.md：新增交叉引用至 [[AI 輔助軟體工程]]
- 已知保留：src-reddit-til-2026-04 為孤立頁面（設計如此），Claude Code 暫不建實體頁

## [2026-04-15] ingest | dotLLM
- 來源：raw/dotllm-building-llm-inference-engine-in-csharp.md（從 raw/Untitled.md 的 URL 擷取）
- 新建頁面：[[src-dotLLM]], [[AI 輔助軟體工程]]
- 更新頁面：[[AI 輔助遊戲開發]]（新增交叉引用至 AI 輔助軟體工程）
- 頁面總數：2 新建 + 1 更新

## [2026-04-15] ingest | Reddit TIL 月報 2026-04（首次建立）
- 來源：raw/reddit-til-2026-04-14.md
- 新建頁面：[[src-reddit-til-2026-04]]
- 處理日期：2026-04-14（15 篇，已翻譯為繁體中文）
- 備註：月報格式建立，後續每日增量追加

## [2026-04-14] note | 跳過無內容來源
- 跳過：raw/坦白讲，普通人学大模型玩的就是信息差！.md（無逐字稿）
- 跳過：raw/【游戏众生相】游戏设计第一课！什么是"游戏机制"？.md（無逐字稿）

## [2026-04-15] cleanup | 刪除無內容來源
- 刪除：raw/坦白讲，普通人学大模型玩的就是信息差！.md
- 刪除：raw/【游戏众生相】游戏设计第一课！什么是"游戏机制"？.md
- 刪除：raw/Untitled.md（URL 已擷取為 dotllm-building-llm-inference-engine-in-csharp.md）

## [2026-04-16] note | 跳過無內容來源
- 跳過：raw/AI视频最大的问题，被Blender解决了.md（YouTube 逐字稿無法擷取，僅有標題與一行描述）

## [2026-04-16] ingest | AI Agent 避坑指南
- 來源：raw/做 AI Agent 最痛苦的事：明明看了很多教程，最后还是做不对....md
- 新建頁面：[[src-AI-Agent避坑指南]], [[Restatement]]
- 更新頁面：[[Skill vs Bash vs MCP]]（新增 Skill 長任務限制 + 交叉引用）, [[AI 輔助軟體工程]]（新增 Agent 架構演進教訓、實踐建議第 8 條 + 交叉引用）
- 重點強調：Restatement 機制與 KV Cache 實務考量
- 頁面總數：2 新建 + 2 更新 + index.md + log.md

## [2026-04-16] ingest | 每日新知 2026-04-16（5 來源）
- 處理日期：2026-04-16
- 更新頁面：[[src-hn-2026-04]]（+14 則，過濾 1 則招聘），[[src-github-trending-2026-04]]（+6 則，過濾 9 則垃圾/無描述），[[src-producthunt-2026-04]]（+15 則），[[src-wikipedia-2026-04]]（精選文章 + 熱門 + 歷史上的今天）
- 新建頁面：[[src-skills-picks-2026-04]]（新來源首次建立月報，依三面向格式深度分析 character-arc skill）
- HN 亮點：Cybersecurity = PoW（398 分）、Cal.com 轉閉源（303 分）、ChatGPT for Excel（202 分）
- GitHub Trending 亮點：tiks（程序化 UI 音效）、KillerPDF（可攜 PDF 編輯器）、claude-detector（中轉站掺假檢測）
- PH 亮點：Notion Diff、Sequna（AI Agent 工作記憶）、OmniType
- Wikipedia：圖靈測試進入熱門 Top 10（11.2 萬瀏覽）
- skills.sh：character-arc by jwynia——非程式碼類 diagnostic skill，用於角色弧線設計
- index.md 新增 src-skills-picks-2026-04 至每日新知分類

## [2026-04-16] ingest | 顧客管理 50 問
- 來源：raw/你真的了解你的顧客嗎？—— 50 個自我診斷問題.md
- 新建頁面：[[src-顧客管理50問]], [[顧客終身價值]]
- 知識庫新增「商業與顧客管理」分類
- 頁面總數：2 新建 + index.md + log.md

## [2026-04-16] ingest | Claude Code 五個底層概念
- 來源：raw/yt-為什麼-claude-code-有時很聰明有時又很蠢五個底層概念讓你秒懂.md（Whisper 語音辨識逐字稿）
- 新建頁面：[[src-Claude Code五個底層概念]]
- 更新頁面：[[AI 輔助軟體工程]]（新增第 5 來源 + 交叉引用）
- 五個概念：概率（next-token prediction）、窗口（context window 稀缺性）、模型（Opus/Sonnet/Haiku 選擇）、循環（Agent Loop）、層級（Prompt Injection Hierarchy 四層）
- 與既有 wiki 高度關聯：Restatement（窗口管理）、Skill vs Bash vs MCP（Agent Loop 工具調用）、LLM Wiki（上下文管理實踐）

## [2026-04-16] refactor | Skill pick 獨立成頁
- 使用者偏好：每個 skills.sh daily pick 都做成獨立解析頁
- 新建頁面：[[src-skill-character-arc]]（從月報抽出，擴充為完整三面向解析）
- 更新頁面：[[src-skills-picks-2026-04]]（月報改為索引 + wikilink 連結至獨立頁）
- 更新 CLAUDE.md：skills.sh 彙整指引新增「頁面結構」段落，定義獨立頁 + 月報索引的雙層架構
- index.md 新增「Skill 解析」分類

## [2026-04-17] ingest | Code Review 已死
- 來源：raw/how-to-kill-the-code-review-by-ankit-jain-latentspace.md
- 新建頁面：[[src-Code Review已死]]
- 更新頁面：[[AI 輔助軟體工程]]（新增第 6 來源 + 「Review Intent not Code」段落 + 交叉引用）, [[src-mattpocock-skills]]（新增交叉引用至 spec-driven development 對應）
- 重點：Spec-driven development、Swiss-cheese 五層信任模型、BDD 復興
- 頁面總數：1 新建 + 2 更新 + index.md + log.md

## [2026-04-17] ingest | Solo SaaS 架構
- 來源：raw/當一個人的 SaaS 不再需要矽谷.md
- 新建頁面：[[src-Solo SaaS架構]]
- 更新頁面：[[AI 輔助軟體工程]]（新增交叉引用——AI 寫得好的語言選擇）, [[顧客終身價值]]（新增交叉引用——micro-SaaS 夜市經濟學的 CLV/CAC）
- 重點：$20/月基礎設施跑 $10K MRR、Go+SQLite+本地GPU 反直覆決策、低維護成本 > 低製作成本、夜市經濟學
- index.md 新增「獨立開發與架構」分類
- 頁面總數：1 新建 + 2 更新 + index.md + log.md

## [2026-04-17] ingest | Harness Engineering 駕馭工程
- 來源：raw/Harness Engineering.md（李宏毅教授講座）
- 新建頁面：[[src-Harness Engineering]]
- 更新頁面：[[AI 輔助軟體工程]]（新增交叉引用）, [[Restatement]]（新增交叉引用至 Ralph Loop）, [[Skill vs Bash vs MCP]]（新增交叉引用至三種控制手段）, [[src-Claude Code五個底層概念]]（新增交叉引用）, [[src-AI-Agent避坑指南]]（新增交叉引用）
- 重點：Harness = 認知框架 + 能力邊界 + 工作流程；agents.md 研究；Ralph Loop；情緒 feedback；Lifelong AI Agent；AI 教 AI（13.5→85 分）
- 頁面總數：1 新建 + 5 更新 + index.md + log.md

## [2026-04-17] query → synthesis | AI 協作工程的六大趨勢
- 類型：綜合 12 個來源的趨勢分析，由 query 觸發後存為綜整頁
- 新建頁面：[[綜整-AI協作工程的六大趨勢]]
- 六大趨勢：重心轉向環境設計、上下文管理成核心挑戰、人類判斷向上游遷移、基礎設施民主化、Skill 成新軟體原語、Agent 從工具走向長期夥伴
- 五個強化方向：Harness 設計模式系統化、上下文管理量化、Spec-driven 工具鏈、微型 SaaS 方法論、Skill 生態系追蹤
- 知識庫現況：最厚實=AI Agent 執行層（6 來源），最薄弱=Spec→驗證鏈路 + Product→Business 銜接
