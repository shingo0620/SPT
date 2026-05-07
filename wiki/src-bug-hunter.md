---
title: "src-bug-hunter — codexstar69/bug-hunter"
type: source
sources: [bug-hunter.md]
source_url: https://github.com/codexstar69/bug-hunter
created: 2026-05-04
updated: 2026-05-04
tags: [agent-skill, multi-agent, security, bug-hunting, auto-fix]
---

# bug-hunter — Adversarial AI Bug Hunter Skill

> 來源：raw/bug-hunter.md（URL 標籤，內容僅 GitHub repo 標題與描述）
> 主旨：跨 7+ 主流 coding agent 平台的「找 bug + 自動修」multi-agent pipeline skill
>
> ⚠️ **僅根據 raw URL 標籤的描述彙整，未抓取完整 README 或原始碼；實際 skill 設計細節需訪問 GitHub repo 確認**

## 簡介

**bug-hunter** 是一個 **adversarial AI bug hunter** skill，主打「對抗性 multi-agent pipeline」尋找並自動修復程式碼問題。

### 三類 bug 涵蓋

1. **Security vulnerabilities** — SQL injection、XSS、RCE、auth flaws
2. **Logic errors** — 條件判斷、邊界、狀態機錯誤
3. **Runtime bugs** — null pointer、type errors、memory leaks

### 自動修復 + safe branch

- 找到 bug 後**自動修**——不僅報告
- 修復寫到**獨立 safe branch**，不污染主分支——對應 [[src-Code Review已死]] 中提到的「分離評估與生產」原則

## 跨 agent 平台支援

支援的 7+ agent harness：

- **[[Claude Code]]**（[[Anthropic]] 官方 CLI）
- **Cursor**（VS Code fork 的 AI 編輯器）
- **Codex CLI**（[[OpenAI]] 的 CLI agent）
- **GitHub Copilot CLI**
- **Kiro CLI**（AWS Kiro IDE 的 CLI）
- **Opencode**
- **Pi Coding Agent**

> **跨 agent 設計意義**——這代表 bug-hunter skill 採用通用 skill 規範（接近 [[skills.sh]] / SKILL.make 等標準提案的方向），讓單一 skill 跨 7+ harness 可運行。是 [[src-andrej-karpathy-skills]]、[[src-mattpocock-skills]]、[[src-addyosmani-agent-skills]] 等「production-grade」skill 的延續。

## Multi-agent pipeline 設計

「Adversarial」+「Multi-agent pipeline」暗示：

- 多個 agent 角色協作（如 hunter agent / verifier agent / fixer agent）
- 彼此「對抗」設計：一個 agent 出 PR，另一個質疑（類似 [[src-Code Review已死]] 的「Swiss-cheese 五層信任」）
- pipeline 階段化：bug 偵測 → 確認 → 修復 → safe branch 提交

對比已知 skill：
- [[src-mattpocock-skills]] 主打 PRD/Issue/Plan 模板（單 agent）
- [[src-andrej-karpathy-skills]] 主打 4 條編碼原則（單 agent）
- [[src-addyosmani-agent-skills]] 涵蓋 SDLC 6 階段 20 個 skill（每個 skill 單 agent）
- **bug-hunter 是首個明確「multi-agent + adversarial」設計**——agent 之間互審，符合 [[AI 品質共謀]] 的解方

## 與 wiki 其他主題的關聯

- **[[src-Code Review已死]]**——Spec-driven + Swiss-cheese 五層信任模型；bug-hunter 把「找 bug + 修 bug」交給 multi-agent，但 `safe branch` 保留人類最終審查
- **[[AI 品質共謀]]**——AI 同時寫 code 與 test 容易形成「同源誤解」；bug-hunter 的對抗性設計是潛在解方（不同 agent 角色＝不同視角）
- **[[Skill vs Bash vs MCP]]**——這個 skill 顯然走 **Skill 模式**（封裝完整 workflow），跨 harness 是賣點
- **[[src-codeburn]]** — token 觀測 dashboard；bug-hunter 的 multi-agent 設計顯然 token-heavy，與成本觀測形成對照

## 適用場景

> 「適合**有經驗的 senior engineer + AI agent 工作流**且需要在 PR/CI 階段加一層對抗性檢查的團隊」

- 不適合：個人簡單 script
- 適合：production codebase、安全敏感模組、已用 multi-agent harness 的團隊

## 限制與待查項目

- ⚠️ 本 source 僅根據 URL 標籤描述彙整，未完整檢視 GitHub repo
- 需確認：
  - 實際 multi-agent 角色拆分
  - 「對抗性」設計的具體實作
  - 各 agent harness 的整合方式（YAML/JSON skill manifest？）
  - star 數、社群採用度、與其他 bug hunter skill 的對比
- **建議後續動作**：手動瀏覽 https://github.com/codexstar69/bug-hunter 並補充完整 README 至 raw/，再 ingest 完整 source page
