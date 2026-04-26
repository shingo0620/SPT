---
title: "Kevin Lynagh — Sabotaging projects by overthinking, scope creep, and structural diffing"
type: source
sources: [on-sabotaging-projects-by-overthinking-scope-creep-and-structural-diffing.md]
created: 2026-04-26
updated: 2026-04-26
tags: [kevin-lynagh, overthinking, scope-creep, yagni, structural-diff, llm-workflow]
---

# Kevin Lynagh — On sabotaging projects by overthinking, scope creep, and structural diffing

> 來源：[Kevin Lynagh Newsletter 2026-04](https://kevinlynagh.com/newsletter/2026_04_overthinking/)
> 作者：Kevin Lynagh（Clojure / Rust / 自製硬體 / Emacs 圈知名 indie 開發者）
> 對應 [[src-hn-2026-04]] 04-24 #12（46 分）

## 一句話定位

Kevin Lynagh 從個人專案實作經驗出發，提出「**過度思考殺死專案**」三大反模式（overthinking、scope creep、structural diffing 兔子洞），並以 LLM 時代為背景重新闡述 **YAGNI** 與「**scope creep 守恆律**」——程式生成速度的提升必然被多餘功能與繞道路徑抵消。

## 三大主題

### 1. Overthinking 殺死專案

兩種專案路徑：
1. **直接做**：可能修一兩次但結果接近想像、心情愉悅
2. **找 prior art**：發現範圍比想像大很多 → 思考要不要納入 → 要不要建在現有方案上 → 要不要乾脆用熱門工具 → 結果既沒解決原問題也沒享受創作

**關鍵差異**：「**內化自己的成功標準**」(success criteria)。
- 與朋友做木工架子 → 主要成功標準「跟朋友一起做」 → 不過度思考、週末完成
- 研究結構化 diff 工具 → 4 小時繞遠路 → 才回神「我只是想要 Emacs 裡更好的 diff 工作流，自己寫 4 小時就好」

**長期反例**：他的硬體原型介面、Clojure-Rust 融合語言、CAD 程式語言——花百小時研究但從未產出原型。內心懷疑是「對失敗的恐懼」壓抑了「生成傾向」。

### 2. Conservation of Scope Creep（範圍蔓延守恆律）

> **「任何程式速度的提升，必被多餘功能、兔子洞、繞道路徑等量抵消」**

實例：用 LLM 為 Emacs 寫 [Finda](https://keminglabs.com/finda/) 風格的 filesystem fuzzy 路徑搜尋。
- LLM 建議使用 [Nucleo](https://github.com/helix-editor/nucleo) library——好設計、好文件
- **問題**：Nucleo 支援 anchor 功能（`^foo` 只匹配開頭）→ 開始思考路徑搜尋如何詮釋 anchor → 想到 segment 邊界 → 想到 anchor 內部含 `/` 的情況 → 數小時實作 → 寫完才想：
  1. 我從沒想過 Finda 需要 anchor 功能
  2. 路徑搜尋只需在 query 加 `/` 就能達到 anchor 效果

**結論**：把所有 anchor code 丟掉。LLM 加速 → 但被「想到的多餘功能」抵消。

### 3. Structural Diffing（核心動機 + 工具評論）

**動機**：他正在審查越來越多 LLM 生成的程式碼，發現 [difftastic](https://github.com/Wilfred/difftastic/)（基於 treesitter）有時做不好——例如 `PendingClick` 結構未正確匹配對應的 `PendingClickRequest`。

**review 的工具**（值得 wiki 收錄）：

| 工具 | 技術基礎 | 評語 |
|------|---------|------|
| **[semanticdiff.com](https://semanticdiff.com/)** | 自家解析器 + dijkstra-based 配對 | 最 baked、small German company、有 VSCode + GitHub PR web app；放棄 treesitter，因「context-sensitive keywords 是常痛點」 |
| **difftastic** | treesitter | 改善線性 diff，但匹配實體有時失準（且不支援 Python 縮排語意） |
| **[diffsitter](https://github.com/afnanenayet/diffsitter)** | treesitter | 多 GitHub stars 但文件薄、有 MCP server |
| **[gumtree](https://github.com/GumTreeDiff/gumtree)** | 2014 學術源頭 | 需要 Java，不適合 Emacs 工具 |
| **[mergiraf](https://mergiraf.org/)** | treesitter + Gumtree | Rust 寫的 merge driver，架構文件清楚、illustrations 可愛 |
| **[weave](https://github.com/Ataraxy-Labs/weave)** | treesitter merge driver | 「HN-optimized」（flashy landing、stars、MCP）；entity extraction 可看但邏輯太多臆測 |
| **[diffast](https://github.com/codinuum/diffast)** | AST tree edit-distance | 支援 Python/Java/Verilog/Fortran/C++；可導 datalog tuples |
| **[autochrome](https://fazzone.github.io/autochrome.html)** | Clojure-specific 動態規劃 | 視覺化詳細解釋極優 |

**他的最終計劃（最小範圍）**：
1. 用 Rust 寫自己的 treesitter-based entity extraction
2. 簡單 greedy matching
3. 渲染到 command line
4. 完成後再考慮整合 Magit-like Emacs 工作流

## 與本 wiki 的關聯

### LLM 工作流的核心痛點
- **與 [[綜整-AI協作工程的六大趨勢]]**：本文對應「review 是新瓶頸」主軸——LLM 生成快、但 reviewer 看 diff 痛苦
- **與 [[src-Claude Code Session管理]]**：他的工作流「給 agent scoped task → 幾分鐘後審查 → 修改 / 重來 / 自己寫」——是「Subagent + Compact」哲學的個人版實作
- **與 [[src-Code Review已死]]**：本文是 Code Review 已死論點的反例——他堅持「我每次都 in-the-loop 審查」，並動手做工具支撐這個工作流

### 抗 LLM 風格的 indie 哲學
- **與 [[Solo SaaS架構]] / [[levelsio]] / [[antfu]]**：「我可能不會釋出、不收 GitHub stars、自己用就好」的 indie 態度——對抗「每個 OSS 都該規模化」的預設
- **與 [[AI 品質共謀]] / [[Specification by Example]]**：scope creep 守恆律是 AI 加速 + 沒有規格 = 多餘功能的具體案例

### Structural Diff 與 AST
- **與 [[AST]] / [[src-skill-ast-grep]]**：本文涵蓋「AST 在 review 工作流的具體應用」——ast-grep 是「找」、structural diff 是「比較」，兩者互補
- treesitter 的局限性（context-sensitive keywords）是值得記錄的洞察

## 「Conservation of Scope Creep」概念價值

這是本文最具**可推廣**的單句洞察——值得**獨立成概念頁**[[Scope Creep 守恆律]]，與 [[AI 品質共謀]]、[[Specification by Example]] 一起構成「AI 寫 code 的反模式三件套」：

1. **AI 品質共謀**：AI 同時寫 code + 測試的同源誤解
2. **Scope creep 守恆律**：AI 加速被多餘功能抵消
3. **Specification by Example** 解方：先用例子凍結需求，AI 受規格約束

## 相關頁面

- [[src-hn-2026-04]]（04-24 #12 對應討論）
- [[src-Code Review已死]] / [[綜整-AI協作工程的六大趨勢]]（review 工作流主題）
- [[AI 品質共謀]] / [[Specification by Example]]（AI 寫 code 反模式）
- [[Solo SaaS架構]] / [[antfu]] / [[levelsio]]（indie 開發者哲學）
- [[AST]] / [[src-skill-ast-grep]]（structural 工具基礎）
