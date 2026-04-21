---
title: "被牆清零後，兩個工程師帶一群 Agent 扛住 50 萬用戶？Multica 背後的極限小團隊生存樣本"
type: source
sources: [multica-devv-ai-盡調.md]
created: 2026-04-21
updated: 2026-04-21
tags: [Multica, Devv.AI, OSS, 創投, 盡職調查, AI Agent, Vendor-neutral, Small Team]
---

# 被牆清零後，兩個工程師帶一群 Agent 扛住 50 萬用戶？

## 來源資訊

- 作者：匿名（自稱新加坡 VC 駐企家 E.I.R.、兩次創業退出、15 年產品商業化戰略與資本運作經驗）
- 發表平台：Substack
- 主題：[[Multica]] 專案的盡職調查過程，同時揭示作者的 OSS Investment Scorecard 分析框架演進

## 核心主張

> Agent Management 這層還在搶定義權的拓荒期。Multica 底層的任務狀態機、Skill 持久化和 Multi-runtime 架構非常有看頭。而 [[Devv.AI]] 團隊極小編制操盤萬星專案的存活路數，本身更是教科書級別的新創樣本。

## 主要結論

### 關於 [[Multica]] 專案

- **定位**：把 AI Agent 當作真實的 Team Member 管理的協作平台——Agent 有獨立 Profile，在專案看板上與人類工程師並列於 Assignee 下拉選單
- **生態空白卡位**：Linear 管人、[[Anthropic]] Claude Managed Agents 管單一 Session 安全、Multica 補「多 Agent 團隊級協作」
- **Vendor-neutral 特性**：支援 [[Claude Code]]、Codex、OpenClaw、OpenCode——Daemon 自動偵測本機 CLI 串接，對比 Anthropic 只能跑自家 Claude
- **數據（3 個月）**：10.3k stars、1.3k forks、33 contributors
- **健康度指標**：Star/Fork 比 8.1 倍、Star/Issue 比 73 倍、Fork 率 12.4%——全部落在健康水位

### 關於 [[Devv.AI]] 團隊

- **核心開發**：Top 4 貢獻者佔 97.4% commits——反映這不是草根社群專案，而是**正規軍團隊外流的產物**
- **榜首 forrestchang**：710 commits，bio「Building @multica-ai」，email jiayuan@multica.ai——即 Devv.AI 創辦人 Jiayuan Zhang；早期靠 CLAUDE.md 優化專案攬 1.5w 星
- **第二位 Bohan-J**：433 commits，Devv.AI 共同創辦人**蔣博涵（Bohan Jiang）**；多倫多大學 CS 科班、待過字節跳動、做過破千星 ReadPilot
- **團隊規模**：始終維持 3-4 人編制——Devv 早期 3 人達 $30K MRR

### Devv.AI 三階段產品演化

| 年份 | 產品 | 定位 |
|------|------|------|
| 2023 | Devv 1.0 | **開發者專屬 AI 搜尋引擎**（垂直索引 + RAG），上海；訪談 50 位 developer 找到「通用 AI 吐垃圾 code」痛點；口碑發酵突破 50 萬用戶 |
| 2025 | Devv 2.0 | **第一個幫你交付 AI 產品的 Coding Agent**——受 Agent 革命啟發、GFW 導致 1.0 核心盤歸零後的轉型 |
| 2026 | [[Multica]] | **Agent 管理平台**——管理多個 Coding Agent 的工作流 |

每一步都往工具鏈更底層的 Infra 扎，始終 3-4 人執行。

## 作者的推論

> Multica 極高機率是他們為了消化內部龐大的 Agent 工作流而開發的自用工具，驗證可行後才轉作開源。

支撐：Slogan "A small team shouldn't feel small, two engineers and a fleet of agents can move like twenty." 契合他們的實戰體悟。

## 作者的分析框架更新

這次盡調讓作者把自家 **[[OSS Investment Scorecard]]** 升級到 v1.3.1，增加三個外掛模組：

### R-1：Star 健康度診斷模組

- 用 GitHub API 抓 5 個量化指標
- 20 分鐘判斷專案熱度是否灌水
- 作為 A 維度（Popularity）的輔佐參考

### R-2：Commit 集中度分析模組

- 當作 **Bus Factor（公車指數）** 的 Proxy
- Multica 97.4% 的畸形集中度 → 一眼分出「草根社群 vs 正規軍外流」

### R-3：匿名團隊身分追溯 SOP

5 步打通任督二脈：
1. Contributors API 爬出核心開發 Handle
2. 資料欄位（bio、email）
3. LinkedIn 交叉比對
4. ProductHunt 交叉比對
5. Indie Hackers 交叉比對

## 評估分數變化

盡調前後：
- B 維度（Team）：4.5 → 6.0（匿名上調至已知精英）
- 總分：5.30 → 5.56
- 位置：**卡在 Watch 和 Pass 的邊緣**

## 延伸連結

### 與既有 wiki 的呼應

- [[src-Harness Engineering]]：Harness 駕馭工程的 agents.md、Lifelong AI Agent 概念——Multica 是這條路線的商業化實作
- [[src-Claude Code Routines]]：Claude Code 的排程/API/GitHub 事件驅動——Multica 是**跨 vendor 的泛化版**，不綁 Claude
- [[src-AI-Agent避坑指南]]：三次架構演進——Multica 的「多 Agent 團隊級協作」是第三階段之後的下一層
- [[src-Code Review已死]]：從程式碼審查走向意圖審查——Multica 進一步把「意圖」放到 Agent Profile 上

### 與既有概念的關係

- [[AI 輔助軟體工程]]：從個人工具走到**組織工具**的一步
- [[Skill vs Bash vs MCP]]：Multica 的 Skill 持久化機制是 Agent 層的 Skill 復用

## 關鍵引用

> Multica 的核心玩法是把 Agent 當作真實的 Team Member。在專案看板上，Agent 有獨立的 Profile，直接和人類工程師並列在 Assignee 下拉選單里。

> 這根本不是什麼草根的「社群專案」，而是某個正規軍團隊外流的產物。

> 但比起分數，更硬核的是這個盡調過程。這次評估直接讓我在更新當下分析框架至 v1.3.1 框架，增加三套外掛模組。

> 但從投研視角來看，能不能起底這層底細，直接決定了該專案在早期階段的生死判定。

## 事實查核備註

⚠️ **作者匿名**：雖自稱新加坡 VC 駐企家、兩次創業退出，但文中未提供可驗證的身分證據。框架 v1.3.1 為作者自創、未見第三方驗證。

⚠️ **數字精確性**：10.3k stars、97.4% commit 集中度、$30K MRR 等數字未附上 API 快照或連結證據，應視為「作者聲稱」而非「獨立驗證」。

✅ **人物 / 專案存在性**：Devv.AI 作為 2023 年上海起家的開發者 AI 搜尋引擎屬實，Jiayuan Zhang / Bohan Jiang 公開身分可交叉比對 ProductHunt / Indie Hackers / LinkedIn。
