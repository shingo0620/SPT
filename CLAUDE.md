# LLM Wiki Schema

## 範圍
本 wiki 為個人知識庫，主題隨時間與趨勢演進，不限定單一領域。
內容語言：繁體中文

## 來源類型
- Markdown 檔案（直接放入 `raw/`）
- PDF 檔案（放入 `raw/`，閱讀後摘要至 wiki）
- 圖片（放入 `raw/assets/`，閱讀後摘要至 wiki）
- URL（透過 https://markdown.new 轉換為 Markdown 後放入 `raw/`）
- Reddit 每日摘要（GitHub Actions 自動收集，見下方「自動化來源」）

## 自動化來源

### Reddit r/todayilearned 每日擷取

**收集（自動）**：GitHub Actions 每天 UTC 14:00（台灣 22:00）執行，擷取 Top 15 存入 `raw/reddit-til-YYYY-MM-DD.md`。
- Workflow：`.github/workflows/fetch-reddit-til.yml`
- 本地腳本：`scripts/fetch-reddit-til.sh`（手動補擷取用）

**彙整（手動 `/llm-wiki ingest`）**：
- 讀取尚未處理的 `raw/reddit-til-*.md`
- **事實查核**：逐篇驗證可信度（見下方「事實查核」）
- 逐篇翻譯成繁體中文
- 以月為單位建立或增量更新 `wiki/src-reddit-til-YYYY-MM.md`
- 每日為一個區塊，追加至月報檔案中

**原則**：腳本只做機械性收集，翻譯與彙整由 LLM 在 ingest 時處理。

## 事實查核

**所有來源在 ingest 時都必須驗證可信度，Reddit 等社群來源尤其嚴格。**

### 查核流程

每則內容必須經過以下檢查：
1. **來源可靠性**：原始連結是否指向可信來源（學術機構、權威媒體、官方文件）？還是只有 Reddit 標題沒有佐證？
2. **主張驗證**：用 LLM 既有知識交叉比對，標題是否誇大、斷章取義、或完全錯誤？
3. **上下文完整性**：是否省略關鍵脈絡導致誤導？

### 標注方式

在月報表格中加入「查核」欄位：
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
- 使用 `[[wikilink]]` 格式交叉引用（相容 Obsidian）
- 新資料與舊主張矛盾時，明確標註而非靜默覆蓋
- 每個 wiki 頁面包含 YAML frontmatter（title, type, sources, created, updated, tags）
