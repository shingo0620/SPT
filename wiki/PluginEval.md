---
title: PluginEval
type: concept
sources: [github-wshobsonagents-intelligent-automation-and-multi-agent-orchestration-for-claude-code-github.md]
created: 2026-05-07
updated: 2026-05-07
tags: [skill-quality, evaluation-framework, agent-skill, statistical-rigor, meta-tooling]
---

# PluginEval

> **來源**：[[src-wshobson-agents]] 內建的 plugin/skill 品質評估框架（NEW，2026-05 推出）
>
> Claude Code skill 領域**第一個科學化品質評估框架**——三層評估 × 10 維度 × 統計嚴謹度，把 skill 設計從「主觀手感」推進到「可量化、可比較、可認證」。

## 設計動機

當 [[src-wshobson-agents]] 規模到達 153 skills × 185 agents 時，**「全部都要」遇到內生品質保證難題**：哪些 skill 真的好用？哪些是 ghost / bloated / over-constrained？人類無法逐一手檢。

PluginEval 的解法：**把 skill 視為產品，用統計學方法評估**。

## 三層評估架構

| 層 | 方法 | 速度 | 適用 |
|---|------|------|------|
| **Layer 1：Static analysis** | 語法/結構檢查 | 即時 | CI gate、PR 預檢 |
| **Layer 2：LLM judge** | 語意評估（LLM as judge） | 中 | Standard certification |
| **Layer 3：Monte Carlo simulation** | 統計重複實驗 | 慢 | Full certification + Elo ranking |

CLI 介面：

```bash
# Quick：僅 static，即時
uv run plugin-eval score path/to/skill --depth quick

# Standard：static + LLM judge
uv run plugin-eval score path/to/skill --depth standard

# Full：所有層 + Elo
uv run plugin-eval certify path/to/skill
```

## 10 個評估維度

| 維度 | 含義 | 對應 wiki 既有概念 |
|------|------|------|
| **Triggering accuracy** | skill 是否在正確情境啟用 | [[Skill vs Bash vs MCP]] 啟用判定 |
| **Orchestration fitness** | 是否能與其他 skill / agent 組合 | [[src-agent-model-body-harness]] harness 層協作 |
| **Output quality** | 產出結果是否高品質 | [[AI 品質共謀]] 的反命題 |
| **Scope calibration** | 範圍設定是否合適（不過寬不過窄） | [[Scope Creep 守恆律]] |
| **Progressive disclosure** | 是否分層載入內容（metadata → instructions → resources） | [[src-wshobson-agents]] 三層架構 |
| **Token efficiency** | 載入成本是否最小化 | [[src-codeburn]] token 觀測 |
| **Robustness** | 邊界案例與失敗模式處理 | [[src-AI-Agent避坑指南]] |
| **Structural completeness** | 是否完整（metadata / instructions / examples） | skill schema 規範 |
| **Code template quality** | 範例程式碼品質 | [[src-mattpocock-skills]] PRD 模板派 |
| **Ecosystem coherence** | 與其他 skill 一致性 | [[src-addyosmani-agent-skills]] SDLC 對齊 |

## 品質標章

| 標章 | 等級 | 含義 |
|------|------|------|
| **Platinum** | ★★★★★ | 全維度高分，statistical CI 區間最窄 |
| **Gold** | ★★★★ | 高品質，少數維度有改進空間 |
| **Silver** | ★★★ | 達標但有明顯弱項 |
| **Bronze** | ★★ | 基本可用，需大幅改進 |

## Anti-pattern 偵測

PluginEval 自動標出 6 種設計 smell：

| Anti-pattern | 含義 | 解方 |
|---|---|---|
| `OVER_CONSTRAINED` | 啟用條件過於嚴格，幾乎不觸發 | 放寬 description / activation criteria |
| `EMPTY_DESCRIPTION` | description 空或無意義 | 重寫描述觸發場景 |
| `MISSING_TRIGGER` | 缺少啟用提示 | 加入 keyword / phrase 範例 |
| `BLOATED_SKILL` | 一個 skill 涵蓋過多無關職責 | 拆分為多個單一目的 skill |
| `ORPHAN_REFERENCE` | 參考的 file / template 不存在 | 補齊 reference 或刪除引用 |
| `DEAD_CROSS_REF` | wikilink / cross-ref 指向不存在頁面 | 修復連結（與 [[LLM Wiki]] lint 相同模式） |

## 統計嚴謹度

PluginEval 的差異化在於統計工具的引入：

| 工具 | 用途 |
|------|------|
| **Wilson score CI** | 比例（如 trigger accuracy 命中率）的信賴區間 |
| **Bootstrap CI** | 非參數信賴區間（適用任何指標） |
| **Clopper-Pearson exact CI** | 二項分布精確信賴區間（小樣本適用） |
| **Elo ranking** | skill 兩兩對比後的相對排名（西洋棋等級制） |

> **這是把學術級統計引入 skill 評估的首例**。對比 [[skills.sh]] 的 install 數（單一指標、無 CI）、[[OSS Investment Scorecard]] 的 R-1 ~ R-5 評分（依賴主觀權重）——PluginEval 走的是更硬科學的路徑。

## CI/CD 整合

```bash
# CI gate：低於 threshold 即 exit non-zero
uv run plugin-eval score path/to/skill --depth standard --threshold 0.7
```

意義：skill 品質可作為**自動化 quality gate**，跟 lint / test 同等待遇。

## 與 wiki 既有評估框架的比較

| 框架 | 對象 | 方法 | 統計嚴謹度 |
|------|------|------|------|
| **PluginEval** | Skills / Plugins | 三層 + 10 維度 + 統計 CI | **高** |
| [[OSS Investment Scorecard]] | OSS 專案投資 | R-1 ~ R-5 + 權重 | 中（無 CI） |
| [[skills.sh]] trending | Skill organic 流行度 | install 降序排名 | 低（單一指標） |
| [[src-Code Review已死]] Swiss-cheese | Code review 品質 | 五層信任 layer | 質性（無分數） |
| GitHub Star Health（已知無公開 API） | OSS 健康 | 隱含於 [[OSS Investment Scorecard]] R-1 | 中 |

## 應用建議

### 對 wiki 既有 skill 條目

可實測跑分對照：
- [[src-skill-ast-grep]]——已知 [[skills.sh]] 04-18 唯一精選，預期 Gold/Platinum
- [[src-skill-character-arc]]——pure prompt 範本派
- [[src-skill-3b1b-style-animation-skill]]——多 reference 文件結構
- [[src-skill-guizang-ppt]]——強約束派（5 主題 / 10 layout 不可自訂），可能標 OVER_CONSTRAINED
- [[src-bug-hunter]]——multi-agent + adversarial，可能在 Orchestration fitness 高分

### 對 skill 設計者

- 寫 skill 前先看 anti-pattern 列表，避免 6 個 smell
- 提交 skill 前跑 quick 評估
- 想衝 Platinum 標章需通過 Monte Carlo 層

### 對 [[skills.sh]] 等中央 hub

- PluginEval 提供「組件級」品質信號，補強純 install 數的不足
- 可能演化為 skills.sh 採納的標準（若被生態接受）

## 不確定 / 待查項目

- ⚠️ **Monte Carlo simulation 的具體實現**未在 README 詳述，需看 `docs/plugin-eval.md`
- ⚠️ **Elo ranking** 的 baseline 與兩兩比對機制未明
- ⚠️ **LLM judge** 用什麼模型？是 [[Claude Code]] 內建還是另外調用 API？
- ⚠️ **實測準確度**——PluginEval 自評等級與人類評估是否一致？需 evidence
- ⚠️ 這個框架是否會被 [[Anthropic]] 官方採納為 skill 標準（vs 自家 [[skills.sh]]）？

## 跨來源連動

- **[[src-wshobson-agents]]**——本概念主要來源
- **[[skills.sh]]**——install 數信號 vs PluginEval 品質信號的對比
- **[[OSS Investment Scorecard]]**——投資評分思維的 skill 版
- **[[src-multica-devv-ai盡調]]**——R-1 Star 健康度評分可能參考 PluginEval 統計工具升級
- **[[AI 品質共謀]]**——AI 寫 code + 寫 test 的同源誤解；PluginEval 用統計重複實驗對抗此問題
- **[[Skill vs Bash vs MCP]]**——Skill 維度評估的科學化補強
