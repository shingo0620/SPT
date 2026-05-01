# LLM Wiki Schema

## 範圍
本 wiki 為個人知識庫，主題隨時間與趨勢演進，不限定單一領域。
內容語言：繁體中文

## 來源類型
- Markdown 檔案（直接放入 `raw/`）
- PDF 檔案（放入 `raw/`，閱讀後摘要至 wiki）
- 圖片（放入 `raw/assets/`，閱讀後摘要至 wiki）
- URL（透過 https://markdown.new 轉換為 Markdown 後放入 `raw/`）
- 每日自動摘要（GitHub Actions 自動收集，見下方「自動化來源」）

## 自動化來源

GitHub Actions 每天 UTC 14:00（台灣 22:00）執行，收集以下 7 個來源。
- Workflow：`.github/workflows/fetch-daily-sources.yml`
- 本地腳本：`scripts/fetch-*.sh`（手動補擷取用）
- **原則**：腳本只做機械性收集，翻譯與彙整由 LLM 在 ingest 時處理

### 來源清單

| 來源 | 檔名格式 | 腳本 | 月報頁面 |
|------|----------|------|----------|
| Reddit r/todayilearned | `raw/reddit-til-YYYY-MM-DD.md` | `fetch-reddit-til.sh` | `wiki/src-reddit-til-YYYY-MM.md` |
| Reddit r/explainlikeimfive | `raw/reddit-eli5-YYYY-MM-DD.md` | `fetch-reddit-eli5.sh` | `wiki/src-reddit-eli5-YYYY-MM.md` |
| Hacker News Top 15 | `raw/hn-top-YYYY-MM-DD.md` | `fetch-hn.sh` | `wiki/src-hn-YYYY-MM.md` |
| GitHub Trending | `raw/github-trending-YYYY-MM-DD.md` | `fetch-github-trending.sh` | `wiki/src-github-trending-YYYY-MM.md` |
| Product Hunt Top 15 | `raw/producthunt-YYYY-MM-DD.md` | `fetch-producthunt.sh` | `wiki/src-producthunt-YYYY-MM.md` |
| Wikipedia Featured | `raw/wikipedia-featured-YYYY-MM-DD.md` | `fetch-wikipedia.sh` | `wiki/src-wikipedia-YYYY-MM.md` |
| skills.sh Picks | `raw/skills-picks-YYYY-MM-DD.md` | `fetch-skills-picks.sh` | `wiki/src-skills-picks-YYYY-MM.md` |
| skills.sh Trending Top 10 | `raw/skills-trending-YYYY-MM-DD.md` | `fetch-skills-trending.sh` | `wiki/src-skills-trending-YYYY-MM.md` |

### Product Hunt 設定

需要設定 GitHub Secret `PH_TOKEN`（Developer Token）。
取得方式：https://www.producthunt.com/v2/oauth/applications → 建立應用 → Developer Token。
未設定時該步驟自動跳過。

### skills.sh Trending Top 10 彙整指引

skills.sh trending 反映 organic 流行度（按 installs 降序），與 picks（編輯精選，自 04-19 起已停發）形成對比。

每日抓取 Top 10（`raw/skills-trending-YYYY-MM-DD.md`），月報每日表格依以下慣例：

- **新進榜標 ✨**：當日首次進入 Top 10
- **跌出榜外標 ⬇️**：上一日在榜、當日跌出（在月報該日下方備註）
- **獨立頁觸發**：手動決定，不自動建（避免 picks 月報那種「自我強化敘事」假象）
- **異常跳升**：單日 +N rank / +X% installs 異常時重點標註

⚠️ **重要前車之鑑（2026-05-01 教訓）**：[[src-skills-picks-2026-04]] 因 fetcher 靜默 fallback 造成「連十三日精選」虛構。trending 月報務必：
- 先抽查 raw 是否真有日間差異（top 10 名單 + installs）
- 若連續 N 日 raw 完全相同 → 警示，可能 fetcher / skills.sh 端問題
- 推論「N 日連續上榜」「rank 穩定」前必須驗證資料管道正常

### skills.sh Picks 彙整指引

skills.sh 每日精選一個 AI Agent Skill，raw 檔案包含完整的 Skill 定義與 README。
彙整至月報時，每個 skill 必須涵蓋以下三個面向（不是只翻譯摘要）：

1. **製作方式**——這個 skill 是怎麼建的？
   - 分析 YAML frontmatter 的 `metadata`（type、mode、domain、tags）
   - 解讀 skill 的架構設計：是否有 rules/references 子目錄？是否有多步驟 workflow？
   - 標注 skill 使用了哪些 Agent 能力（AskUserQuestion、Tool 呼叫、背景執行等）
   - 標注相容的 Agent 平台（claude-code、codex、gemini-cli 等）

2. **應用場景**——什麼時候該用這個 skill？
   - 從 README 的 "When to Use" 和 description 提取具體觸發條件
   - 舉出 2–3 個實際使用情境（不要只抄 README，要結合開發者日常場景）
   - 標注該 skill 屬於哪個領域（coding、writing、design、security、devops 等）

3. **工作流整合**——怎麼融入我的工作流？
   - 提供安裝指令
   - 分析與現有 wiki 中已知工具的關係（例如與 [[Skill vs Bash vs MCP]] 的關聯）
   - 如果 skill 有 Integration 區塊（inbound/outbound/complementary），摘要其生態系
   - 給出一句話推薦：「適合 X 場景的開發者」或「如果你常做 Y，值得安裝」

### 頁面結構

每個 skill pick 產生**兩處內容**：

1. **獨立解析頁**（`wiki/src-skill-{skill-name}.md`）——完整展開上述三個面向，type 為 `source`
2. **月報索引**（`wiki/src-skills-picks-YYYY-MM.md`）——表格 + 連結至獨立頁

月報表格欄位：`| 日期 | Skill 名稱 | 來源 | 安裝數 | 領域 | 一句話推薦 |`
表格中的 Skill 名稱使用 `[[src-skill-{name}|顯示名]]` wikilink 連結至獨立頁。

### 偵測新來源

執行 `/llm-wiki ingest` 時，用以下方式偵測未處理的來源：

1. **`git status raw/`**——未追蹤（Untracked）或已修改（Modified）的檔案即為新來源
2. **`git diff --name-only origin/main -- raw/`**——與遠端比對，找出 GitHub Actions 推送但本地尚未處理的每日新知
3. 比對各月報 wiki 頁面中已處理的日期，找出遺漏

### 彙整流程（手動 `/llm-wiki ingest`）

1. 用上述方式偵測新來源，列出待處理清單
2. 對未處理的日期逐日進行：
   - **事實查核**（Reddit、社群來源需嚴格查核，見下方「事實查核」）
   - **翻譯**為繁體中文
   - **保留完整原始連結**——每則條目必須包含可追溯的原始資料 URL（原文連結、討論連結、GitHub repo 連結、PH 頁面連結等）
   - **增量追加**至月報檔案
3. 以月為單位維護，每日為一個區塊

## 事實查核

**所有來源在 ingest 時都必須驗證可信度，Reddit 等社群來源尤其嚴格。**

### 查核流程

每則內容必須經過以下檢查：
1. **來源可靠性**：原始連結是否指向可信來源（學術機構、權威媒體、官方文件）？還是只有 Reddit 標題沒有佐證？
2. **主張驗證**：用 LLM 既有知識交叉比對，標題是否誇大、斷章取義、或完全錯誤？
3. **上下文完整性**：是否省略關鍵脈絡導致誤導？

### 標注方式

依來源型態選擇標注粒度：
- **逐條高風險來源**（Reddit、GitHub Trending、社群貼文、未審核 repo）：月報表格加入「查核」欄位。
- **低風險索引型來源**（HN、Product Hunt、Wikipedia featured、skills.sh picks）：可使用「當日觀察／事實查核／資料查核備註」區塊做區塊級查核；若單條內容有誇大、灰色用途或來源問題，仍需在該條或當日備註中標出。
- ✅ — 已驗證，主張與來源一致
- ⚠️ — 部分正確或有誇大，附註說明
- ❌ — 錯誤或嚴重誤導，附註說明並標記刪除線

### 處理規則

- **❌ 的條目不刪除**，保留原文但加刪除線與更正說明——錯誤資訊被辨識出來本身就有價值
- **⚠️ 的條目**在翻譯時主動修正措辭，並加註實際情況
- 查核結果有疑慮時，優先存疑標注，不要放行

## 頁面類型
- **來源摘要**（source）：每個匯入來源一頁
- **實體頁**（entity）：人物、組織、產品、工具、服務
- **概念頁**（concept）：理論、方法、框架、技術
- **綜整頁**（synthesis）：跨來源的分析與整合
- **比較頁**（comparison）：並排比較

## 規則
- `raw/` 中的檔案不可修改，是不可變的真實來源
- 每次操作後更新 `wiki/index.md` 和 `wiki/log.md`
- `wiki/log.md` 是 append-only 稽核紀錄；lint 不要求歷史紀錄中的舊 wikilink 全部可解析，修正應透過追加新 log 說明完成
- 使用 `[[wikilink]]` 格式交叉引用（相容 Obsidian）
- 新資料與舊主張矛盾時，明確標註而非靜默覆蓋
- 每個 wiki 頁面包含 YAML frontmatter（title, type, sources, created, updated, tags）
