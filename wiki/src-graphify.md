---
title: "graphify — codebase 轉 knowledge graph 的 AI coding assistant skill"
type: source
sources: [github-safishamsi-graphify.md, safishamsigraphify.md]
created: 2026-05-11
updated: 2026-05-11
tags: [skill, knowledge-graph, claude-code, codex, graphrag, tree-sitter, llm-wiki]
---

# graphify — codebase 轉 knowledge graph 的 skill

> 來源：[safishamsi/graphify GitHub repo](https://github.com/safishamsi/graphify)
> 截取數據（2026-05-11）：**46,225 stars / 5,015 forks**；created 2026-04-03（約 5 週）；Python / MIT；topics: graphrag, knowledge-graph, leiden, tree-sitter, claude-code, codex, openclaw, antigravity

## 是什麼

在 AI coding assistant 中輸入 `/graphify .`，就把整個專案——code、docs、PDF、images、videos——映射成可查詢的 knowledge graph，取代「grep 翻檔案」。

輸出三個檔案：
- `graph.html`——瀏覽器開，可點 node、filter、search
- `GRAPH_REPORT.md`——重點：key concepts、surprising connections、suggested questions
- `graph.json`——完整 graph，隨時查詢不用重讀檔案

額外 `graphify export callflow-html` 產出含 Mermaid call-flow 圖的架構頁。

## 製作方式

### 架構技術
- **tree-sitter**：解析多語言原始碼
- **GraphRAG**：Microsoft 的 graph-based retrieval 概念
- **Leiden algorithm**：社群偵測（community detection），找出 codebase 的模組叢集
- 多模態：code / SQL schema / R scripts / shell / docs / papers / images / videos 全進同一個 graph

### Skill 設計
- 跨平台 skill：Claude Code / Codex / OpenCode / Cursor / Gemini CLI / GitHub Copilot CLI / VS Code Copilot Chat / Aider / OpenClaw / Factory Droid / Trae / Hermes / Kimi Code / Kiro / Pi / Google Antigravity——**17+ 平台**
- 「always use the graph」模式：寫 config 讓 assistant 在回答 codebase 問題前先讀 `GRAPH_REPORT.md`
- 支援 hooks 的平台（Claude Code / Codex / Gemini CLI）：file-read call 前自動觸發 hook，讓 assistant 用 graph 導航而非 grep
- PyPI 套件：`graphifyy`（double-y；其他 `graphify*` 套件未經官方授權——squatting 警示）

### 商業層
- 作者 Safi Shamsi 出書《The Memory Layer》（Gumroad）
- 公司：graphifylabs.ai
- 28 種語言的 README 翻譯（含繁體中文）

## 應用場景

1. **新人接手大型 codebase**：`/graphify .` → 看 `GRAPH_REPORT.md` 的「surprising connections」與「suggested questions」快速建立 mental model
2. **跨檔案影響分析**：改一個 module 前查 graph 看誰依賴它，比 grep 準
3. **架構文件自動生成**：`graphify export callflow-html` 給 reviewer 看 Mermaid call-flow
4. **AI assistant 長期記憶**：搭配 hook，assistant 每次回答前自動讀 graph，不重複 re-read 整個專案

## 工作流整合

### 安裝
```bash
uv tool install graphifyy && graphify install
# 或 pipx install graphifyy && graphify install
```
平台特定：`graphify install --platform codex` / `graphify cursor install` 等

### 與 wiki 既有概念的關係

⭐ **graphify 是 [[LLM Wiki]] 模式的「自動化 + 程式碼特化」版本**：

| 維度 | [[LLM Wiki]]（Karpathy 模式 / 本專案） | graphify |
|------|----------------------------------|----------|
| 標的 | 任意領域知識（文章、論文、想法） | 程式碼庫 + 相關文件 |
| 結構 | markdown wiki + wikilink | knowledge graph（node + edge）|
| 維護 | LLM 增量編譯，人類引導 | tree-sitter + Leiden 自動建，可重跑 |
| 互動 | `/llm-wiki query` 整合多頁回答 | assistant hook 自動查 graph |
| 持久性 | wiki/ 目錄 + git | `graphify-out/graph.json` |
| 矛盾處理 | 人類標註 | 無（純結構抽取，不做語意衝突判斷）|

→ 兩者是同一個「持久化結構 vs 每次 RAG」哲學的不同實作。Karpathy 在 [[src-karpathy-sequoia-ascent-2026]] 把 [[LLM Wiki]] 稱為「以前不可能、現在自然」——graphify 是這個論點在「codebase 理解」場景的具體產品化。

### 與 skill 生態的關係
- 與 [[src-andrej-karpathy-skills]] / [[src-mattpocock-skills]] / [[src-addyosmani-agent-skills]] / [[src-wshobson-agents]] 同屬「跨平台 coding skill」生態
- 與 [[PluginEval]] 對位：graphify 是高 install 數的「真實 organic 擴散」案例（vs find-skills 的 hype curve）
- 與 [[Skill vs Bash vs MCP]]：graphify 走「skill + hook」而非 MCP server——Armin/Mario 偏好的輕量路線

## 跨 wiki 連動

- **[[LLM Wiki]]**：graphify 是同模式的程式碼特化自動版
- **[[src-LLM Wiki]]**：Karpathy gist 的源頭
- **[[src-karpathy-sequoia-ascent-2026]]**：Karpathy 對「知識結構化 > 每次 RAG」的論述
- **[[Andrej Karpathy]]**：LLM Wiki 模式提出者
- **[[Skill vs Bash vs MCP]]**：graphify 的 skill + hook 路線
- **[[src-skills-trending-2026-05]]** / [[PluginEval]]：install 數信號討論
- **[[src-wshobson-agents]]** / [[src-andrej-karpathy-skills]]：同類 skill 集合

## 觀察與查核

### 數據可信度
- ✅ **46,225 stars / 5,015 forks**——透過 `gh api` 直接取得，可信
- ⚠️ **5 週達 46k stars**——增速異常快；可能有 README 28 國語言翻譯 + 17 平台支援的「廣撒網」效應，也可能有部分 inorganic boost；fork 數異常高（5,015，star/fork ≈ 9.2，偏低，正常 OSS 多在 20-50）值得後續觀察
- ⚠️ **PyPI squatting 警示**：README 明確說「其他 `graphify*` 套件未經授權」——這本身暗示已有人在 squat，安裝時務必用 `graphifyy`

### 待後續觀察
- 46k stars 是否持續成長還是 hype curve（對照 find-skills 教訓）
- graphify 與 [[LLM Wiki]] 模式是否會收斂（wiki 加 graph、graph 加 wiki）
- 「assistant hook 自動查 graph」是否成為 coding assistant 標準模式
- 商業化（《The Memory Layer》書 + graphifylabs.ai）是否成功
