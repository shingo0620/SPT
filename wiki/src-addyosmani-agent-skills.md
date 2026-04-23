---
title: Addy Osmani's Agent Skills——20 個 Production-Grade AI Coding Agent Skill
type: source
sources: [addyosmani-agent-skills.md]
created: 2026-04-22
updated: 2026-04-22
tags: [AI輔助開發, Claude Code, Skills, 工程實踐, Google, spec-driven]
---

# Addy Osmani's Agent Skills

## 來源資訊

- 作者：Addy Osmani（Google Chrome 團隊 Engineering Lead、《Learning JavaScript Design Patterns》作者）
- 連結：https://github.com/addyosmani/agent-skills
- License：MIT
- 安裝方式：`/plugin marketplace add addyosmani/agent-skills` 或 `/plugin install agent-skills@addy-agent-skills`
- 宣稱定位：把資深工程師的工作流、品質閘門、最佳實踐封裝成 AI coding agent 可遵循的結構化流程

## 摘要

20 個 AI coding agent skill 的產品級工程合集——把「從點子到上線」完整 SDLC 壓縮為 7 個 slash commands（`/spec` `/plan` `/build` `/test` `/review` `/code-simplify` `/ship`）並附帶能自動觸發的 skill router。相較 [[src-mattpocock-skills]] 的 18 個單點 skill 偏重文件工作流（PRD/Issue/Plan），addyosmani/agent-skills 更接近**完整 SDLC 模板化**——每個 skill 都是帶 anti-rationalization 表、verification gate、與「Red Flags」訊號的結構化流程文件。

## SDLC 六階段結構

```
  DEFINE    →    PLAN    →    BUILD    →    VERIFY    →    REVIEW    →    SHIP
 ┌──────┐    ┌──────┐    ┌──────┐    ┌──────┐    ┌──────┐    ┌──────┐
 │ Idea │ ─▶ │ Spec │ ─▶ │ Code │ ─▶ │ Test │ ─▶ │  QA  │ ─▶ │  Go  │
 └──────┘    └──────┘    └──────┘    └──────┘    └──────┘    └──────┘
  /spec       /plan       /build      /test       /review     /ship
```

## 7 個 Slash Command 對應原則

| 任務 | 指令 | 核心原則 |
|------|------|---------|
| Define 要做什麼 | `/spec` | Spec before code |
| Plan 怎麼做 | `/plan` | Small, atomic tasks |
| Build 增量實作 | `/build` | One slice at a time |
| Prove 它能動 | `/test` | Tests are proof |
| Review 準備合併 | `/review` | Improve code health |
| Simplify 簡化代碼 | `/code-simplify` | Clarity over cleverness |
| Ship 上線 | `/ship` | Faster is safer |

**Skill 自動觸發**：除了顯式指令，skill 也依任務自動啟用——設計 API 觸發 `api-and-interface-design`、寫 UI 觸發 `frontend-ui-engineering`——由 agent 的 skill router 根據上下文挑選。

## 20 個 Skill 依階段分類

### Define（釐清要做什麼）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| idea-refine | Divergent/convergent 思考——把模糊概念化為具體提案 | 有粗略構想需要探索 |
| spec-driven-development | 寫 PRD——目標、指令、結構、程式碼風格、測試、邊界 | 新專案、新功能、重大變更 |

### Plan（拆解）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| planning-and-task-breakdown | 把 spec 拆成小顆粒可驗證 task，含接受標準與依賴順序 | 已有 spec 需要實作單位 |

### Build（寫代碼）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| incremental-implementation | 薄垂直切片——實作、測試、驗證、提交；feature flag；安全 default；容易回滾 | 任何碰到多個檔案的變更 |
| test-driven-development | Red-Green-Refactor；Test pyramid（80/15/5）；測試大小；DAMP over DRY；Beyonce Rule；browser testing | 實作邏輯、修 bug、改行為 |
| context-engineering | 在對的時機餵 agent 對的資訊——rules 檔、context packing、MCP 整合 | 開始 session、切換任務、輸出品質下降 |
| source-driven-development | 每個框架決策都以官方文件為依據——驗證、標注來源、標示未驗證處 | 想要有權威來源的程式碼 |
| frontend-ui-engineering | Component 架構、設計系統、狀態管理、響應式設計、WCAG 2.1 AA 無障礙 | 打造或修改使用者介面 |
| api-and-interface-design | Contract-first 設計、Hyrum's Law、One-Version Rule、錯誤語意、邊界驗證 | 設計 API、模組邊界、公開介面 |

### Verify（驗證能動）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| browser-testing-with-devtools | Chrome DevTools MCP——DOM 檢查、console log、網路追蹤、performance profiling | 打造或除錯任何瀏覽器內執行的東西 |
| debugging-and-error-recovery | 五步驟分診：reproduce → localize → reduce → fix → guard；Stop-the-line 原則 | 測試失敗、build 壞、行為不預期 |

### Review（合併前品質閘門）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| code-review-and-quality | 五軸 review；變更大小（~100 行）；嚴重度標籤（Nit/Optional/FYI）；review 速度規範；拆分策略 | 任何變更合併前 |
| code-simplification | Chesterton's Fence；Rule of 500；降低複雜度但保持行為不變 | 代碼會動但難讀 |
| security-and-hardening | OWASP Top 10 防護、auth 模式、secret 管理、依賴稽核、三層邊界系統 | 處理使用者輸入、auth、儲存、外部整合 |
| performance-optimization | 先量再改——Core Web Vitals 目標、profiling workflow、bundle 分析、反模式偵測 | 有效能需求或懷疑 regression |

### Ship（有信心上線）

| Skill | 做什麼 | 使用時機 |
|-------|-------|---------|
| git-workflow-and-versioning | Trunk-based 開發、atomic commit、變更大小（~100 行）、commit-as-save-point | 任何代碼變更（永遠） |
| ci-cd-and-automation | Shift Left、Faster is Safer、feature flag、quality gate pipeline、failure feedback loop | 設定或修改 build/deploy 流程 |
| deprecation-and-migration | Code-as-liability 心態、compulsory vs advisory deprecation、migration 模式、zombie code 清除 | 移除舊系統、遷移使用者、停用功能 |
| documentation-and-adrs | Architecture Decision Records、API docs、inline 文件標準——文件記錄「為什麼」 | 做架構決策、改 API、上線功能 |
| shipping-and-launch | 上線前 checklist、feature flag 生命週期、staged rollout、rollback 流程、監控建置 | 準備上 production |

## 3 個 Specialist Agent Personas

| Agent | 角色 | 視角 |
|-------|------|------|
| code-reviewer | Senior Staff Engineer | 五軸 code review，標準「資深工程師會通過嗎？」 |
| test-engineer | QA 專家 | 測試策略、覆蓋率、Prove-It 模式 |
| security-auditor | Security Engineer | 漏洞偵測、威脅建模、OWASP 評估 |

## 4 個 Reference Checklist（按需載入）

| 檔案 | 涵蓋 |
|-----|------|
| testing-patterns.md | 測試結構、命名、mocking、React/API/E2E 範例、反模式 |
| security-checklist.md | Pre-commit 檢查、auth、輸入驗證、headers、CORS、OWASP Top 10 |
| performance-checklist.md | Core Web Vitals 目標、前後端 checklist、測量指令 |
| accessibility-checklist.md | 鍵盤導覽、螢幕閱讀器、視覺設計、ARIA、測試工具 |

## Skill 結構設計原則

每個 SKILL.md 遵循一致骨架：

```
┌─────────────────────────────────────────────────┐
│  SKILL.md                                       │
│                                                 │
│  ┌─ Frontmatter ─────────────────────────────┐  │
│  │ name: lowercase-hyphen-name               │  │
│  │ description: Guides agents through [task] │  │
│  │              Use when…                    │  │
│  └───────────────────────────────────────────┘  │
│  Overview         → 這個 skill 做什麼           │
│  When to Use      → 觸發條件                    │
│  Process          → 逐步工作流                  │
│  Rationalizations → 常見藉口 + 反駁             │
│  Red Flags        → 哪些訊號代表出錯            │
│  Verification     → 證據需求                    │
└─────────────────────────────────────────────────┘
```

**四個關鍵設計選擇**：
1. **Process, not prose**——skill 是 agent 遵循的工作流，不是給人讀的參考文件；每個 skill 有步驟、checkpoint、exit criteria
2. **Anti-rationalization**——每個 skill 附帶「agent 會如何想逃避這步驟」的常見藉口表（例：「我晚點再加測試」）配帶反駁論點
3. **Verification is non-negotiable**——每個 skill 結尾有證據要求（測試通過、build 成功、runtime 數據）——「看起來對」永遠不夠
4. **Progressive disclosure**——SKILL.md 是入口，reference 只在需要時載入——token 用量最小化

## 與 Google 工程文化的關係

明確引用 Google 的 [Software Engineering at Google](https://abseil.io/resources/swe-book) 與 [engineering practices guide](https://google.github.io/eng-practices/) 中的具體原則：
- **Hyrum's Law**（API 設計）—— 在 `api-and-interface-design` 中被具體化
- **Beyonce Rule**、**Test pyramid**（測試）—— 在 `test-driven-development` 中
- **變更大小規範、review 速度規範**（code review）—— 在 `code-review-and-quality` 中
- **Chesterton's Fence**（簡化）—— 在 `code-simplification` 中
- **Trunk-based development**（git workflow）—— 在 `git-workflow-and-versioning` 中
- **Shift Left、feature flags**（CI/CD）—— 在 `ci-cd-and-automation` 中
- **Code as liability**（deprecation）—— 獨立 skill `deprecation-and-migration`

## 支援平台（Platform Support）

以下平台皆提供 setup guide：

| 平台 | 安裝方式 |
|------|---------|
| **Claude Code**（主推） | `/plugin marketplace add` + `/plugin install` |
| **Cursor** | 複製 SKILL.md 到 `.cursor/rules/` |
| **Gemini CLI** | `gemini skills install` |
| **Windsurf** | 加到 Windsurf rules 設定 |
| **OpenCode** | Agent-driven skill 透過 AGENTS.md + skill tool |
| **GitHub Copilot** | `agents/` 作 personas + `.github/copilot-instructions.md` |
| **Kiro IDE/CLI** | `.kiro/skills/` 專案或全域層級 |
| **Codex / 其他** | Plain Markdown，支援 system prompt 的 agent 皆可 |

**跨 8 個主流平台**——反映 2026 年「skill 作為跨 agent 可攜層」的生態成熟度（同 2026-04-22 [[src-github-trending-2026-04]] #4、#11、#14 跨 agent skill 移植的趨勢）。

## 對比與關聯

### 與 [[src-mattpocock-skills]]（Matt Pocock 的 18 skills）

| 面向 | addyosmani/agent-skills | mattpocock/skills |
|------|------------------------|-------------------|
| 數量 | 20 個 | 18 個 |
| 覆蓋範圍 | **完整 SDLC 6 階段** | 文件工作流（PRD / Issue / Plan） |
| 設計風格 | 完整 skill 結構（Overview/When/Process/Rationalizations/Red Flags/Verification） | 單點 skill，流程較簡 |
| Command 抽象 | 7 個 slash command 封裝整個 SDLC | 3 個核心 skill 強調單點 |
| 平台支援 | 8 個平台（Claude Code / Cursor / Gemini / Windsurf / OpenCode / Copilot / Kiro / Codex） | 以 Claude Code 為主 |
| 工程文化根基 | Google 工程原則（Hyrum's Law、Beyonce Rule、trunk-based） | TypeScript + 軟體設計原則 |

**互補關係**：Pocock 是「文件工作流的楷模」、Osmani 是「完整 SDLC 的工程模板」。兩者可同時安裝，視任務階段切換使用。

### 與 [[src-Harness Engineering]]

Osmani 的 SKILL.md 結構（Overview → Process → Verification）是 [[src-Harness Engineering|Harness Engineering]] 中「能力邊界 + 工作流程」原則的具體化——把工程文化封裝為可被 agent 執行的工作流，而非僅放在文件中。

### 與 [[Skill vs Bash vs MCP]]

20 個 skill 全屬於 **Skill 層**（教 agent 何時用、怎麼做），而非工具層（Bash/CLI）或資料層（MCP）——是 Skill 層在 2026 年發展最成熟的代表作品。

### 與 [[src-AI輔助工作流程]]（Matteo Barbero）

Barbero 的 7 步驟方法論可對應到 Osmani 的 skill 分類：
- Barbero 的「規劃文件 + 雙重 review」≈ Osmani 的 `spec-driven-development` + `code-review-and-quality`
- Barbero 的「人機分工」≈ Osmani 的 `context-engineering` + anti-rationalization 表
- Osmani 補足 Barbero 未展開的「測試、安全、效能、ship 流程」四個面向

### 與 [[src-Code Review已死]]

Osmani 把「code review 轉向 spec-first + swiss-cheese 信任模型」這個理論落實為可執行的 `code-review-and-quality` 與 `spec-driven-development` 雙 skill，與 [[src-Code Review已死]] 主張的「五層信任模型」形成互補：Osmani 提供單一工程師層級的操作細節，[[src-Code Review已死]] 提供組織層級的流程設計。

## 一句話推薦

> **如果你在 Claude Code 上做完整軟體專案，Osmani 的 `/spec` `/plan` `/build` `/test` `/review` `/ship` 六步驟比任何單點 skill 都更完整——把 Google 工程文化濃縮成可被 AI 執行的 SDLC 模板。**

定位清楚——**Claude Code 生態下 2026 年「完整 SDLC skill pack」的事實標準**。

## 相關頁面

- [[src-mattpocock-skills]]（Matt Pocock 的 18 skills，文件工作流角度）
- [[src-Harness Engineering]]（能力邊界 + 工作流程的理論基礎）
- [[src-AI輔助工作流程]]（Matteo Barbero 的 7 步驟方法論）
- [[src-Code Review已死]]（Spec-driven + Swiss-cheese 信任模型）
- [[src-AI-Agent避坑指南]]（三次 Agent 架構演進）
- [[src-Claude Code五個底層概念]]（概率、窗口、模型、循環、層級）
- [[Skill vs Bash vs MCP]]（LLM Agent 三種工具模式）
- [[AI 輔助軟體工程]]（整合性概念）
- [[Claude Code]]（平台本體）
- [[skills.sh]]（對照：策展平台 vs 單一作者的完整 pack）
