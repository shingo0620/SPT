---
title: "src-wshobson-agents — Claude Code Plugins Marketplace（80 plugins / 185 agents / 153 skills）"
type: source
sources: [github-wshobsonagents-intelligent-automation-and-multi-agent-orchestration-for-claude-code-github.md]
source_url: https://github.com/wshobson/agents
created: 2026-05-07
updated: 2026-05-07
tags: [agent-skill, claude-code, plugin-marketplace, multi-agent, orchestration, model-tier-strategy]
---

# wshobson/agents — Claude Code Plugins Marketplace

> **Repo**：https://github.com/wshobson/agents
> **作者**：Seth Hobson（個人帳號，sethhobson.com）
> **License**：MIT
> **規模**：**34,923 stars / 3,799 forks / 314 watchers**（2026-05-07 截取）
> **創建**：2025-07-24（~10 個月）
> **最近推送**：2026-05-02（5 天前）
> **適配模型**：Opus 4.7 / Sonnet 4.6 / Haiku 4.5（與 [[Claude Code]] 最新模型同步）

## 一句話摘要

**已知最大的單一作者 Claude Code skill / plugin 集合**——80 plugins / 185 agents / 153 skills / 16 multi-agent workflows / 100 commands，採 plugin marketplace 架構與 progressive disclosure，並自帶 PluginEval 品質評估框架。

## 核心數據

### 規模與構成

| 項目 | 數量 | 說明 |
|------|------|------|
| Plugins | **80** | 單一目的、最小 token 化（平均 3.6 個 components／plugin，符合 [[Anthropic]] 2-8 模式） |
| Agents | **185** | 涵蓋 architecture / language / infra / quality / data-AI / docs / business / SEO 8 大類 |
| Skills | **153** | 跨 40 個 plugins，progressive disclosure 載入 |
| Workflow Orchestrators | **16** | 多 agent 協作（full-stack development / security hardening / ML pipelines / incident response） |
| Commands | **100** | scaffolding / security scanning / test automation / infra setup |
| Categories | 25 | 每類 1-10 plugins |

### Star/Fork/Activity 健康度（套用 [[OSS Investment Scorecard]]）

| 維度 | 數據 | 評分 |
|------|------|------|
| **Star 健康（R-1）** | 34,923 stars / 10 個月 ≈ 月均 +3,500 | ⭐⭐⭐⭐⭐ 異常高擴散；CC 生態成長期 + 內容質量雙重驅動 |
| **Fork rate** | 3,799 / 34,923 = 10.9% | 高（一般 5-7%），暗示使用者實際 customize/fork 出去用 |
| **Watchers** | 314 = stars 0.9% | 標準（0.5-1%） |
| **Open issues** | 8（35k stars 級別） | 極低（< 0.05%）= 未積壓 |
| **Commit 集中度（R-2）** | wshobson 258 vs 第二名 9 = **28×** | ⚠️ Bus factor = 1，個人專案模式 |
| **維護活力** | 5 天前推送，模型版本即時更新 | ⭐⭐⭐⭐ 活躍 |
| **License** | MIT | ⭐⭐⭐⭐⭐ 最寬鬆 |

> **Bus factor = 1 註記**：與 [[src-andrej-karpathy-skills]]（forrestchang 個人）、[[src-mattpocock-skills]] 同模式。30 個 contributors 但前 10 名都僅 4-9 commits，wshobson 占 ~85%。**這在 skill 集合領域是常態**——重要的是「知名作者持續維護」而非「分散式社群」，但需注意若作者離開即可能停滯。

## 三大架構特徵

### 1. Plugin Marketplace + Progressive Disclosure

```bash
/plugin marketplace add wshobson/agents     # 加入整個 marketplace（不載入任何 agent）
/plugin install python-development          # 只載這個 plugin（3 agents + 1 cmd + 16 skills，~1000 tokens）
```

對比 [[src-mattpocock-skills]] / [[src-addyosmani-agent-skills]] 的扁平 skill 集合：**wshobson 把 80 個 plugins 設計成可獨立安裝**，每個 plugin 自己帶 agent + command + skill，不污染 context。

> **Skill 三層 progressive disclosure**：
> 1. **Metadata**（name + activation criteria）— 永遠載入
> 2. **Instructions**（核心指引）— 啟用時載入
> 3. **Resources**（範例與模板）— 按需載入

### 2. Three-Tier Model Strategy

| Tier | 模型 | 數量 | 用途 |
|------|------|------|------|
| **Tier 1** | Opus 4.7 | 42 agents | Critical：架構、安全、所有 code review、production coding（語言專家） |
| **Tier 2** | `inherit` | 42 agents | 由用戶 session 預設模型決定（AI/ML、backend、frontend、specialized） |
| **Tier 3** | Sonnet 4.6 | 51 agents | Support with intelligence（docs、testing、debugging、network、API docs、DX、legacy、payments） |
| **Tier 4** | Haiku 4.5 | 18 agents | Fast operational（SEO、deployment、simple docs、sales、content、search） |

**Why Opus 4.7 for Critical Agents**：
- 80.8% on SWE-bench
- 65% fewer tokens for complex tasks（cost 反而較低）

**成本參考**（每百萬 tokens input/output）：
- Opus 4.7：$5/$25
- Sonnet 4.6：$3/$15
- Haiku 4.5：$1/$5

> **編排模式**：`Opus（架構） → Sonnet（開發） → Haiku（部署）`——這個分層思維**直接呼應 [[src-Claude Code五個底層概念]] 的「模型」概念**，並把 [[src-codeburn]] 的 token 觀測思想反過來用於 model selection。

### 3. PluginEval — 自帶品質評估框架

最值得關注的 meta-tooling：詳見 [[PluginEval]] 概念頁。

簡言之：
- 三層評估：**Static analysis（即時）+ LLM judge（語意）+ Monte Carlo simulation（統計）**
- 10 維度評分：triggering accuracy / orchestration fitness / output quality / scope calibration / progressive disclosure / token efficiency / robustness / structural completeness / code template quality / ecosystem coherence
- 品質標章：Platinum (★★★★★) / Gold / Silver / Bronze
- Anti-pattern 偵測：OVER_CONSTRAINED / EMPTY_DESCRIPTION / MISSING_TRIGGER / BLOATED_SKILL / ORPHAN_REFERENCE / DEAD_CROSS_REF
- 統計嚴謹度：**Wilson CI / Bootstrap CI / Clopper-Pearson exact CI / Elo ranking**
- 雙介面：CLI（`uv run plugin-eval score/certify/compare`）+ Claude Code commands（`/eval`、`/certify`、`/compare`）

> 這是 wiki 中第一個 skill **自我評估的科學化框架**。對比 [[skills.sh]] 的 organic install 數信號（[[src-skills-trending-2026-05]] 觀察）+ [[OSS Investment Scorecard]] 的 OSS 投資評分——wshobson 等於把這套思維**內建到 skill 本身**。

## 25 類 80 plugins 分布

| 類別 | 數量 | 代表 plugins |
|------|------|------|
| 🎨 Development | 6 | debugging / backend / frontend / multi-platform |
| 📚 Documentation | 4 | code docs / API specs / diagrams / C4 / **HADS**（Human-AI Document Standard）|
| 🔄 Workflows | 5 | git / full-stack / TDD / **Conductor**（context-driven dev）/ **Agent Teams** |
| ✅ Testing | 2 | unit testing / **qa-orchestra**（multi-agent QA + Chrome MCP） |
| 🔍 Quality | 3 | comprehensive review / performance |
| 🤖 AI & ML | 4 | LLM apps / agent orchestration / context / MLOps |
| 📊 Data | 2 | data engineering / data validation |
| 🗄️ Database | 2 | database design / migrations |
| 🚨 Operations | 4 | incident response / diagnostics / distributed debugging / observability |
| ⚡ Performance | 2 | application performance / database/cloud optimization |
| ☁️ Infrastructure | 5 | deployment / validation / Kubernetes / cloud / CI/CD |
| 🔒 Security | 6 | scanning / compliance / backend-API / frontend-mobile / **block-no-verify**（git hook bypass guard） |
| 🛡️ Governance | 1 | **protect-mcp**（Cedar policy + Ed25519 signed receipts） |
| 💻 Languages | 10 | Python / JS-TS / systems / JVM / scripting / functional / embedded |
| 🔗 Blockchain | 1 | smart contracts / DeFi / Web3 |
| 💰 Finance | 1 | quant trading / risk management |
| 💳 Payments | 1 | Stripe / PayPal / billing |
| 🎮 Gaming | 1 | Unity / Minecraft plugins |
| 🎨 Creative | 1 | creative tooling |
| ♿ Accessibility | 1 | WCAG / a11y |
| 📢 Marketing | 4 | SEO content / technical SEO / SEO analysis / content marketing |
| 💼 Business | 4 | analytics / HR-legal / customer-sales |
| 🔌 API | 2 | API tooling |
| 🛠️ Utilities | 4 | general-purpose helpers |
| 🔧 Modernization | 2 | legacy migration / refactoring |

## 兩個值得關注的特色 plugins

### Agent Teams Plugin（多 agent 平行）

- 7 個 team presets：`review` / `debug` / `feature` / `fullstack` / `research` / `security` / `migration`
- 平行 code review：`/team-review src/ --reviewers security,performance,architecture`
- 假設驅動 debug：`/team-debug "API returns 500" --hypotheses 3`
- 平行 feature 開發：`/team-feature "Add OAuth2 auth" --plan-first`
- 4 agents + 7 commands + 6 skills

> **對應 wiki 既有概念**：[[src-Code Review已死]] 的「Swiss-cheese 五層信任」直接落地為 7 個 reviewer 角色；[[src-bug-hunter]] 的 adversarial multi-agent 設計同源；[[src-agent-model-body-harness]] 的「harness 層」實作。

### Conductor Plugin（context-driven development）

- `Context → Spec & Plan → Implement` 結構工作流
- 互動式 setup：`/conductor:setup` 建立 product vision、tech stack、workflow rules、style guides
- Track-based 開發：`/conductor:new-track` 產生 spec + 階段 plan
- TDD：`/conductor:implement` 帶 verification checkpoints
- Semantic revert：`/conductor:revert` 按邏輯單元（track / phase / task）撤銷
- State persistence：跨 session 恢復

> **對應 wiki 既有概念**：[[src-mattpocock-skills]] 的 PRD/Issue/Plan 模板進化版（多了 state persistence + semantic revert）；[[Specification by Example]] + [[src-AI輔助工作流程]] 的 7 步驟工作流融合。

## 與 wiki 既有 skill 集合的比較

| Skill 集合 | Stars | 規模 | 哲學 | 適用 |
|-----------|-------|------|------|------|
| [[src-andrej-karpathy-skills]]（forrestchang） | 103k | 1 個 CLAUDE.md | 4 條原則簡潔派 | 個人開發者，快速採用 |
| **wshobson/agents** | **35k** | **80 plugins / 153 skills** | **企業級組合** | **團隊統一、特定 vertical 深度需求** |
| [[src-addyosmani-agent-skills]] | 未知 | 20 skills（SDLC 6 階段） | SDLC 流程派 | DevOps/SDLC 對齊 |
| [[src-mattpocock-skills]] | 未知（< 10k） | < 10 skills | PRD/Issue 教育模板 | TS 教育者社群 |
| [[src-bug-hunter]] | 未知 | 1 個 multi-agent skill | adversarial 多角色 | 安全敏感 codebase |

> **Star 數背後的對比**：[[src-andrej-karpathy-skills]] 103k 是「**單檔哲學的傳染力**」，wshobson 35k 是「**體積與深度的吸引力**」——前者輕量擴散、後者重度團隊採用。完全不同的 GTM。

## 與 [[skills.sh]] 生態關係

**wshobson/agents 沒有出現在 [[src-skills-trending-2026-05]] Top 10**——這是一個重要觀察：
- 35k GitHub stars vs [[skills.sh]] trending 第 6 名 find-skills 18k installs（5/6）
- **可能原因**：
  - 直接在 GitHub 消費（`/plugin marketplace add wshobson/agents`），不走 skills.sh 安裝路徑
  - skills.sh trending 統計 **install** 數，GitHub stars 統計 **興趣** 數——兩個信號維度不同
  - wshobson 的 plugin marketplace 模式繞過 skills.sh 平台（marketplace.json + Claude Code 內建 `/plugin` 指令）
- **意義**：對 [[skills.sh]] 是長期威脅信號——主流 skill 集合可能改走「自家 marketplace」而非依賴中央 hub

## 安裝建議

### ✅ 適合的場景

- **團隊統一採用**：80 plugins 涵蓋 25 類別，作為團隊 baseline
- **特定 vertical**：例如 Python 開發者直接 `/plugin install python-development` 拿到 16 個 Python skill
- **學習 plugin 設計範式**：作為高品質範本研究
- **PluginEval 框架借鑑**：把 [[OSS Investment Scorecard]] 思維複用到 skill 評估

### ⚠️ 不一定適合

- **個人 1-2 個 skill 場景**：[[src-andrej-karpathy-skills]] 4 條原則或 [[src-mattpocock-skills]] PRD 模板更輕量
- **想要極簡 skill**：wshobson 是「全部都要」路線，與 minimalism 派衝突
- **不在 [[Claude Code]] 生態**：純綁定 CC 的 plugin/marketplace 機制，[[OpenAI]] Codex CLI 等其他 harness 用不上

### 安裝指令

```bash
# Step 1: 加入 marketplace（不載入任何 agent）
/plugin marketplace add wshobson/agents

# Step 2: 列出可用 plugins
/plugin

# Step 3: 安裝特定 plugin
/plugin install python-development          # Python 16 skills
/plugin install kubernetes-operations       # K8s 4 skills
/plugin install comprehensive-review        # multi-perspective code analysis
/plugin install agent-teams@claude-code-workflows  # 平行 agent teams
/plugin install conductor@claude-code-workflows    # context-driven development
/plugin install plugin-eval@claude-code-workflows  # PluginEval 框架
```

## 強項與顧慮

### 強項

1. **規模權威性**——35k stars + 153 skills + 185 agents 在 CC 生態中無可匹敵
2. **架構成熟**——plugin marketplace + progressive disclosure 是當前最先進設計
3. **模型版本即時跟進**——5/2 已適配 Opus 4.7（5 天前模型發布）
4. **PluginEval 框架**——meta-tooling 等級，從「寫 skill」進到「評估 skill 品質」
5. **MIT license**——可直接 fork/customize

### 顧慮

1. **Bus factor = 1**——wshobson 占 85% commits，若停止維護則停滯
2. **規模 vs 品質**——153 skills 難以全部驗證；可能存在「廣度勝過深度」問題（諷刺地，這也是 PluginEval 要解的問題）
3. **成本透明度**——README 列了模型 cost，但沒提 80 plugins 全裝後的實際 token 消耗實測
4. **CC 鎖定**——架構深度綁定 [[Claude Code]] 的 `/plugin` 機制，跨 harness（Codex CLI / Cursor 等）需移植

## 不確定 / 待查項目

- ⚠️ **35k stars 健康度未驗證**——是否包含 star bot / 異常衝榜？需查 stargazers timeline + GitHub Star Health（[[src-multica-devv-ai盡調]] OSS Investment Scorecard R-1）
- ⚠️ Seth Hobson（wshobson）背景未查（職業、其他項目、商業關係）；待累積 2+ source 後建獨立 entity 頁
- ⚠️ PluginEval 框架的實際使用案例與評分準確度——需實測 1-2 個 skill 才能判斷
- ⚠️ 153 skills 中是否有大量「ghost skill」（裝了但實際未啟用）？PluginEval 的 BLOATED_SKILL anti-pattern 提示這是已知議題

## 後續探索建議

1. **深度看 PluginEval 文件**——`docs/plugin-eval.md` 與 `plugins/plugin-eval/` 完整邏輯
2. **試裝 1-2 個 plugin 實測**——`python-development` 或 `comprehensive-review` 驗證 token 開銷與啟用體驗
3. **跑 PluginEval 評估自家 skill**——把 wiki 已建 [[src-skill-ast-grep]] / [[src-skill-character-arc]] / [[src-skill-3b1b-style-animation-skill]] / [[src-skill-guizang-ppt]] / [[src-bug-hunter]] 跑分對照
4. **追蹤是否上 [[src-skills-trending-2026-05]] Top 10**——若主流改走 GitHub marketplace 直連，這代表 [[skills.sh]] 中央 hub 模式式微
