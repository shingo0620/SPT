---
title: GitHub Trending 月報 — 2026-05
type: source
sources: [github-trending-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-01
tags: [github, trending, monthly-digest]
---

# GitHub Trending — 2026 年 5 月

> 每日自動收集 GitHub 當日新建熱門 repo，由 LLM 翻譯彙整。依日期新到舊排列。

## 2026-05-01

| # | Repo | 星 | 語言 | 主題 | 查核 | 連結 |
|---|------|----|------|------|------|------|
| 1 | darrylmorley/whatcable | **361** | Swift | macOS menu bar app：用白話告訴你接上的 USB-C 線實際支援什麼（power/data/video） | ✅ | [GitHub](https://github.com/darrylmorley/whatcable) |
| 2 | mattpocock/dictionary-of-ai-coding | 309 | TypeScript | AI coding 術語白話解釋（mattpocock 是 TS 教育者，與 [[src-skills-trending-2026-05]] #8 grill-me 同作者） | ✅ | [GitHub](https://github.com/mattpocock/dictionary-of-ai-coding) |
| 3 | TQ-trade/rari-stable-pool-contracts | 98 | HTML | Rari Stable Pool 智能合約（HTML 主語言 + 簡述少 → 疑為 spam / 詐騙前置） | ⚠️ | [GitHub](https://github.com/TQ-trade/rari-stable-pool-contracts) |
| 4 | TQ-trade/defidollar-core | 97 | JavaScript | DefiDollar (DUSD) 穩定幣合約（同 #3 帳號，連兩件衝榜，疑為 SEO/詐騙手法） | ⚠️ | [GitHub](https://github.com/TQ-trade/defidollar-core) |
| 5 | warpdot-dev/composio | 94 | TypeScript | description 為大量關鍵字堆疊（typescript/python/sdk/ai-agents/anthropic/openai/langchain...） | ⚠️ | [GitHub](https://github.com/warpdot-dev/composio) |
| 6 | lukiIabs/trading-agents | 93 | Python | 多代理人金融交易（description 為關鍵字堆疊：LLM/multi-agent/finance/crypto/sentiment...） | ⚠️ | [GitHub](https://github.com/lukiIabs/trading-agents) |
| 7 | Tommy-yw/RunbookHermes | 60 | Python | Hermes-native AIOps agent，evidence-driven incident response, approval-gated remediation, runbook learning | ✅ | [GitHub](https://github.com/Tommy-yw/RunbookHermes) |
| 8 | watany-dev/gitreal | 56 | Go | 無描述 | ⚠️ | [GitHub](https://github.com/watany-dev/gitreal) |
| 9 | ThatTotallyRealMyth/Impacket-IoCs | 55 | — | 內部 impacket re-write 後留下的 IoC 集合（攻擊者改寫 → 紅隊 vs 藍隊偵測規則） | ✅ | [GitHub](https://github.com/ThatTotallyRealMyth/Impacket-IoCs) |
| 10 | ~~Loverdox/Fortex-Here~~ | ~~44~~ | ~~—~~ | ❌ **「Bitcoin flash transactions / fake BTC transaction / flash BTC transfer」明顯為加密貨幣詐騙工具的偽裝 repo** | ❌ | [GitHub](https://github.com/Loverdox/Fortex-Here) |
| 11 | nateherkai/AIS-OS | 34 | — | Claude Code 的 AI Operating System starter kit：三個 skill（/onboard, /audit, /level-up）+ 3Ms framework | ✅ | [GitHub](https://github.com/nateherkai/AIS-OS) |
| 12 | maxmo2009/CMR_QC_Studio | 30 | JavaScript | 無描述 | ⚠️ | [GitHub](https://github.com/maxmo2009/CMR_QC_Studio) |
| 13 | Abhisheksinha1506/ClaudeBusiness | 29 | — | 無描述（Claude 相關） | ⚠️ | [GitHub](https://github.com/Abhisheksinha1506/ClaudeBusiness) |
| 14 | ~~ridha61/Lossless-Scaling-Upscaler-FPS~~ | ~~29~~ | ~~C++~~ | ❌ **「Lossless Scaling Free Download / 破解 LSFG / Steam 遊戲性能加速」明顯為盜版/破解軟體下載引導** | ❌ | [GitHub](https://github.com/ridha61/Lossless-Scaling-Upscaler-FPS) |
| 15 | ~~cH1LLa/Photoshop-v27.6~~ | ~~27~~ | ~~C++~~ | ❌ **「Adobe Photoshop v27.6 Download April 2026」盜版 Photoshop 下載引導** | ❌ | [GitHub](https://github.com/cH1LLa/Photoshop-v27.6) |

> **05-01 觀察**：
>
> ### 今日 GitHub Trending 信噪比偏低
>
> 15 條中：
> - **真正有價值**：5 條（#1, #2, #7, #9, #11）
> - **疑似 spam / SEO 堆關鍵字**：5 條（#3, #4, #5, #6, #8）+ 2 條無描述（#12, #13）
> - **明顯詐騙/盜版**：3 條（#10 BTC flash 詐騙、#14 LSFG 盜版、#15 Photoshop 盜版）
>
> 對應 [[src-github-trending-2026-04]] 04-30 的「TQ-trade」與「Sndav CVE PoC」也是類似 trending 算法被 spam 攻擊。GitHub trending 信號品質下降趨勢延續，**spammy repo 透過買 stars / SEO description 衝榜**。
>
> ### 重點 repo
>
> 1. **#1 whatcable**——同時上 [[src-hn-2026-05]] #12，跨來源典型「Show HN → trending」案例。USB-C 線實際支援功能差異極大（USB 2.0/3/3.2/4/PD/Thunderbolt），用實體 inspector 把資訊呈現是優秀產品設計
> 2. **#2 mattpocock/dictionary-of-ai-coding**——TypeScript 大手 [[src-mattpocock-skills|Matt Pocock]] 的新 repo，AI coding 術語白話辭典；對「術語膨脹」現象的反制
> 3. **#7 RunbookHermes**——「Hermes-native AIOps agent」說明 Hermes（agent harness？需查證）有自己的 agent 生態；AIOps + approval gate + runbook learning 是企業 ops 標準三件套
> 4. **#9 Impacket-IoCs**——內部紅隊改寫 impacket 後留下的 IoC，**對藍隊是寶貴情報**——攻擊者改寫工具的痕跡識別
> 5. **#11 AIS-OS**——又一個 [[Claude Code]] skill kit（與 [[src-andrej-karpathy-skills]]、[[src-mattpocock-skills]] 同類），driver framework 「3Ms」具體不明；Claude Code skill ecosystem 持續發展
>
> ### 跨來源連動
>
> - **whatcable**：上 HN + GitHub Trending，雙源強信號
> - **mattpocock**：本月 trending 新 repo（dictionary）+ 已知 grill-me（[[src-skills-trending-2026-05]] #8）
> - **詐騙 repo 上 trending**：spam 攻擊算法的成本下降，下游監控（dependabot 等）需升級判斷
>
> ### 教訓
>
> 信號雜訊比降低意味著「trending Top 15 ≠ 推薦」——下次 ingest 時 ⚠️/❌ 標記要前置抓出，避免 wiki 內鏈引導使用者去詐騙頁面。
