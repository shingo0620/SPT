# LLM Wiki Schema

## 範圍
本 wiki 為個人知識庫，主題隨時間與趨勢演進，不限定單一領域。
內容語言：繁體中文

## 來源類型
- Markdown 檔案（直接放入 `raw/`）
- PDF 檔案（放入 `raw/`，閱讀後摘要至 wiki）
- 圖片（放入 `raw/assets/`，閱讀後摘要至 wiki）
- URL（透過 https://markdown.new 轉換為 Markdown 後放入 `raw/`）

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
