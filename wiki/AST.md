---
title: AST（Abstract Syntax Tree，抽象語法樹）
type: concept
sources: []
created: 2026-04-20
updated: 2026-04-20
tags: [ast, compiler, static-analysis, code-search, parser, formal-language]
---

# AST — 抽象語法樹

> 本頁整理自 LLM 一般知識，用以補齊 wiki 中原本只有 [[src-skill-ast-grep]] 實作層、缺乏理論層的結構缺口。來源為空：內容屬程式語言與編譯原理的共識基礎，若後續匯入具體教材（Dragon Book、Crafting Interpreters 等）請追加至 `sources`。

## 一句話定義

**AST 是源碼經 parser 解析後的樹狀表徵**，每個節點代表一個語法構造（表達式、敘述、宣告），捨棄所有不影響語義的細節（空白、註解、冗餘括號、分號）——這就是「抽象」的意思。

```
原始碼：  a + b * c;
    ↓ parse
AST：     BinaryExpr(+)
         ├── Identifier(a)
         └── BinaryExpr(*)
             ├── Identifier(b)
             └── Identifier(c)
```

## AST vs CST（關鍵理論區分）

| 項目 | CST（Concrete Syntax Tree / Parse Tree） | AST |
|------|-----------------------------------------|------|
| 產出者 | Parser 直接產出 | 從 CST 進一步抽象化 |
| 內容 | 保留所有 token（`(` `)` `;` 全在樹上） | 只保留語義相關節點 |
| 對應 | 完全對應文法規則 | 對應程式語言概念 |
| 用途 | syntax highlighting、formatter | 編譯器、型別檢查、重構工具 |

ast-grep 的 `--debug-query=cst/ast/pattern` 三個旗標正好對應這三層抽象（見 [[src-skill-ast-grep]]）。

## 理論基礎

- **形式語言理論（Chomsky hierarchy）**：主流程式語言屬 context-free grammar（第 2 型）
- **Parser 演算法**：LL(k)、LR、LALR、PEG、Earley——決定從字串如何構造樹
- **同一語法可對應多種 AST 設計**：抽象化程度是設計選擇（Babel 的 JS AST ≠ SWC 的 JS AST）

## 節點結構（幾乎所有 AST 共通）

```
Node {
  kind: string            # "FunctionDeclaration", "BinaryExpression", ...
  children: Node[]        # 子節點構成樹
  range: [start, end]     # 原始碼位置，供錯誤訊息與 sourcemap 用
  attrs: { ... }          # 語言特定欄位（型別、值、修飾詞等）
}
```

`kind` 是 ast-grep 匹配的核心概念——這解釋了為什麼該 skill 強調「用 `--debug-query=ast` 找對 `kind` 值」。

## 典型操作

| 操作 | 說明 | 代表工具 |
|------|------|----------|
| **遍歷（Traversal）** | DFS / BFS 走訪整棵樹 | Visitor Pattern |
| **模式匹配** | 比對子樹是否符合某結構 | ast-grep、semgrep、comby |
| **變形（Transform）** | 讀一棵 AST 產出另一棵（或直接改） | Babel plugin、codemod |
| **序列化** | AST → 源碼（pretty-print） | formatter、compiler backend |

## 為什麼工程師要懂（實用意義）

`regex` 處理不了三件事，AST 通通能處理：

1. **嵌套**：例如「沒有 try-catch 包裹的 fetch()」——要知道當前位於哪個函式內
2. **Scope**：例如「這個變數在哪裡宣告」——需要詞法作用域資訊
3. **語意等價**：`a+b` 與 `a + b` 與 `a+\nb` 字面不同、AST 相同

這正是 [[src-skill-ast-grep]] 三大使用情境（跨 repo refactor／CI lint／陌生 codebase 導覽）的**理論根基**。

## 生態工具族譜

```
        ┌── tree-sitter（通用增量 parser 框架，支援多語言）
基礎層 ─┼── Babel / SWC（JS）、LibCST（Python）、Roslyn（.NET）
        └── ANTLR、Yacc/Bison（parser generator）

        ┌── ast-grep、semgrep、comby（結構化搜尋 / lint）
應用層 ─┼── Prettier、ESLint、rustfmt（formatter / linter）
        └── Babel plugins、jscodeshift（codemod）
```

**ast-grep 底層是 tree-sitter**——這是一個工具能支援 Rust、JS、Go、Python 等數十種語言的原因。

## 與 wiki 已有知識的連結

- [[src-skill-ast-grep]]——把 AST 理論轉成 agent 可執行的 5 步工作流（AskUserQuestion → Write → Rule → Test → Scan）
- [[Skill vs Bash vs MCP]]——ast-grep CLI（Bash）→ agent-skill 封裝（Skill）的「高階化」典型
- [[QMD]]——RAG 場景中的「AST 感知分塊」：切程式碼時不按行切、按 AST 節點切，保持函式與 class 不被切碎

## 可延伸的子題（目前 wiki 未覆蓋）

- **tree-sitter 運作原理**——增量解析、錯誤恢復、GLR parser
- **Visitor Pattern 與 AST 轉換**——設計模式經典應用
- **Control Flow Graph（CFG）vs AST**——靜態分析另一層抽象
- **抽象直譯（Abstract Interpretation）**——基於 AST/CFG 的形式化分析
