---
title: The Founder's Playbook — Anthropic 的 AI 原生新創指南
type: source
sources: [anthropic官方發布新創ai使用指南4大階段3款工具教你打造ai原生公司數位時代-businessnext.md, "The Founder’s Playbook Building an AI-Native Startup.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [anthropic, claude, ai-native-startup, founders-playbook, claude-md, agentic-technical-debt]
---

# The Founder's Playbook — Anthropic 的 AI 原生新創指南

> 來源：Anthropic 2026-05-14 官方手冊《The Founder's Playbook: Building an AI-Native Startup》（36 頁，[官方原文](https://claude.com/blog/the-founders-playbook)）；本頁內容整理自數位時代 BusinessNext 中文導讀（2026-05-18，李先泰）。原始 PDF 連結見 sources。
>
> ⚠️ **擷取備註**：原 Anthropic 官方英文 PDF 經 markdown.new 擷取失敗（PDF 無法解析），本頁以 bnext 繁中導讀為主要內容來源；英文原文細節（36 頁完整版）待後續補擷取。

## 一句話

Anthropic 官方手冊示範「從第一天就把 AI 當基礎工具的公司，創業流程會如何改變」——把新創從點子到成長拆成 **Idea / MVP / Launch / Scale 四階段**，每階段配對 **Chat / Cowork / Claude Code 三種 Claude 工具**，創辦人角色從「自己做事」轉為「指揮系統」。

## 核心論點：創辦人從執行者變協調者

- 過去創業吃分工：技術創辦人寫程式、商業創辦人募資找客戶；缺能力就找共同創辦人/外包/招人
- Anthropic 認為 AI 改寫分工：創辦人更像協調者——把研究/寫作/開發/測試/客服/營運分派給不同 AI 工具
- **「10 人團隊也能拚獨角獸」**——非指 10 人必成 10 億美元公司，而是 AI 讓小團隊做到過去大團隊的工作量
- 案例（Anthropic 自述）：Anything 平台靠 Claude 助 150 萬使用者把想法變軟體；Carta Healthcare 年用 Claude 處理 2.2 萬筆手術案例、資料抽取時間壓縮 66%

> 與 [[src-雷蒙-不需要-agent-team]] 的「超級個體」論點同向——AI 讓個體/小團隊跨越人類分工極限；但本手冊是企業/新創框架，雷蒙是個體工作者框架

## 三種 Claude 工具分工

| 工具 | 適合 |
|------|------|
| **Chat** | 短任務——問問題、整理一句摘要、快速檢查想法 |
| **Claude Cowork** | 較長知識工作——整理整批訪談、每週彙整 KPI、連接資料夾與工具 |
| **Claude Code** | 工程任務——讀程式碼、改 bug、建原型、跑測試、安全檢查 |

> 建議：先看任務屬性再選工具，不是全丟同一聊天視窗。對應 [[src-claude-family]] 的 Claude 產品線定位

## 四階段流程

### 1. Idea — 先確認問題真的存在（problem-solution fit）

- 最重要不是馬上做產品，而是確認問題是否真的存在
- ⚠️ **AI 寫程式太快的新風險**：還沒確認需求就急著做出產品。引用統計：42% 新創失敗是因做出沒人要的產品；agentic coding 普及後此錯誤可能更快發生
- AI 三用途：(1) 把模糊點子變可驗證假設（不說「合約審查太慢」，改說「中型企業法務每份合約審查超 3 天，因紅線散在 email 串」）(2) 估市場規模（TAM/SAM/SOM）(3) **請 Claude 扮反方**——找出點子為何失敗、替競爭對手寫打敗你的論述
- 最後才用 Claude Code 做極輕原型（驗證道具，非正式產品）

### 2. MVP — 先做最小版本，但不要埋技術債

- AI 時代 MVP 更快，非技術創辦人也能用 Claude Code 做雛形
- ⚠️ **最大風險：agentic technical debt（代理式技術債）**——每次讓 AI 從零猜架構/規則/取捨，程式碼變成「每個模組能跑但整體無一致邏輯」
- **建議：寫程式前先建 `CLAUDE.md`**——記錄專案架構、命名規則、接受哪些依賴、哪些做法不用；每次開新 Claude Code session 先讀它（直接呼應 [[src-karpathy-12-claude-rules]] 的 CLAUDE.md 行為契約）
- 寫清產品範圍：這版做/不做什麼、什麼條件才新增功能
- 上線前用 Claude 做安全檢查（登入驗證/API 暴露/注入攻擊/套件漏洞）；但 ⚠️ AI 掃描只是輔助，不取代正式資安審查，且 Claude Code Security 仍是 limited beta

### 3. Launch — 別讓創辦人成為公司瓶頸

- 問題從「做不做得出來」變「能不能穩定運轉」
- 創辦人 MVP 期親力親為是優勢，Launch 期反成瓶頸（客服/回饋/決策/銷售都卡在創辦人）
- Claude Cowork 盤點營運流程：哪些可完全自動化？哪些需人但不需創辦人？哪些必須創辦人判斷？
- Claude Code 做架構稽核、排技術債優先序；賣企業客戶可先跑 SOC 2 / GDPR / HIPAA 合規檢查

### 4. Scale — 護城河不是程式碼，而是累積

- AI 原生新創真正護城河不是程式碼本身（程式碼 AI 能更快寫），而是累積：對產業的理解、客戶使用資料、產品工作流、與其他工具的整合深度
- 建議把產業知識/常見地雷/客戶術語/成功案例整理進 Claude Projects、Memory、Skills，讓 Claude 逐漸懂你的公司與市場
- 用 Claude Code 把使用者行為資料轉成「資料飛輪」敘事——回答「為何資源更多的競爭者不能明天複製你」

## 讀這份手冊前的三點提醒（bnext 觀點）

1. **本質是 Anthropic 產品文件**——方法論有參考價值但預設用 Claude/Cowork/Claude Code；可把概念拆出改用 Cursor/Replit/Devin
2. （案例數字為 Anthropic 自述，未獨立驗證）
3. （AI 安全掃描不取代正式合規審查）

## 與本 wiki 的連結

- **MVP 階段「先建 CLAUDE.md 防代理式技術債」**——與 [[src-karpathy-12-claude-rules]]、[[src-andrej-karpathy-skills]] 完全同源；Anthropic 官方背書 CLAUDE.md 作為「行為契約」的做法
- **三工具分工（Chat/Cowork/Claude Code）**——對應 [[src-claude-family]]、[[Claude Code]]、[[Anthropic]] 6 產品線
- **「創辦人變協調者 / 10 人拚獨角獸」**——對應 [[src-雷蒙-不需要-agent-team]] 超級個體 + [[src-codex-代理人桌面作業系統]] 代理人桌面 OS；三來源同期（5/14-5/18）共同描繪「AI 原生工作型態」
- **Scale「護城河是累積非程式碼」**——對應 [[src-forbes-vibe-coding-buy-vs-build]]（buy vs build）+ [[src-karpathy-sequoia-ascent-2026]]「verifiability / 領域知識」
- **「agentic technical debt」**——新概念，對應 [[Multi-Agent 失敗分類學]] 的系統設計失敗在「單 agent 反覆重來」層次的版本

## 查核備註

- ✅ **手冊存在**：Anthropic 2026-05-14 官方發布《The Founder's Playbook》屬實（claude.com/blog）
- ⚠️ **案例數字**（Anything 150 萬使用者、Carta 66% 壓縮）為 Anthropic 自述，未獨立驗證
- ⚠️ **42% 新創失敗統計**：bnext 稱「引用既有產業統計」——此數字常見於 CB Insights「no market need」死因分析，但「42%」是常被引用的近似值，非精確
- ⚠️ **本頁內容為 bnext 二手導讀**，非 Anthropic 英文原文逐字；36 頁完整手冊細節（具體 exercise/prompt 範本）待補擷取英文 PDF
