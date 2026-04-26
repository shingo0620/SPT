# 日誌

> 僅追加記錄。格式：`## [YYYY-MM-DD] 操作 | 標題`

## [2026-04-26] ingest+lint | 修正 04-25 lint 誤判 + ingest 「遊戲引擎的未來」+ 根治 vault 衝突循環

**修正 04-25 lint 誤判**：
- 上次 lint 把 `raw/我似乎已经看见了，游戏引擎的未来！.md` 當「重複檔」刪除——實際上它是 16 行的 Obsidian Clipper YouTube metadata raw（**有效來源待 ingest**），sync-vault pull 又把它從 vault 拉回來
- 教訓：未來判斷「重複」前需 wc/diff 確認內容與既有 raw 一致；URL 純標籤檔（1 行）vs 完整 metadata（含 frontmatter）必須區分

**ingest 「我似乎已经看见了，游戏引擎的未来！」**：
- 作者：秦无邪 OvO（五鞋，遊戲製作人）
- 用 fetch-youtube.sh + Whisper medium 取得逐字稿（raw/yt-...md）
- 新建 [[src-遊戲引擎的未來]]——核心預測：未來遊戲引擎為「人 + AI 代理共同使用」軟體形態、MCP 為過渡產物、遊戲產業類比文藝復興早期
- 與既有 [[Godot]] / [[src-零基礎用AI做遊戲]] / [[Skill vs Bash vs MCP]] / [[綜整-AI協作工程的六大趨勢]] 互引
- 與 [[src-overthinking-scope-creep-structural-diffing]] 形成「樂觀 vs 悲觀」並列視角

**根治 vault 衝突循環**：
- 從 vault 端永久刪除 `addyosmaniagent-skills Production-grade...md` + `obsidian-llm-wikiREADME.md at main · ...md`（兩者皆為 1 行 URL 標籤檔，git 上已有完整對應 `addyosmani-agent-skills.md` / `aster-life-obsidian-llm-wiki.md`）
- 從 git untracked 端也刪除這兩檔
- **下次 sync pull 不會再拉回**，循環根治

**更新頁面**：[[wiki/index.md]]（遊戲設計與開發類別新增 [[src-遊戲引擎的未來]]）、[[wiki/log.md]]

## [2026-04-26] ingest | 2026-04-25 daily sources + 2 篇手動文章

**每日新知 04-25（7 來源完整）——追加至各月報 2026-04-25 區塊**：
- [[src-wikipedia-2026-04]]（精選 Bombing of Obersalzberg 81 週年；MJ 主題群上榜 #3+#4+#8；NFL 選秀年度週；Nahui Ollin 連 11 日破百萬）
- [[src-hn-2026-04]]（**重大事件**：#1 [[Google]] 投資 [[Anthropic]] $40B（684 分）；#6 「Karpathy 風格 LLM Wiki, agent 維護」（145 分，本知識庫概念主流化）；#3 純文字 50 年不死）
- [[src-github-trending-2026-04]]（#1 awesome-gpt-image-2 prompt 庫；#3 byob「Bring Your Own Browser」+ PH #4 Clawdi 同主題；Flash USDT **連七日**spam）
- [[src-producthunt-2026-04]]（**主題：AI 語音 + Google Gemini 連 4 日**；#6 MiMo + #7 Grok Voice 雙語音 agent；#1 ZeroHuman「vibe coding」進入 PH 分類；#14 Regent AI 行為監控）
- [[src-reddit-til-2026-04]]（**乾淨一日**——僅 1 條 ⚠️；#5 鯡魚放屁誤判潛艇 Ig 諾貝爾經典條目）
- [[src-reddit-eli5-2026-04]]（15 則；#5 Google zero-click 策略——直接呼應 04-25 HN #1 Google 投資 Anthropic 事件）
- [[src-skills-picks-2026-04]] → ast-grep **連 8 日**（3,413→**3,511**，+98）；擴散曲線進入緩降階段

**手動文章（2 篇）——新建獨立來源頁**：
- [[src-overthinking-scope-creep-structural-diffing]] — Kevin Lynagh 2026-04 newsletter：overthinking、scope creep 守恆律、structural diff 工具評論——對應 [[src-hn-2026-04]] 04-24 #12
- [[src-skill-guizang-ppt]] — op7418（歸藏）的雜誌風 HTML PPT skill；「強約束派」設計風格、與 [[Garry Tan]] "Thin Harness, Fat Skills" 直接呼應

**更新頁面**：[[src-skill-ast-grep]]（連 8 日 + 安裝數 3,511 + 擴散曲線分析）、[[wiki/index.md]]、[[wiki/log.md]]

**本次特殊事件**：
- **HN #6 wuphf「Karpathy 風格 LLM Wiki, agent 維護」**：本知識庫的核心概念已從 Karpathy 推特帖文 → OSS 實作 → HN 主流視野——值得後續單獨 ingest 為來源頁
- **Google–Anthropic $40B**：AI 三方陣營資金重組關鍵事件
- **op7418 PPT skill fetch-url 超時**：用 GitHub raw URL 直接抓 README，與 04-22 obsidian-llm-wiki / addyosmani 處理方式一致
- **3 個 iCloud 衝突重複檔再現**：sync-vault pull 後 again 出現——建議從 vault 端永久刪除以根治

**未處理（留待後續）**：
- W17 週綜整：今天（04-26）是 W17 週日——明天（04-27）為 W18 週一可開始回看 W17
- 2026-04 月綜整：等月底（04-30 過後）執行
- 04-26 daily sources 待 GitHub Actions 推上後處理

## [2026-04-25] lint | 斷鏈修復 + 7 個新頁建立 + 衝突檔清理

**背景**：執行 `/llm-wiki lint` 健康檢查後發現 5 處斷鏈、7 個應建獨立頁的缺漏實體 / 概念、3 個 iCloud 衝突 raw 重複檔。

**修復斷鏈（5 處）**：
- `[[AI輔助工作流程]]` → `[[src-AI輔助工作流程]]`（src-reddit-eli5-2026-04 04-23 #11）
- `[[Harness Engineering]]` × 3 → `[[src-Harness Engineering]]`（src-github-trending 04-23 future-agi、04-24 endless-toil + Safactory）
- `[[Solo SaaS架構]]` × 3 → `[[src-Solo SaaS架構]]`（src-github-trending 04-23 levelsio + 觀察區、src-reddit-eli5 04-24 #11）
- `[[src-hermes-codex]]` × 2 → 純文字「Hermes Codex skill」（src-github-trending 04-22 + 04-24，原為 placeholder 引用）

**新建頁（8 個）**：
- 實體（組織）：[[DeepSeek]]（中國 LLM、04-24 V4 三榜聯動）、[[Google]]（TPU + Gemini + Workspace 三戰線）、[[OpenAI]]（GPT-5.5 + Codex 3.0 + ChatGPT Images 2.0，**新建頁時自然出現的引用斷鏈，順手補上**）
- 實體（產品系列）：[[Qwen]]（Alibaba 開源 LLM 雙規格策略）
- 實體（人物）：[[antfu]]（Anthony Fu）、[[levelsio]]（Pieter Levels）
- 實體（工具）：[[defuddle]]（Obsidian 網頁清理工具）
- 概念：[[Specification by Example]]（SBE 需求工程方法論，AI 品質共謀的解方）

**孤立頁互引**：
- [[src-obsidian-llm-wiki]] 加入 [[LLM Wiki]] 與 [[三大知識管理系統比較]] 的相關頁面區塊

**清理 iCloud 衝突檔（3 個）**：
- 刪除 `raw/addyosmaniagent-skills Production-grade...md`（重複，已有 `addyosmani-agent-skills.md`）
- 刪除 `raw/obsidian-llm-wikiREADME.md at main · ...md`（重複，已有 `aster-life-obsidian-llm-wiki.md`）
- 刪除 `raw/我似乎已经看见了，游戏引擎的未来！.md`（vault 同步原命名版重複檔）

**更新頁面**：[[wiki/index.md]]（人物 +2、組織 +2、工具 +2、概念 +1）、[[wiki/log.md]]

**未處理（留待後續）**：
- W17 週綜整：W17（04-20~04-26）尚未結束，待 04-27 起回看
- 2026-04 月綜整：等月底（04-30 過後）執行

## [2026-04-25] ingest | 2026-04-23 + 2026-04-24 每日來源

**每日新知 04-23（7 個來源）——追加至各月報 2026-04-23 區塊**：
- [[src-wikipedia-2026-04]]（今日精選 Beyoncé、Nahui Ollin 連續九日破百萬、Earth Day 次日餘熱）
- [[src-hn-2026-04]]（15 則，主題：隱私與供應鏈雙重警報——Firefox/Tor 洩漏、Apple 修補 cop 漏洞、Bitwarden CLI 供應鏈攻擊；反 tech 聲量飆升 Alberta no-tech tractors 1,994 分）
- [[src-github-trending-2026-04]]（3 筆 ❌ 詐騙 repo 連五日模式、levelsio 個人 Chrome 擴充 #1、future-agi/vlnr 雙 AI security、antfu/whenexpr）
- [[src-producthunt-2026-04]]（15 則，主題：Agent 工具鏈收斂——11 項 AI/Agent 相關；Claude Code /ultrareview 上榜 154 分；Monid agent 支付基礎設施）
- [[src-reddit-til-2026-04]]（3 條 ⚠️ 查核：#3 Family Feud 電話調查誇大、#11 最高法院大法官無須法律學位字面正確但實務誤導、#15 Perineum sunning 流行事實需加醫學駁斥脈絡）
- [[src-reddit-eli5-2026-04]]（15 則問題翻譯；#11 LLM 寫作風格被問指標性）
- [[src-skills-picks-2026-04]] → ast-grep **連 6 日**創紀錄再刷新（3,123→**3,227**，單日 **+104** 穩態破局）

**每日新知 04-24（7 來源完整）——追加至各月報 2026-04-24 區塊**：
- [[src-wikipedia-2026-04]]（今日精選 Ornithoprion 古生物；印度雙州選舉主題——Tamil Nadu + West Bengal 2026 選舉齊上榜；Nahui Ollin 連十日破百萬）
- [[src-hn-2026-04]]（主題：**三大 AI 模型發布日**——GPT-5.5（1,457 分）、DeepSeek v4（1,430 分）、Anthropic Claude Code postmortem（826 分）；Bitwarden CLI 攻擊續燒 169→816 分；endless-toil agent 痛苦監聽）
- [[src-github-trending-2026-04]]（DeepSeek V4 發布同步——#1 rolepaly_instruct 512 stars、#7 deep-dive PPT；#10 Safactory trustworthy agent 學術版；Flash USDT spam **連六日**；1 筆 ❌ 成人 AI 生成器 spam）
- [[src-producthunt-2026-04]]（DeepSeek V4、Codex 3.0、Google Workspace Intelligence 同日對決；BAND 多 agent 治理接續 Kollab / /ultrareview / Monid 的 agent 協作層競爭；PH 自家 AI 推出）
- [[src-reddit-til-2026-04]]（1 條 ❌ 嚴重錯誤：#11 Acciaroli 義大利 300 百歲人瑞為誇大，實際約 80 餘人；2 條 ⚠️：#2 英國孩童用書數據需回原研究、#10 Mickey udder「convulsed」為 Reddit 誇張修辭）
- [[src-reddit-eli5-2026-04]]（15 則；主題「身體的為什麼」，與 04-23 感官異常連貫）
- [[src-skills-picks-2026-04]] → ast-grep **連 7 日**再創紀錄（3,227→**3,413**，單日 **+186** 加速擴散；連兩日破穩態，進入連鎖擴散階段）

**更新頁面**：[[src-skill-ast-grep]]（連 7 日 frontmatter + 安裝數 3,413 + +186 加速擴散分析）、[[wiki/index.md]]、[[wiki/log.md]]

**本次特殊事件**：
- **2026-04-24 為 AI 模型年度發布關鍵節點**：單日 HN 前 3 被 GPT-5.5、DeepSeek V4、Anthropic 包辦——AI coding agent 賽道正在高速整合
- **ast-grep 連 7 日 + 連鎖擴散**：連兩日破穩態（+104、+186），推論與 DeepSeek V4 / GPT-5.5 發布引發「大 codebase 結構化搜尋」需求密度相關
- **skills-picks raw frontmatter bug 延續**：2026-04-23、04-24 raw 檔 title/published 皆為「2026-04-18」——屬 fetch 腳本 bug；以 skill name + 安裝數增量判斷實質為 ast-grep 連續曝光
- **04-24 第二次 commit**：因 GitHub Actions 在 UTC 14:00 後推上 04-24 完整 daily sources，本次 ingest 拆分為兩次 commit 處理

## [2026-04-23] ingest | 2026-04-22 每日來源 + 2 篇手動文章

**每日新知（7 個來源）——追加至各月報 2026-04-22 區塊**：
- [[src-reddit-til-2026-04]]（含 6 條 ⚠️ 查核標註：色情成癮、資優生不畢業、法國核燃料 96%、三哩島肚子、1936 奧運印度、死亡谷命名）
- [[src-reddit-eli5-2026-04]]（15 則問題翻譯）
- [[src-hn-2026-04]]（15 則 HN 頭條翻譯，#1 ChatGPT Images 2.0 與 PH #3 跨平台同步）
- [[src-github-trending-2026-04]]（1 筆 ❌ 詐騙 repo 清單縮小至單筆，5 筆 ⚠️ 無說明）
- [[src-producthunt-2026-04]]（15 則產品翻譯，SpeakON 硬體型 AI 介面新類別）
- [[src-wikipedia-2026-04]]（今日精選 Nihilism、John Ternus 瀏覽量再增 56%）
- [[src-skills-picks-2026-04]] → ast-grep **連 5 日**創紀錄（3,072→3,123 裝）

**手動文章（2 篇）——新建獨立來源頁**：
- [[src-addyosmani-agent-skills]]（20 個 production-grade skill，覆蓋完整 SDLC 6 階段；與 [[src-mattpocock-skills]] 互補）
- [[src-obsidian-llm-wiki]]（aster-life/obsidian-llm-wiki，架構與本 wiki 高度對齊但面向 Obsidian 使用者）

**更新頁面**：[[src-skill-ast-grep]]（連 5 日 frontmatter + 安裝數追蹤）、[[wiki/index.md]]

**本次特殊事件**：
- markdown.new fetch-url.sh 超時（兩次手動文章擷取），改用 GitHub raw URL 直接拿 README
- skills.sh 連 5 日選 ast-grep 創紀錄，轉化率 1.90 install/h 已達可預測穩態
- 2026-04-21 的預測「04-22 將到 3,120±5」精準命中（實際 3,123）
- 2026-04-22 的清理：2 個占位 URL 檔（placeholder）被替換為完整 README 內容並重命名


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

## [2026-04-18] ingest | 每日新知 2026-04-17（4 來源）
- 處理日期：2026-04-17
- 處理來源：raw/hn-top-2026-04-17.md、raw/wikipedia-featured-2026-04-17.md、raw/producthunt-2026-04-17.md、raw/skills-picks-2026-04-17.md
- 更新頁面：[[src-hn-2026-04]]、[[src-wikipedia-2026-04]]、[[src-producthunt-2026-04]]、[[src-skills-picks-2026-04]]（追加 2026-04-17 區塊，更新 frontmatter sources/updated）
- 新建頁面：[[src-skill-3b1b-style-animation-skill]]（skills.sh 當日精選獨立解析頁）
- 事實查核：
  - ✅ Wikipedia 歷史上的今天：Kepler-186f (2014)、West Texas 化肥廠爆炸 (2013)、Yvonne Fletcher (1984)、荷蘭-錫利群島和平 (1986)、特拉維夫餐廳爆炸 (2006) 皆屬實
  - ✅ HN #1 Asimov《最後的問題》為 1956 真實短篇；#5 Claude Opus 4.7 與當前使用模型一致
  - ⚠️ skills-picks raw 檔有 fetch bug：「Skill README」區塊錯置為 ast-grep（2026-04-18 的 pick）。已依 frontmatter 與「今日精選」欄位確認 2026-04-17 pick 為 3b1b-style-animation-skill（1 install）
- 當日主題觀察：Claude Opus 4.7 與 OpenAI Codex 2.0 同日發布 agentic coding 工具；HN #15 Stage（code review）與已知 [[src-Code Review已死]] 共振
- 未處理：reddit-til / reddit-eli5 / github-trending 當日無 raw 檔（自動化流程可能未擷取到內容）

## [2026-04-18] infra | 修 Reddit fetch + 啟用本機 launchd cron
- 發現：GitHub Actions 上 fetch-reddit-*.sh 持續失敗（curl exit 22 = HTTP 403），Reddit 封 datacenter IP；`continue-on-error: true` 把錯誤藏成 success
- 嘗試 1（失敗）：加 OAuth client_credentials 支援——使用者無法建立 Reddit app 而放棄
- 解法：改走本機 launchd，每日 22:05 跑 scripts/fetch-reddit-local.sh → 抓 reddit-til + reddit-eli5 → 順手 sync-vault push
- 新檔：scripts/fetch-reddit-local.sh、scripts/com.shingowu.spt.fetch-reddit.plist
- 工作流變動：GH Actions 移除 Reddit 兩步；本機 launchd 接手；/bin/bash 授予 Full Disk Access 讓 launchd 能寫 iCloud
- Commits：ca1ca82（OAuth 嘗試）、f8eab2d（改本機 cron）
- 缺口：reddit-til 04-15/16/17 與 reddit-eli5 04-16/17 永久缺角（Reddit `top?t=day` 不回歷史資料）

## [2026-04-18] ingest | reddit 04-18 + Claude Code Routines
- 處理日期：2026-04-18（Reddit）+ 既有 Obsidian bookmark（Routines）
- 處理來源：raw/reddit-til-2026-04-18.md、raw/reddit-eli5-2026-04-18.md、raw/automate-work-with-routines-claude-code-docs.md
- 新建頁面：[[src-Claude Code Routines]]
- 更新頁面：[[src-reddit-til-2026-04]]（追加 2026-04-18 區塊 + 04-15/16/17 缺口說明）、[[src-reddit-eli5-2026-04]]（追加 2026-04-18 + 04-16/17 缺口說明）、[[index]]
- 事實查核（reddit-til 04-18 全 15 條）：14 條 ✅，1 條 ⚠️（#3 拿破崙 6 天馬爾他改革——核心屬實但部分細節可能混入後續佔領期）
- raw/ 更新：刪除原 URL bookmark 檔、換為 fetched 內容（正確 kebab-case 命名）
- 關聯觀察：Routines 呼應既有 wiki 中 [[src-Harness Engineering]]「Lifelong AI Agent」願景、且為 HN 月報 04-15 #1 同一來源的正式收錄

## [2026-04-19] ingest | 每日新知 2026-04-18（5 來源）+ Using Claude Code 文章
- 處理日期：2026-04-18（5 個每日新知來源）+ Using Claude Code session 管理文章
- 處理來源：raw/hn-top-2026-04-18.md、raw/wikipedia-featured-2026-04-18.md、raw/producthunt-2026-04-18.md、raw/github-trending-2026-04-18.md、raw/skills-picks-2026-04-18.md、raw/Using Claude Code-Session Management and 1M Context.md
- 新建頁面：[[src-Claude Code Session管理]]（Anthropic 團隊講 context rot、rewind、compact vs clear、bad compact、subagent）、[[src-skill-ast-grep]]（skills.sh 04-18 精選獨立解析頁，2,941 裝）
- 更新頁面：[[src-hn-2026-04]]、[[src-wikipedia-2026-04]]、[[src-producthunt-2026-04]]、[[src-github-trending-2026-04]]、[[src-skills-picks-2026-04]]（皆追加 2026-04-18 區塊）；[[Restatement]]、[[src-Claude Code五個底層概念]]、[[src-Harness Engineering]]、[[src-Claude Code Routines]] 加入對 Session 管理頁的交叉引用
- 事實查核：
  - ✅ Wikipedia 04-18 歷史：Dominion 7.87 億和解（2023）、Mueller 報告（2019）、遼寧熔鋼事故（2007）、Qana 砲擊（1996）、Mugabe 就任辛巴威首任總理（1980）五條全屬實
  - ⚠️ HN #4 Michael Rabin 逝世——連結為 Wikipedia 條目而非訃聞，待權威來源確認
  - ❌ GitHub Trending #3 USDT-Flasher（加密貨幣詐騙工具）、#7 AutoCAD 2026 Desktop（盜版/惡意軟體樣態）——已加刪除線
  - ⚠️ GitHub Trending #5 Claude-Design-By-Anthropic 命名碰瓷（非 Anthropic 官方，Claude Design 本為網頁服務）
- 當日主題觀察：**Anthropic Labs 日**——Claude Design 同時衝上 HN #8（1,104 分）、PH #1、衍生出 GitHub #8 awesome-claude-design；Claude 4.7 tokenizer 成本分析（HN #10）引發熱議
- 關聯觀察：Session 管理文章與既有 [[src-Claude Code五個底層概念]]「窗口」為操作-概念互補；bad compact 成因呼應 [[Restatement]] 要解決的問題；ast-grep skill 2,941 裝 >> character-arc 248 >> 3b1b 1，驗證「工具型 skill >> 領域型」的生態分佈
- 未處理：GitHub Trending 04-17 無 raw 檔（fetch 當日未擷取到內容）——已於月報標注缺口

## [2026-04-19] rule-fix | 週綜整時機修正 + 撤回過早的 W16 綜整
- 原誤解：以為「每週一次」= 本週隨時做
- 使用者糾正（2026-04-19）：「要過完完整一週才做……week17 才可以進行 week16 的分析」
- 修正 memory feedback_weekly_synthesis.md：進入 Wn 時檢查 W(n-1) 是否已做，絕不在當週未結束時做當週綜整
- 已刪除：過早建立的 `wiki/週綜整-2026-W16.md`（今天 04-19 是 W16 最後一天，W16 尚未結束）
- 已從 index.md 移除對應條目，留下「尚無週綜整」占位說明
- W15（2026-04-06 ~ 04-12）知識庫尚未建立，**不需要補**
- W16 綜整將於 2026-04-20（W17 週一）以後的 ingest 補做

## [2026-04-20] ingest | Reddit 04-19（本機 launchd 昨晚擷取）
- 處理日期：2026-04-19（Reddit TIL + ELI5）
- 處理來源：raw/reddit-til-2026-04-19.md、raw/reddit-eli5-2026-04-19.md
- 更新頁面：[[src-reddit-til-2026-04]]、[[src-reddit-eli5-2026-04]]（皆於檔首追加 2026-04-19 區塊）
- 事實查核（reddit-til 04-19 全 15 條）：全數 ✅——多為 Wikipedia、BBC、CBC、PubMed 等權威或可溯源來源；無誇大或誤導標題
- 關聯觀察：TIL #1 迪士尼遊輪救人（2024 年新聞）顯示 TIL 社群偶收近期病毒式新聞而非純歷史冷知識；ELI5 物理/網路基礎設施類別（#2/4/7/10/14/15）當日熱度集中
- 備註：本次 ingest 開始前已執行 `sync-vault.sh pull`，結束後將執行 `sync-vault.sh push`

## [2026-04-20] query-save | AST 理論概念頁
- 觸發：使用者 query「AST 理論是什麼」，發現 wiki 只有 [[src-skill-ast-grep]] 實作層、無理論頁——屬 lint 會抓出的「缺漏實體」
- 新建頁面：[[AST]]（概念頁，type: concept，sources: []，來自 LLM 既有知識）
- 更新頁面：
  - [[index]]：新建「程式語言與工具」子分類於概念區，置入 [[AST]]
  - [[src-skill-ast-grep]]：「相關頁面」區首行加入 [[AST]] 作為理論根基
  - [[QMD]]：「AST 感知分塊」改為 [[AST]] wikilink 並補說明
- 可延伸子題（備忘）：tree-sitter 運作、Visitor Pattern、CFG vs AST、Abstract Interpretation

## [2026-04-21] ingest | 04-20 每日新知 + 2 篇手動文章
- 開始前執行 `sync-vault.sh pull`（三項 feedback 紀律）
- **每日新知（04-20，7 來源）**：全部追加到各月報檔首（新到舊）
  - [[src-reddit-til-2026-04]]：15 條冷知識（✅14 條、⚠️1 條「奶油之夜」時間精確性微誇大）
  - [[src-reddit-eli5-2026-04]]：15 條 ELI5，生理生活類為主（#9 Passkeys 呼應近週資安話題）
  - [[src-hn-2026-04]]：當日 #4 GitHub 假星經濟 422 分、#13 NSA 使用 Anthropic Mythos 272 分、#3 歐盟 2027 強制手機可換電池 296 分——三條高分都涉及「供應鏈信任」類議題
  - [[src-github-trending-2026-04]]：❌3 條加密詐騙 repo 衝榜（Flash-USDT-Sender、Exodus-Fake-Balance、USDT-Flasher-Hydra-Edition）配合 HN 04-20「假星經濟」形成印證；⚠️3 條雙用資安/灰色工具；合法延續有 #9 ovo-local-llm、#15 claude-code-design 等 Claude 生態
  - [[src-producthunt-2026-04]]：Pitch Berlin 包場日；#3 Claude Desktop Buddy 是本週第二個 Claude 實體週邊；#2 The New Waydev「從 token 到 production」定義新類別
  - [[src-wikipedia-2026-04]]：「首次/最大/唯一」主題日——Starship IFT-1、Deepwater Horizon、Danica Patrick 首冠 IndyCar、Lugo 終結 61 年單黨
  - [[src-skills-picks-2026-04]]：ast-grep **連三日精選**（前所未見），安裝數 2,941→2,972→3,023（48h +82）；[[src-skill-ast-grep]] 頁面追加 04-20 紀錄
- **手動文章 1——AI 時代的測試管理**（敏捷三叔）
  - 新建：[[src-AI時代的測試管理]]、[[AI 品質共謀]]（概念）
  - 交叉引用：[[src-Code Review已死]]、[[src-Harness Engineering]]、[[src-AI-Agent避坑指南]]、[[AI 輔助軟體工程]]
  - 核心論點：AI 同時寫 code 與 test 會產生「同源共謀」，CI 綠燈可能是幻覺
- **手動文章 2——Multica/Devv.AI 盡調**（匿名 VC 作者）
  - 檔案重新命名：`raw/未命名.md` → `raw/multica-devv-ai-盡調.md`
  - 新建：[[src-multica-devv-ai盡調]]、[[Multica]]（工具）、[[Devv.AI]]（組織）、[[OSS Investment Scorecard]]（概念）
  - 核心論點：Multica 極可能是 3-4 人 Devv.AI 團隊為消化內部 Agent 工作流的自用工具；OSS Investment Scorecard v1.3.1 新增 R-1 Star 健康度、R-2 Commit 集中度、R-3 匿名團隊追溯
- **略過處理**：`raw/Using Claude Code-session management and 1M context 1.md`（只含 URL，與既 ingest 的 [[src-Claude Code Session管理]] 為同篇）
- **不做週綜整**：今天 2026-04-21 在 W17 Day 2，W16 綜整（[[週綜整-2026-W16]]）已於 04-20 建立——依「週綜整必須過完完整一週才做」原則跳過
- 影響總頁面：新增 6（2 source + 2 entity + 2 concept）、更新 9（7 月報 + ast-grep skill 頁 + index）
- 結束後執行 `sync-vault.sh push`

## [2026-04-20] lint + batch-fix | 全量 lint 批次修正（7 項）
- 觸發：使用者跑 `/llm-wiki lint`，報告 7 項待辦，全數批准修正
- 掃描規模：52 頁 wiki，建立反向連結圖譜確認無孤立頁、無懸空 index 連結、frontmatter 全齊
- 修正內容：
  1. **3 處懸空 wikilink**（[[src-skill-3b1b-style-animation-skill]]）——`[[character-arc]]`→[[src-skill-character-arc]]、`[[mattpocock-skills]]`→[[src-mattpocock-skills]]、[[3Blue1Brown]] 新建實體頁
  2. **新建 [[Claude Code]]** 實體頁（18 頁提及的核心工具）
  3. **新建 [[Anthropic]]** 實體頁（8 頁提及的公司）
  4. **新建 [[skills.sh]]** 實體頁（5 頁提及的策展平台）
  5. **補 ingest 04-19 五個每日新知**：[[src-hn-2026-04]]、[[src-wikipedia-2026-04]]、[[src-producthunt-2026-04]]、[[src-github-trending-2026-04]]、[[src-skills-picks-2026-04]]（後者註記連兩日 ast-grep 延續精選）；[[src-skill-ast-grep]] frontmatter 追加 sources 與安裝數更新 2,941→2,972
  6. **新建 [[週綜整-2026-W16]]** 綜整頁（W16 為知識庫起點週）
  7. **log.md 兩處路徑式連結** [[wiki/index.md]] → [[index]] 統一
- 事實查核：HN 04-19 15 條全數 ✅（多為 NIST/USENIX/Archive.org/Kotaku 等權威或可驗證來源）；Wikipedia 歷史上今天 5 條全數 ✅；GitHub Trending 04-19 標記 1 條 ❌（dashen-money 無描述疑似刷榜）、3 條 ⚠️（Cairn 滲透測試工具／MITM-DomainFronting 攻擊工具／cfnb 繞限制灰區）
- ingest 偵測盲點教訓：剛剛 04-20 首次 ingest 只用 `git status -s` 抓到 untracked 的 Reddit 兩檔，漏掉 commit 5183250 已追蹤但 wiki 月報未同步的 5 個 raw——lint 第 3 步「比對月報已處理日期」補救了這個漏網
- index.md 重構：「實體」類別下細分「人物 / 組織 / 工具與平台」三小節（原為平鋪），置入新建實體頁
- 影響總頁面：新增 5（Claude Code、Anthropic、skills.sh、3Blue1Brown、週綜整-2026-W16）、修改 10+

## [2026-04-22] ingest | 2026-04-21 每日新知 + multica GitHub README 補強
- 觸發：`/llm-wiki ingest`，偵測 2026-04-21 全部 7 個自動來源未 ingest（前次 commit 7959f79 只推 raw 未建 wiki）+ 1 個手動 `/browse` 抓取
- 流程：`sync-vault.sh pull` → 讀取 8 個 raw → 查核 → 月報新到舊插入 → Multica 實體補強 → 建 Apple 實體 stub
- **每日 7 來源**（月報皆在 2026-04-20 區塊之前新增 2026-04-21 區塊）：
  - [[src-reddit-til-2026-04]]：15 則 TIL，2 則 ⚠️（#6 Filles du roi 年份誤差 1 年、#12 American mink 腦容量百分比依測量而異）、1 則 ✅ 補註釋（#7 EATTHE 車牌完整情境）
  - [[src-reddit-eli5-2026-04]]：15 題問題翻譯（生理機制 + 金融科普主軸）
  - [[src-hn-2026-04]]：15 條（John Ternus 接 Apple CEO #1 2,061 分；Anthropic 雙頭條：CLI 政策反轉 #3、Amazon 50 億美元投資/100 億美元 AWS 支出 #7）
  - [[src-github-trending-2026-04]]：15 repo，4 則 ❌/⚠️（3 則 crypto flasher 詐騙工具、1 則 SEO spam）；#2 geo-citation-lab × Product Hunt #1 RankAI / #4 Dageno 形成「GEO 需求-產品-研究」三角
  - [[src-producthunt-2026-04]]：15 產品（Kimi K2.6 首登 #3、Perplexity Health、Cosine Swarm、Chronicle for Codex）
  - [[src-wikipedia-2026-04]]：Sinestro Corps War 精選 + John Ternus 進熱門榜 #4（26.4 萬瀏覽；與 HN #1 同一事件跨平台熱度）+ 歷史上今天 5 條全 ✅
  - [[src-skill-ast-grep]]：ast-grep 連四日精選（**歷來最長**），安裝數 3,023→3,072（+49），72h 累積 +131 裝；[[src-skills-picks-2026-04]] 同步更新
- **Multica 補強**（手動 `/browse` 抓 GitHub README 2026-04-21 22:01）：
  - 新建 [[src-multica-github-readme]]（官方第一手來源，補盡調資訊差）
  - 更新 [[Multica]]：CLI 支援從 4 種擴至 **8 種**（+Hermes、Gemini、Pi、Cursor Agent）、技術棧細節（Next.js 16 + Go Chi + PostgreSQL 17 + pgvector）、vs Paperclip 定位分化
- **新建 [[Apple]] 實體 stub**：John Ternus 接任 CEO 事件為本月跨來源熱點（HN #1 + Wikipedia 熱門 #4 + Stratechery 策略分析）
- **W17 週綜整不做**：今天 2026-04-22 仍在 W17（04-20 ~ 04-26）中，依記憶規則「週綜整必須過完完整一週才做」，等到 04-27 後才回看 W17
- 事實查核亮點：
  - Reddit TIL：2 則 ⚠️ 數據輕微誤差（用「接近野生祖先水準」替代 Reddit 標題的單一百分比）
  - GitHub Trending：3 則 ❌ 連日出現 crypto flasher 詐騙工具，已成系統性現象
- 影響總頁面：新增 3（[[src-multica-github-readme]]、[[Apple]]、log 本筆）；修改 9（7 月報 + [[Multica]] + [[index]] + [[src-skill-ast-grep]]）
- 結束執行 `sync-vault.sh push`

## [2026-04-22] lint | ingest 後健康檢查 + 3 項修正
- 觸發：`/llm-wiki lint`，全量掃描 66 頁
- 掃描通過項：
  - ✅ 所有 64 頁實體內容皆列於 [[index]]，無索引遺漏
  - ✅ 無孤立頁面（最低反向連結 2）
  - ✅ [[Apple]]、[[src-multica-github-readme]] 各 3 反向連結，整合良好
  - ✅ 月報 frontmatter `sources` 與 `updated` 全部同步至 2026-04-21
  - ✅ 無殘留誤植的 [[Gemini]] / [[OpenAI]] / [[Amazon]] / [[AWS]] / [[Privacy-First Architecture]] / [[Enshittification]] wikilink
- 修正內容：
  1. [[src-producthunt-2026-04]] 懸空 wikilink `[[src-AI 寫 code 時代，不抓 Bug、不留 Test Case 真的沒事嗎？]]` → `[[src-AI時代的測試管理]]`（本次 ingest 誤把 raw 檔名當 wiki 頁名）
  2. [[src-multica-github-readme]] 懸空 wikilink `[[src-AI 時代的測試管理]]`（多一空格） → `[[src-AI時代的測試管理]]`
  3. 新建 [[Manim]] 實體頁——3Blue1Brown 的 Python 動畫引擎，wiki 中 6 處提及但缺頁；作為 [[src-skill-3b1b-style-animation-skill]] 的技術基礎
- 未修正但標記：
  - **GEO（Generative Engine Optimization）** 本月 2 來源出現（GitHub Trending #2 + PH #1/#4），暫不建概念頁，累積 3+ 來源再建
  - **John Ternus / Tim Cook** 暫歸入 [[Apple]] 頁章節，避免單事件人物 stub
- 影響頁面：[[src-producthunt-2026-04]], [[src-multica-github-readme]], [[Manim]]（新）, [[index]]
