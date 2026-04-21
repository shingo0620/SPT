---
title: "Skill — ast-grep"
type: source
sources: [skills-picks-2026-04-18.md, skills-picks-2026-04-19.md, skills-picks-2026-04-20.md]
created: 2026-04-18
updated: 2026-04-20
tags: [skills-sh, agent-skill, ast-grep, code-search, refactoring, linting]
---

# Skill — ast-grep（AST 結構化代碼搜尋）

> skills.sh Pick of the Day — 2026-04-18（連續 04-19、04-20 再度精選，連三日——本月與歷來首見）
> 原 repo：[ast-grep/agent-skill](https://github.com/ast-grep/agent-skill)
> skills.sh 頁面：https://skills.sh/ast-grep/agent-skill/ast-grep
> 安裝數：**2,941（04-18）→ 2,972（04-19）→ 3,023（04-20）**，48 小時累積 +82，第二日漲幅（+51）較第一日（+31）加速；為 skills-picks 月報中最高者，遠超過 character-arc 的 248 與 3b1b-skill 的 1
> 作者：ast-grep 官方（非社群 fork）
> 授權資訊：skill frontmatter 未明示 license

## 一句話定位

把**自然語言的代碼搜尋需求**翻譯成 ast-grep 規則的 Skill——不是教你 AST 理論，而是教 agent 如何用 AST 匹配器找到你要的東西，然後自我驗證。

---

## 1. 製作方式（這個 skill 是怎麼建的？）

### 精簡的 frontmatter

```yaml
---
name: ast-grep
description: Guide for writing ast-grep rules to perform structural code search and analysis. Use when users need to search codebases using Abstract Syntax Tree (AST) patterns, find specific code structures, or perform complex code queries that go beyond simple text search.
---
```

- **沒有 `metadata` 區塊**（無 author / version / mode / tags）——這是官方 repo 的極簡風格，與 [[src-skill-character-arc]] 的豐富 metadata、[[src-skill-3b1b-style-animation-skill]] 的自訂 metadata 形成對比
- **description 採「雙觸發語句」**：先描述 skill 能幹嘛，後段以 `Use when users...` 列舉三個觸發條件，把 skill 搜尋的相關性拉高
- 這種 description 風格非常適合被 agent 的 skill router（自動挑選 skill）精準匹配

### 檔案結構

```
ast-grep/
├── SKILL.md              # 主指令 + 完整 workflow
└── references/
    └── rule_reference.md # AST 規則語法的完整參考
```

- **references/ 子目錄**：存放詳細語法文件，主 SKILL.md 只放工作流程與常見用例
- **按需載入**：主文件明確指示「Load these references when detailed rule syntax information is needed」——典型 agent skill 分層記憶設計
- 對比 [[src-skill-3b1b-style-animation-skill]] 用 `templates/` + `references/` + `examples/` 三層分類，ast-grep 只用一層 references

### 五步驟工作流（Workflow）

SKILL.md 教 agent 走完整五步流程，每步都可驗證：

| 步驟 | 做什麼 | Agent 用的能力 |
|------|-------|---------------|
| 1. Understand the Query | 釐清使用者要找的 pattern、語言、邊界條件 | AskUserQuestion（必要時） |
| 2. Create Example Code | 寫一小段範例代碼存到臨時檔（驗證用） | Write 工具 |
| 3. Write the ast-grep Rule | 從簡單到複雜寫 YAML rule | 純 reasoning |
| 4. Test the Rule | 用 `ast-grep scan --inline-rules` 或 rule file 驗證 | Bash tool（CLI 呼叫） |
| 5. Search the Codebase | 確認 rule 匹配範例後跑完整 codebase | Bash tool |

**Debug 指令深度整合**：教 agent 使用 `--debug-query=cst`（Concrete Syntax Tree）、`=ast`（AST）、`=pattern` 三種 dump 格式看出 parser 到底怎麼理解代碼，找出 `kind` 值與 metavariable 問題。

### 明確的寫規則原則

SKILL.md 內含幾條可重複套用的規則：

1. **Always use `stopBy: end`**：relational rules（`inside` / `has`）若不加，子樹走一半就停
2. **Start simple, then add complexity**：`pattern` → `kind` → relational → composite
3. **正確 rule type**：Pattern 給簡單字面匹配、Kind + Relational 給複雜結構、Composite 給邏輯組合
4. **Escaping in inline rules**：shell 會把 `$` 解釋成變數，要用 `\$VAR` 或單引號

這些原則讓 agent 在寫規則時不是從零摸索，而是有收斂路徑。

### 相容平台

- 從格式與工具使用推斷：**claude-code 優先**（Bash + Write + reference 載入皆為 Claude Code 原生能力）
- 其他支援 agent skills 的平台（OpenCode、codex、gemini-cli）理論上可用，但未明示

---

## 2. 應用場景（什麼時候該用這個 skill？）

### 三個「Use When」觸發條件（skill README 原文）

1. **結構化搜尋**：例如「找所有沒有錯誤處理的 async functions」——regex 做不到，需要 AST
2. **定位語言結構**：例如「找所有帶特定參數的函式呼叫」
3. **超越文字搜尋的查詢**：例如「找所有只有 getter 沒有 setter 的 class」

### 實際使用情境

- **場景 A：跨專案 refactor**
  「把我們所有 repo 裡用 `fetch()` 但沒有 try-catch 包的地方都找出來」——這種請求用 grep 會漏掉很多情境，ast-grep 可以精準匹配「函式包含 fetch 呼叫且不包含 try 結構」

- **場景 B：Linting 自家專案規則**
  「我們團隊規定 React component 不能在 useEffect 裡直接 fetch，要走 custom hook」——ast-grep 寫一條 rule 可以變成 CI 檢查

- **場景 C：理解陌生 codebase**
  「找出這個 Go 專案所有的 goroutine 起動點，並標記有沒有 context 傳入」——寫 rule 一次，給整個專案地圖

### 領域定位

**devops / coding / code-quality**——屬於日常開發工具類 skill，不是特定任務 skill。README 自稱「a daily driver for anyone who touches code」。

---

## 3. 工作流整合（怎麼融入我的工作流？）

### 安裝指令

```bash
npx skills add https://github.com/ast-grep/agent-skill --skill ast-grep
```

### 與既有 wiki 工具知識的關係

**與 [[Skill vs Bash vs MCP]]**：
- ast-grep 本體是 CLI 工具（Bash 類）
- agent-skill 封裝把它提升為 Skill 類——**告訴 agent「何時」用這個 CLI、「怎麼」逐步寫 rule**
- 這是 Skill 把 Bash 工具「高階化」的典型範例：原本需要開發者自己記 AST 語法，現在 agent 讀 skill 就能處理

**與 [[src-Claude Code Session管理]]**：
- 在處理大 codebase 搜尋時，建議用 subagent 跑——tool output（可能數百個 match）不需要回到主 context，只要結論
- 呼應文章「tool output 還會用嗎」的心智測試

**與 [[src-Harness Engineering]]**：
- 典型的「能力邊界 + 工作流程」設計：AST CLI 是能力邊界、五步驟 workflow 是工作流程
- 對比只講 AST 理論的文件，這 skill 實踐 Harness 原則——把「可執行的步驟」放在第一位

### 生態系（README Integration 區塊對照）

ast-grep 作為 skill 是**工具型 skill**，與其他 skill 的常見組合：
- 上游 inbound：從 code-review skill 或 refactoring skill 被調用
- 下游 outbound：無明顯依賴（直接呼叫系統 ast-grep CLI）
- 互補 complementary：與 tree-sitter、semgrep、comby 等結構化搜尋工具系列互斥（通常擇一）

### 一句話推薦

> **如果你日常需要在大型 codebase 做結構化搜尋或 refactor，ast-grep 的 CLI 本來就值得裝——這個 skill 額外把「何時用、怎麼寫 rule」教給 agent，讓你只要說自然語言需求即可。**

2,941 安裝數（skills-picks 月報上最高）反映它的日常可用性——不是給特定領域的尖端玩具，是日常工具。

---

## 近期其他精選（raw 內附表格）

| 日期 | Skill | 安裝數 | 簡介 |
|------|-------|--------|------|
| 2026-04-17 | [[src-skill-3b1b-style-animation-skill\|3b1b-style-animation-skill]] | 1 | Manim 數學動畫（3Blue1Brown 風格） |
| 2026-04-16 | [[src-skill-character-arc\|character-arc]] | 273 | 角色弧線設計診斷 |
| 2026-04-15 | alphafold | 24 | AlphaFold 蛋白質結構預測 |
| 2026-04-14 | audit-prep-assistant | 1,779 | Trail of Bits 審計準備（安全領域） |
| 2026-04-13 | coding-agent | 1,211 | Peter Steinberger 的完整 coding agent |

> 觀察：ast-grep 單日 2,941 裝、audit-prep-assistant 1,779、coding-agent 1,211——都是**通用開發工具**類 skill，明顯高於領域專業類（character-arc 273、3b1b 1、alphafold 24）。Agent skill 生態呈現「工具型 >> 領域型」的分佈。

---

## 相關頁面

- [[AST]]（理論層：抽象語法樹的定義、CST 對比、Parser 理論、生態工具族譜——本 skill 的知識根基）
- [[src-skills-picks-2026-04]]（本月 skills-picks 月報索引）
- [[src-skill-character-arc]]（前一日精選，metadata 豐富的對比範例）
- [[src-skill-3b1b-style-animation-skill]]（04-17 精選，三層子目錄結構對比）
- [[Skill vs Bash vs MCP]]（CLI → Skill 的封裝關係範例）
- [[src-Claude Code Session管理]]（大 codebase 搜尋時建議走 subagent）
