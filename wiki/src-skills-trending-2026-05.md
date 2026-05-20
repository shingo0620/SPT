---
title: skills.sh Trending Top 10 月報 — 2026-05
type: source
sources: [skills-trending-2026-05-12.md, skills-trending-2026-05-11.md, skills-trending-2026-05-10.md, skills-trending-2026-05-09.md, skills-trending-2026-05-08.md, skills-trending-2026-05-07.md, skills-trending-2026-05-06.md, skills-trending-2026-05-05.md, skills-trending-2026-05-04.md, skills-trending-2026-05-03.md, skills-trending-2026-05-02.md, skills-trending-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-19
tags: [skills-sh, agent-skills, trending, monthly-digest]
---

# skills.sh Trending Top 10 — 2026 年 5 月

> 每日自動收集 [skills.sh/trending](https://skills.sh/trending) Top 10（按 installs 降序），由 LLM 觀察排名變化、新進榜（✨）與生態結構。日期依新到舊排列。
>
> 與 [[src-skills-picks-2026-04]]（編輯精選，已停發）的對比：trending 反映 organic 流行度，是 skills.sh 上「真正最受歡迎」skills 的縱向追蹤。

> **2026-05-04 更新**：Inference.sh 改名事件已建立 [[Inference.sh]] 組織實體頁——記錄品牌統一時程、5 件 Top 5 skill、與 [[skills.sh]] / [[src-claude-for-creative-work]] 的生態連動

> **2026-05-09 更新**：5/7-5/8 兩日觀察到 **find-skills 跌出榜外**（5/6 #6 18,648 → 5/7 起消失）+ **inference-skills 五件二度下跌**（5/7 微跌 -50/skill、5/8 大幅 -2,800/skill）；mattpocock 兩件（grill-me + improve-codebase-architecture）穩定回到 #9/#10——「organic 衰減 + 第二次統計重置」雙線並存

> **2026-05-13 更新**：5/9-5/12 四日連續異常事件：(1) **5/9 inference URL 第二次改名**（inference-skills → inference-sh-skills，install 全部 -33%）(2) **5/10 agentspace-so 五件全進榜**（單日推送異象，當日 inference 同步恢復至 32k+）(3) **5/11 agentspace-so 全部跌出**（hype 結束）+ mattpocock 三件全進榜（grill-with-docs ✨ 首次入榜）(4) **5/12 organic 恢復**（soultrace 突破 8k，mattpocock 三件均成長）

> ⚠️ **2026-05-13 fetcher 失效**：skills-trending 與 picks raw 自 5/13 起未抓到，疑似 skills.sh 改版或 fetch 腳本失敗，待修復

## 2026-05-12 — Organic 恢復日 + mattpocock 三件全在榜

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-image-generation](https://skills.sh/inference-sh-skills/skills/ai-image-generation) | inference-sh-skills/skills | 33,259 | ↓ 5/11 33,290 → 33,259（-31，微跌噪音範圍） |
| 2 | [ai-video-generation](https://skills.sh/inference-sh-skills/skills/ai-video-generation) | inference-sh-skills/skills | 33,236 | ↑ 5/11 33,228 → 33,236（+8） |
| 3 | [ai-avatar-video](https://skills.sh/inference-sh-skills/skills/ai-avatar-video) | inference-sh-skills/skills | 33,173 | ↑ 5/11 33,170 → 33,173（+3） |
| 4 | [agent-tools](https://skills.sh/inference-sh-skills/skills/agent-tools) | inference-sh-skills/skills | 33,155 | ↓ 5/11 33,157 → 33,155（-2） |
| 5 | [infsh-cli](https://skills.sh/inference-sh-skills/skills/infsh-cli) | inference-sh-skills/skills | 33,152 | ↓ 5/11 33,153 → 33,152（-1） |
| 6 | ↑ [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 8,943 | ↑ 5/11 #8 5,973 → #6（**+2,970**，單日異常大幅成長） |
| 7 | ↑ [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,727 | ↑ 5/11 #6 7,038 → #7（+1,689） |
| 8 | ↑ [[src-mattpocock-skills\|grill-me]] | mattpocock/skills | 7,972 | ↑ 5/11 #7 6,108 → #8（+1,864） |
| 9 | [grill-with-docs](https://skills.sh/mattpocock/skills/grill-with-docs) | mattpocock/skills | 7,059 | ↑ 5/11 #9 5,371 → #9（+1,688，持平排名但 install 大增） |
| 10 | [improve-codebase-architecture](https://skills.sh/mattpocock/skills/improve-codebase-architecture) | mattpocock/skills | 7,006 | ↑ 5/11 #10 5,355 → #10（+1,651） |

⬇️ **跌出榜外**：無新跌出（榜單與 5/11 相同人員）

> **05-12 觀察**——⚠️ **organic 集體大幅成長日**：
>
> ### 1. **6-10 名全部 +1,600 以上 install 單日**
>
> - soultrace +2,970、wonda-cli +1,689、grill-me +1,864、grill-with-docs +1,688、improve-codebase-architecture +1,651
> - 「organic skills 同步 +1,500-3,000」並非自然成長，**疑似 skills.sh 統計重置或新一輪 install 數據加註**
> - 對照 [[src-skills-picks-2026-05]] ast-grep 5/12 +82——個別 skill 的 organic 成長仍維持小幅；只有 Top 10 出現大幅
>
> ### 2. **inference 五件高位持平**
>
> - 5/11 33,170-33,290 → 5/12 33,152-33,259，五件變動 -31 至 +8 範圍
> - 自 5/10 32k+ 急速恢復後維持 33k 高原；agentspace-so hype 結束後 organic 五件穩定
>
> ### 3. **mattpocock 三件全在榜**
>
> - grill-me #8 + grill-with-docs #9 + improve-codebase-architecture #10——5/4 後第二次三件齊聚 Top 10
> - 三件 install 5/11 → 5/12 都大幅成長（+1,650 至 +1,864），可能是同一波統計重置

## 2026-05-11 — agentspace-so 五件全跌 + mattpocock 三件齊聚 + grill-with-docs ✨ 首入榜

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-image-generation](https://skills.sh/inference-sh-skills/skills/ai-image-generation) | inference-sh-skills/skills | 33,290 | ↑ 5/10 32,915 → 33,290（+375） |
| 2 | [ai-video-generation](https://skills.sh/inference-sh-skills/skills/ai-video-generation) | inference-sh-skills/skills | 33,228 | ↑ 5/10 32,860 → 33,228（+368） |
| 3 | [ai-avatar-video](https://skills.sh/inference-sh-skills/skills/ai-avatar-video) | inference-sh-skills/skills | 33,170 | ↑ 5/10 32,793 → 33,170（+377） |
| 4 | [agent-tools](https://skills.sh/inference-sh-skills/skills/agent-tools) | inference-sh-skills/skills | 33,157 | ↑ 5/10 32,787 → 33,157（+370） |
| 5 | [infsh-cli](https://skills.sh/inference-sh-skills/skills/infsh-cli) | inference-sh-skills/skills | 33,153 | ↑ 5/10 32,780 → 33,153（+373） |
| 6 | ✨ [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 7,038 | ✨ 5/10 跌出 → 5/11 #6 回榜（前次 5/9 #6 6,407 → +631） |
| 7 | ✨ [[src-mattpocock-skills\|grill-me]] | mattpocock/skills | 6,108 | ✨ 5/9-5/10 跌出 → 5/11 #7 回榜 |
| 8 | ✨ [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 5,973 | ✨ 5/10 跌出 → 5/11 #8 回榜（前次 5/9 #8 6,249 → -276） |
| 9 | ✨ [grill-with-docs](https://skills.sh/mattpocock/skills/grill-with-docs) | mattpocock/skills | 5,371 | ✨ **本月首次入榜**——mattpocock 三件中第 3 件終於進 Top 10 |
| 10 | ✨ [improve-codebase-architecture](https://skills.sh/mattpocock/skills/improve-codebase-architecture) | mattpocock/skills | 5,355 | ✨ 5/9-5/10 跌出 → 5/11 #10 回榜 |

⬇️ **跌出榜外**（5/10 → 5/11 跌出，共 5 件）：
- agentspace-so 五件全跌：gpt-image-edit（5/10 #6 4,845）、nano-banana-edit（#7 4,801）、image-edit（#8 4,797）、nano-banana-2（#9 4,788）、flux-2-klein（#10 4,786）

> **05-11 觀察**——⚠️ **agentspace-so 推送結束 + mattpocock 三件齊聚**：
>
> ### 1. **agentspace-so 五件全跌出榜（5/10 → 5/11）**
>
> - 5/10 #6-#10 agentspace-so 五件（4,785-4,845 範圍）→ 5/11 全部消失
> - 5 件同步進榜（5/10）→ 5 件同步跌出（5/11），「24 小時觀察期」的渠道推送樣式——非 organic
> - **可能機制**：(1) agentspace-so 自有渠道推送（如 newsletter / Twitter）讓 5/10 install 集中爆發 (2) skills.sh 演算法給予新 publisher 1 日「首頁曝光配額」(3) install 計數重置
> - **與 [[Inference.sh]] 對比**：inference 五件 8 天前佔 Top 5 至今未動；agentspace-so 是「閃光式」進榜
>
> ### 2. **mattpocock 三件齊聚 Top 10**
>
> - grill-me #7 + grill-with-docs #9 ✨（首次）+ improve-codebase-architecture #10
> - 三件齊聚是 5/4 之後第二次（5/4 為三件中 3 件首聚日）；本次 grill-with-docs 首次入榜為「三件全在 + 第 3 件突破」
> - grill-with-docs 5,371 是新進榜（之前 5/4 三件中 install 最低）；意義：mattpocock 的「PRD/Plan/Architecture」工具鏈三件全擴散
>
> ### 3. **inference-sh-skills 五件單日 +370/skill 集體成長**
>
> - 5/10 32,780-32,915 → 5/11 33,153-33,290——五件單日 +370/skill 同步成長
> - 5/9 改名 URL 後的「重新加速」階段；連 2 日（5/10 起恢復至 32k → 5/11 再增至 33k）

## 2026-05-10 — agentspace-so 五件全進榜異象 + inference 大幅恢復

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-image-generation](https://skills.sh/inference-sh-skills/skills/ai-image-generation) | inference-sh-skills/skills | 32,915 | ↑↑ 5/9 18,992 → 32,915（**+13,923，+73%**——大幅恢復至類 5/8 水準） |
| 2 | [ai-video-generation](https://skills.sh/inference-sh-skills/skills/ai-video-generation) | inference-sh-skills/skills | 32,860 | ↑↑ 5/9 18,954 → 32,860（+13,906） |
| 3 | ↑ [ai-avatar-video](https://skills.sh/inference-sh-skills/skills/ai-avatar-video) | inference-sh-skills/skills | 32,793 | ↑ 5/9 #4 18,931 → #3（+13,862） |
| 4 | ↓ [agent-tools](https://skills.sh/inference-sh-skills/skills/agent-tools) | inference-sh-skills/skills | 32,787 | ↓ 5/9 #3 18,934 → #4（+13,853） |
| 5 | [infsh-cli](https://skills.sh/inference-sh-skills/skills/infsh-cli) | inference-sh-skills/skills | 32,780 | 持平 #5（+13,850） |
| 6 | ✨ [gpt-image-edit](https://skills.sh/agentspace-so/runcomfy-agent-skills/gpt-image-edit) | agentspace-so/runcomfy-agent-skills | 4,845 | ✨ **首次入榜**——agentspace-so 第 1 件 |
| 7 | ✨ [nano-banana-edit](https://skills.sh/agentspace-so/runcomfy-agent-skills/nano-banana-edit) | agentspace-so/runcomfy-agent-skills | 4,801 | ✨ **首次入榜**——agentspace-so 第 2 件 |
| 8 | ✨ [image-edit](https://skills.sh/agentspace-so/runcomfy-agent-skills/image-edit) | agentspace-so/runcomfy-agent-skills | 4,797 | ✨ **首次入榜**——agentspace-so 第 3 件 |
| 9 | ✨ [nano-banana-2](https://skills.sh/agentspace-so/runcomfy-agent-skills/nano-banana-2) | agentspace-so/runcomfy-agent-skills | 4,788 | ✨ **首次入榜**——agentspace-so 第 4 件 |
| 10 | ✨ [flux-2-klein](https://skills.sh/agentspace-so/runcomfy-agent-skills/flux-2-klein) | agentspace-so/runcomfy-agent-skills | 4,786 | ✨ **首次入榜**——agentspace-so 第 5 件 |

⬇️ **跌出榜外**（5/9 → 5/10 跌出，共 5 件）：
- wonda-cli（5/9 #6 6,407）、just-scrape（#7 6,294）、soultrace（#8 6,249）、video-edit（#9 4,882）、image-to-video（#10 4,848）——agentspace-so/runcomfy-agent-skills 旗下 video-edit 與 image-to-video 也被同 publisher 的另外 5 件替換

> **05-10 觀察**——⚠️⚠️ **單日連 inference 五件大幅恢復 + agentspace-so 五件首入榜**：
>
> ### 1. **inference 五件單日 +13,900/skill 大幅恢復**
>
> - 5/9 18,930-18,992 → 5/10 32,780-32,915——**單日 +73%/skill**
> - 比 5/9 的「-33%/skill」更大、更詭異
> - **可能機制 A**：URL 重置事件（5/9 改 URL 後 install 計數從 0 重新累計、5/10 補回歷史 install）
> - **可能機制 B**：skills.sh 統計算法二次調整（5/9 大跌 + 5/10 恢復 = 2 日內完成數據遷移）
> - **5/13 fetcher 失效後將難以驗證**——這個事件本身是 skills.sh 端的明顯動作
>
> ### 2. **agentspace-so 五件全進榜——「閃光式品牌推送」**
>
> - 一夜之間 agentspace-so/runcomfy-agent-skills 旗下 5 件全進 Top 10（4,786-4,845）
> - 五件 install 集中在 60 install 區間——極度同步的成長
> - **publisher 觀察**：agentspace-so 自 5/9 起就有 video-edit 與 image-to-video（#9 #10）進榜；5/10 換成另 5 件
> - **「換件」現象**：同一 publisher 一夜換五件 → 不是 organic install，是「skills.sh 演算法給 publisher 配額曝光」或「agentspace-so 內部 install 注水循環不同 skill」
>
> ### 3. **6-10 名洗牌**
>
> - 5/9 的 #6-#10（wonda-cli + just-scrape + soultrace + agentspace-so 兩件）→ 5/10 #6-#10（agentspace-so 五件）
> - **organic 老朋友被閃光推送排擠**——但這只是 1 日異象（5/11 立即恢復）

## 2026-05-09 — inference URL 第二次改名（inference-skills → inference-sh-skills）

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | ↑ [ai-image-generation](https://skills.sh/inference-sh-skills/skills/ai-image-generation) | inference-sh-skills/skills | 18,992 | ↑↑ 5/8 #2 28,547 → #1（**-9,555，-33%**；URL 重置） |
| 2 | ↓ [ai-video-generation](https://skills.sh/inference-sh-skills/skills/ai-video-generation) | inference-sh-skills/skills | 18,954 | ↓↓ 5/8 #1 28,663 → #2（**-9,709，-34%**） |
| 3 | ↑ [agent-tools](https://skills.sh/inference-sh-skills/skills/agent-tools) | inference-sh-skills/skills | 18,934 | ↑ 5/8 #4 28,520 → #3（-9,586） |
| 4 | ↑ [ai-avatar-video](https://skills.sh/inference-sh-skills/skills/ai-avatar-video) | inference-sh-skills/skills | 18,931 | ↑ 5/8 #3 28,522 → #4（-9,591） |
| 5 | [infsh-cli](https://skills.sh/inference-sh-skills/skills/infsh-cli) | inference-sh-skills/skills | 18,930 | 持平 #5（-9,587） |
| 6 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 6,407 | ↓ 5/8 #6 8,635 → #6（**-2,228，-26%**） |
| 7 | [just-scrape](https://skills.sh/scrapegraphai/just-scrape/just-scrape) | scrapegraphai/just-scrape | 6,294 | ↓ 5/8 #7 7,894 → #7（-1,600，-20%） |
| 8 | [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 6,249 | ↓ 5/8 #8 7,553 → #8（-1,304，-17%） |
| 9 | ✨ [video-edit](https://skills.sh/agentspace-so/runcomfy-agent-skills/video-edit) | agentspace-so/runcomfy-agent-skills | 4,882 | ✨ **首次入榜**——agentspace-so 首件 Top 10 |
| 10 | ✨ [image-to-video](https://skills.sh/agentspace-so/runcomfy-agent-skills/image-to-video) | agentspace-so/runcomfy-agent-skills | 4,848 | ✨ **首次入榜**——agentspace-so 第 2 件 |

⬇️ **跌出榜外**（5/8 → 5/9 跌出）：
- grill-me（5/8 #9 5,868）、improve-codebase-architecture（5/8 #10 5,156）—— mattpocock 兩件全跌（重返再跌的循環）

> **05-09 觀察**——⚠️⚠️⚠️ **重大事件：inference URL 第二次改名**：
>
> ### 1. **inference-skills/skills → inference-sh-skills/skills**
>
> - 5/8 為止 5 件 URL 都是 `skills.sh/inference-skills/skills/...`
> - 5/9 起 URL 改為 `skills.sh/inference-sh-skills/skills/...`（加了「-sh」字尾，更貼近 inference.sh 品牌）
> - **這是 5/3 後第二次品牌路徑變更**——5/3 改的是 `infsh-skills` → `inference-skills`，5/9 改為 `inference-sh-skills`
> - **影響範圍**：5 件 install 數同步 -33%（每件 -9,500 左右）
> - **不是真實流失**：5/10 立即恢復至 32k+，證實是「URL 重置造成 install 計數短暫跳水」
> - **教訓**：[[Inference.sh]] 還在頻繁調整品牌路徑，至少出現過 3 個版本（infsh-skills → inference-skills → inference-sh-skills）
>
> ### 2. **wonda-cli / just-scrape / soultrace 三件同步 -20%**
>
> - 不只 inference 五件，6-8 名也大幅下跌
> - **可能機制**：(1) skills.sh 統計算法調整，影響全榜 (2) 同日 organic install 異常清理
>
> ### 3. **agentspace-so 雙件首次入榜 (#9 #10)**
>
> - video-edit 4,882 + image-to-video 4,848——agentspace-so 在前 8 名同步下跌的空檔擠入榜
> - 「organic 退潮 + 新進湧入」典型替換模式
> - 但這只是 5/10 「五件全進榜」異象的前哨——agentspace-so 連續 2 日進榜後再消失

## 2026-05-08 — inference-skills 二次大跌（單日 -2,800/skill）+ find-skills 持續缺席

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | inference-skills/skills | **28,663** | ↓↓ 5/7 31,393 → 28,663（單日 **-2,730，-8.7%**） |
| 2 | [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | inference-skills/skills | 28,547 | ↓↓ 5/7 31,336 → 28,547（單日 **-2,789，-8.9%**） |
| 3 | ↑ [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | inference-skills/skills | 28,522 | ↑ 5/7 #4 → #3（同步集體跌但相對排名上） |
| 4 | ↓ [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | inference-skills/skills | 28,520 | ↓ 5/7 #3 → #4 |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | inference-skills/skills | 28,517 | 持平 #5（−2,757） |
| 6 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,635 | ↓ 5/7 8,762 → 8,635（−127；輕微回調） |
| 7 | [just-scrape](https://skills.sh/scrapegraphai/just-scrape/just-scrape) | scrapegraphai/just-scrape | 7,894 | ↑ 5/7 7,092 → 7,894（+802） |
| 8 | ↑ [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 7,553 | ↑ 5/7 6,846 → 7,553（+707；持續恢復） |
| 9 | ↓ [[src-mattpocock-skills\|grill-me]] | mattpocock/skills | 5,868 | ↓ 5/7 6,529 → 5,868（−661） |
| 10 | ↓ [improve-codebase-architecture](https://skills.sh/mattpocock/skills/improve-codebase-architecture) | mattpocock/skills | 5,156 | ↓ 5/7 5,835 → 5,156（−679） |

⬇️ **跌出榜外**（5/7 在榜 → 5/8 跌出）：無新跌出（find-skills 已連 2 日跌出）

> **05-08 觀察**——⚠️ **inference-skills 第二次大跌事件**（不同於 5/3 改名重置）：
>
> ### 1. **inference-skills 五件單日 -2,800/skill 同步下跌**
>
> - 縱向：5/3 改名後 ~20.5k → 5/4 31.4k 急速恢復 → 5/5-5/6 平穩 ~30-31k → 5/7 微跌 ~31.3k → **5/8 -8.9% 大跌至 ~28.5k**
> - 不像 5/3 那樣是 GitHub repo URL 改名，這次無明顯外部觸發
> - **可能機制**：(1) skills.sh 統計算法二次調整 (2) inference-skills GitHub 端再次操作 (3) install 計算口徑變更（如刪除舊 install 數據）
> - **lint 提醒**：依 [[週綜整-2026-W18]] 教訓，「-2,800/skill 同步下跌」應視為**統計層級事件**而非真實 churn
>
> ### 2. **find-skills 跌出榜外連 2 日**
>
> - 5/6 #6 18,648 → 5/7 跌出 Top 10（推測 #11+）→ 5/8 仍跌出
> - **5 日驟漲（5/3 11.7k → 5/6 18.6k +59%）後一日驟跌**——典型 hype curve 後段
> - 對應 [[src-skills-picks-2026-05]] ast-grep 數據：是否同步減速需 5/9 觀察
>
> ### 3. **mattpocock 兩件穩定回到 #9/#10**
>
> - grill-me 5,868 + improve-codebase-architecture 5,156——非 inference-skills 的 organic skill 在「噪音事件」下相對排名上升
> - 5/4 三件全進 Top 10 → 5/5 三件全跌出 → 5/7-5/8 兩件回歸——**mattpocock 的「PRD/Issue/Plan」應用領域有持續用戶基數**
>
> ### 4. **wonda-cli 持平 + just-scrape / soultrace 加速**
>
> - just-scrape +802、soultrace +707——「web scraping skill」+「agent observability skill」兩條軌道平穩成長

## 2026-05-07 — find-skills 跌出榜外日 + mattpocock 兩件回歸

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | ↑ [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | inference-skills/skills | 31,393 | ↑ 5/6 #2 → #1（−32；ai-image vs ai-video 第三次互換） |
| 2 | ↓ [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | inference-skills/skills | 31,336 | ↓ 5/6 #1 → #2（−133） |
| 3 | ↑ [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | inference-skills/skills | 31,282 | ↑ 5/6 #4 → #3（−47） |
| 4 | ↓ [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | inference-skills/skills | 31,278 | ↓ 5/6 #3 → #4（−65） |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | inference-skills/skills | 31,274 | 持平 #5（−50） |
| 6 | ✨ [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,762 | ↑ 5/6 #8 8,577 → #6（+185；找回排名） |
| 7 | [just-scrape](https://skills.sh/scrapegraphai/just-scrape/just-scrape) | scrapegraphai/just-scrape | 7,092 | ↓ 5/6 #7 8,857 → #7（−1,765；大幅波動但仍 Top 10） |
| 8 | [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 6,846 | ↓ 5/6 #9 7,190 → #8（−344） |
| 9 | ✨ [[src-mattpocock-skills\|grill-me]] | mattpocock/skills | 6,529 | ✨ **重返榜**（5/4 #8 5,372 → 5/5-5/6 跌出 → 5/7 #9 6,529 回歸；3 日內 +1,157） |
| 10 | ✨ [improve-codebase-architecture](https://skills.sh/mattpocock/skills/improve-codebase-architecture) | mattpocock/skills | 5,835 | ✨ **重返榜**（5/4 #9 4,693 → 5/5-5/6 跌出 → 5/7 #10 5,835 回歸） |

⬇️ **跌出榜外**（5/6 在榜 → 5/7 跌出）：
- **find-skills**（5/6 #6 18,648）⚠️ 從 5/3-5/6 連 4 日加速擴散後**單日跌出 Top 10**——重大轉折
- microsoft-foundry（5/6 #10 6,762）—— 連 2 日跌出

> **05-07 觀察**——**find-skills 急轉直下日**：
>
> ### 1. **find-skills 跌出榜外，5 日 hype curve 終結**
>
> - 縱向：5/3 11,707 → 5/4 13,939（+19%）→ 5/5 15,318（+10%）→ 5/6 18,648（+22% 加速）→ 5/7 跌出 Top 10
> - **「-3,000+ install 一日」單日跌幅異常巨大**——若是 organic 流失需要 install 計數方式變更解釋（如清理 spam install）
> - **可能機制**：(1) skills.sh 統計重置（如 5/3 改名事件的 inference-skills 五件 -7k 模式）(2) Vercel-labs 渠道結束推送 (3) 真實流失但異常大
> - **教訓**：5/6 的「find-skills 異常跳升 +21.7%」觀察被本日**完全推翻**——警示「單日異常變化」不可作為持續趨勢推論
>
> ### 2. **mattpocock 兩件 ✨ 重返榜**
>
> - grill-me 5/4 #8 → 5/7 #9（隔 2 日回歸 +1,157）
> - improve-codebase-architecture 5/4 #9 → 5/7 #10（隔 2 日回歸 +1,142）
> - 第三件 grill-with-docs 仍未回——三件中**第 3 件擴散弱**
>
> ### 3. **inference-skills 五件第二日微跌**
>
> - 5/6 → 5/7 五件均小幅減（-32 至 -65/skill）；統計噪音範圍
> - 這個「微跌」是 5/8 大跌的前兆
>
> ### 4. **just-scrape 大幅波動 -1,765 但仍 #7**
>
> - 5/6 8,857 → 5/7 7,092 install 大幅變化但排名持平
> - 反映 install 計數可能有「校正/重置」每日波動

## 2026-05-06 — find-skills 暴漲日

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | inference-skills/skills | **31,469** | 🔄 從 5/5 #2 升 #1（+1,177） |
| 2 | [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | inference-skills/skills | 31,425 | ↓ 從 5/5 #1 降 #2（+1,098） |
| 3 | [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | inference-skills/skills | 31,343 | ↑ 5/5 #4 → #3（+1,104） |
| 4 | [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | inference-skills/skills | 31,329 | ↓ 5/5 #3 → #4（+1,086） |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | inference-skills/skills | 31,324 | 持平 #5（+1,090） |
| 6 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | **18,648** | ⬆️ **異常跳升 +3,330（單日 +21.7%）** |
| 7 | [just-scrape](https://skills.sh/scrapegraphai/just-scrape/just-scrape) | scrapegraphai/just-scrape | 8,857 | ↓ 5/5 #7 9,068 → #7（−211，輕微回調） |
| 8 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,577 | ↑ 5/5 #8（+283） |
| 9 | ✨ [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 7,190 | ✨ **重返榜**（5/2 上一次 #7 → 5/3-5/5 跌出 → 5/6 #9 回歸） |
| 10 | [microsoft-foundry](https://skills.sh/microsoft/azure-skills/microsoft-foundry) | microsoft/azure-skills | 6,762 | ↑ 5/5 #9（+618） |

⬇️ **跌出榜外**（5/5 在榜 → 5/6 跌出）：azure-deploy（5/5 #10 6,093）

> **05-06 觀察**：
>
> ### 1. **find-skills 異常暴漲 +3,330（單日 +21.7%）**
>
> - 縱向：5/3 11,707 → 5/4 13,939 → 5/5 15,318 → 5/6 18,648。**4 日內 +59.3%（+6,941）**
> - 這個 meta-skill「找其他 skill 的 skill」在加速擴散——可能機制：
>   - skill discovery 行為成為 agent 工作流標配（裝什麼 skill 不再靠人腦推薦）
>   - vercel-labs 渠道推送（Vercel 官方背書效應）
>   - skills.sh 自身用戶基數擴大，find-skills 自然受益最多
> - **下游影響**：[[src-skills-picks-2026-05]] 中 ast-grep 同期重新加速（+106→+116→+157）可能與此關聯——更多人用 find-skills → 更多人發現 ast-grep
>
> ### 2. **soultrace 重返榜（5/2 → 5/6 隔 4 日）**
>
> - 5/2 首次上榜 #7 7,207，5/3-5/5 連 3 日跌出，5/6 #9 7,190 重返
> - install 數略降但仍上榜——**Top 10 入榜門檻 5/6 為 6,762（microsoft-foundry）**，比 5/3 的 4,948 高出 36%
> - soultrace 是 AI agent observability skill，可能對應 PH 5/4-5/6 「agent ROI / agent 監測」浪潮（Waydev Agent / Kanwas）
>
> ### 3. **Top 1/2 第二次互換**
>
> - 5/3 重置後 ai-video #1 vs ai-image #2（差 16 install），5/6 ai-image #1 vs ai-video #2（差 44 install）
> - 同步走勢，差距永遠 < 100 install——**5 件 inference-skills Top 5 是統計噪音導致的偽排名**，不應視為「ai-image 比 ai-video 更熱門」
>
> ### 4. **Top 10 入榜門檻三日漲 36%**
>
> - 5/3: 4,948 → 5/4: 4,585 → 5/5: 6,093 → 5/6: 6,762
> - 5/4 短暫下跌（mattpocock 三件 4,500-5,400 進來壓低門檻），5/5-5/6 快速回升
> - 反映 skills.sh 整體生態的 install 量在實質擴張（不只是 inference-skills 五件成長）

## 2026-05-05 — mattpocock 三件全跌出 + just-scrape ✨ + microsoft 回歸

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | inference-skills/skills | 30,327 | ↓ 5/4 31,426 → 30,327（−1,099，inference-skills 集體微跌） |
| 2 | [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | inference-skills/skills | 30,292 | ↓ 5/4 31,405 → 30,292（−1,113） |
| 3 | ↑ [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | inference-skills/skills | 30,243 | ↑ 5/4 #4 → #3（−1,112） |
| 4 | ↓ [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | inference-skills/skills | 30,239 | ↓ 5/4 #3 → #4（−1,121） |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | inference-skills/skills | 30,234 | 持平（−1,119） |
| 6 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | 15,318 | ↑ 5/4 13,939 → 15,318（+1,379） |
| 7 | ✨ [just-scrape](https://skills.sh/scrapegraphai/just-scrape/just-scrape) | scrapegraphai/just-scrape | 9,068 | ✨ **新進榜** |
| 8 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,294 | ↑ 5/4 #7 6,776 → #8（+1,518） |
| 9 | ✨ [microsoft-foundry](https://skills.sh/microsoft/azure-skills/microsoft-foundry) | microsoft/azure-skills | 6,144 | **重返榜**（5/1 #9 → 5/2-5/4 跌出 → 5/5 回歸） |
| 10 | ✨ [azure-deploy](https://skills.sh/microsoft/azure-skills/azure-deploy) | microsoft/azure-skills | 6,093 | ✨ **新進榜（microsoft 第二件）** |

⬇️ **跌出榜外**（5/4 在榜 → 5/5 跌出）：[[src-mattpocock-skills|grill-me]]（5/4 #8 5,372）、improve-codebase-architecture（5/4 #9 4,693）、grill-with-docs（5/4 #10 4,585）—— **mattpocock 三件全跌出**

> **05-05 觀察**：
>
> ### 1. **inference-skills Top 5 一日內集體微跌 −1,100**
>
> - 5/4 31.4k → 5/5 30.3k（−1,100，3.5%）。5 件同步下跌、差距固定（差 16-44 install）。
> - **可能機制**：
>   - skills.sh 算法每日 install 數重統計（包含取消/到期過濾）
>   - 不是真實 uninstall，是計數方法調整
> - 5/6 即恢復到 31.4k → **驗證了「日間波動，非趨勢」**
>
> ### 2. **mattpocock 三件全跌出（grill-me / improve-codebase-architecture / grill-with-docs）**
>
> - 5/4 三件同日進榜（#8/#9/#10）→ 5/5 全部跌出
> - **單日大量上榜 + 單日全部跌出 = 短暫衝高（promo / batch install）**
> - 對比 inference-skills 持續穩定占榜：mattpocock 缺乏「集合擴散」效應的持續能量
> - **wiki 已有 [[src-mattpocock-skills]] 條目**，本日資料補充：mattpocock 的 grill-me / improve-codebase-architecture / grill-with-docs 三件曾於 5/4 同步登榜，但缺乏批次擴散後續能量
>
> ### 3. **just-scrape ✨ 新進榜 #7 9,068**
>
> - scrapegraphai/just-scrape——爬蟲 skill 進入 Top 10
> - 對應 5/4 PH #7 Intuned Agent（browser automation）+ 5/6 HN #5 Cloudflare agents 浪潮：「agent 自主執行外部任務」需求對 scraping skill 的拉動
>
> ### 4. **microsoft 兩件重返榜（microsoft-foundry + azure-deploy ✨）**
>
> - 5/1 microsoft-foundry #9 → 5/2-5/4 跌出 → 5/5 回到 #9
> - 5/5 azure-deploy ✨ 首次進榜 #10
> - 印證 W18 觀察「企業 skill 長尾遞減」**並非單向**——可能由內部教育推 / 季度 onboarding 推動回流

## 2026-05-04 — Inference.sh install 完全恢復 + mattpocock 三件登榜

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | inference-skills/skills | **31,426** | ⬆️ 5/3 20,628 → **+10,798（重置後完全恢復）** |
| 2 | [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | inference-skills/skills | 31,405 | ⬆️ 5/3 20,612 → **+10,793** |
| 3 | [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | inference-skills/skills | 31,360 | ⬆️ 5/3 20,598 → **+10,762** |
| 4 | [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | inference-skills/skills | 31,355 | ⬆️ 5/3 20,592 → **+10,763** |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | inference-skills/skills | 31,353 | ⬆️ 5/3 20,590 → **+10,763** |
| 6 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | 13,939 | ↑ 5/3 11,707 → +2,232 |
| 7 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 6,776 | ✨ **重返榜**（5/2 #8 → 5/3 跌出 → 5/4 回歸 #7） |
| 8 | [grill-me](https://skills.sh/mattpocock/skills/grill-me) | [[src-mattpocock-skills\|mattpocock]]/skills | 5,372 | ✨ **重返榜**（5/1 #8 → 5/2-5/3 跌出 → 5/4 回歸 #8） |
| 9 | ✨ [improve-codebase-architecture](https://skills.sh/mattpocock/skills/improve-codebase-architecture) | [[src-mattpocock-skills\|mattpocock]]/skills | 4,693 | ✨ **新進榜（mattpocock 第二件）** |
| 10 | ✨ [grill-with-docs](https://skills.sh/mattpocock/skills/grill-with-docs) | [[src-mattpocock-skills\|mattpocock]]/skills | 4,585 | ✨ **新進榜（mattpocock 第三件）** |

⬇️ **跌出榜外**（5/3 在榜 → 5/4 跌出）：xixu-me/skills 全四件（github-actions-docs / readme-i18n / use-my-browser / openclaw-secure-linux-cloud）

> **05-04 觀察**：
>
> ### 1. **Inference.sh install 完全恢復——確認 5/3 是統計重置非真實流失**
>
> - 5/3 重置後 20.5k → 5/4 31.4k（單日 +10,800）。**5 件 Top 5 安裝數同步躍升 +10,762~+10,798**——精準同步排除「自然成長」可能性
> - **驗證 [[Inference.sh]] 重大事件分析**：repo 改名（infsh-skills → inference-skills）造成的統計斷層在 24h 內由 skills.sh 後台修補
> - 對任何依賴 install 數的 OSS 投資判斷（[[src-multica-devv-ai盡調]] R-1 評分）：**24h 短期波動可能完全是統計層級事件**
>
> ### 2. **mattpocock 三件同日登榜（grill-me + improve-codebase-architecture ✨ + grill-with-docs ✨）**
>
> - [[src-mattpocock-skills]] 一日內三件 Top 10（#8/#9/#10）——「skill 集合作為單一發行單位」典型擴散
> - install 數聚集 4,585-5,372 窄區間 → 同期推送批次安裝信號
> - 但 **5/5 三件全跌出** → 單日衝高，無持續性（與 inference-skills 持續穩定形成對比）
>
> ### 3. **xixu-me 4 件 5/3 全進榜 → 5/4 全跌出**
>
> - 5/3 #7-#10 xixu-me 全占（github-actions-docs / readme-i18n / use-my-browser / openclaw-secure-linux-cloud）→ 5/4 全部消失
> - 與 mattpocock 5/4 → 5/5 完全相同模式：**「集合發行者」一日大量登榜後一日全退**
> - 是否為 trending 算法的「同帳號集中扣分」機制？需後續驗證
>
> ### 4. **wonda-cli 跨日跌出/重返常態化**
>
> - 5/1 #7 → 5/2 #8 → 5/3 跌出 → 5/4 回 #7 → 5/5 #8 → 5/6 #8——**反覆游離 #7-#10 區段**
> - 是 trending 算法波動的指標：附近的 skill 推進可能擠出/釋放此 slot

## 2026-05-03 ⚠️ 重大事件日

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-video-generation](https://skills.sh/inference-skills/skills/ai-video-generation) | **inference-skills**/skills（前 infsh-skills） | **20,628** | 🔄 改名 + 從 #2 升 #1 |
| 2 | [ai-image-generation](https://skills.sh/inference-skills/skills/ai-image-generation) | **inference-skills**/skills | 20,612 | 🔄 改名 + 從 #1 降 #2 |
| 3 | [ai-avatar-video](https://skills.sh/inference-skills/skills/ai-avatar-video) | **inference-skills**/skills | 20,598 | 🔄 改名 + 從 #3 持平 |
| 4 | [agent-tools](https://skills.sh/inference-skills/skills/agent-tools) | **inference-skills**/skills | 20,592 | 🔄 改名 + 從 #4 持平 |
| 5 | [infsh-cli](https://skills.sh/inference-skills/skills/infsh-cli) | **inference-skills**/skills | 20,590 | 🔄 改名 + 從 #5 持平 |
| 6 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | 11,707 | ⬇️ 安裝數倒退（5/2: 13,007 → 5/3: 11,707，−1,300） |
| 7 | [github-actions-docs](https://skills.sh/xixu-me/skills/github-actions-docs) | xixu-me/skills | 4,987 | ↑ 從 5/2 #9（4,715）升 #7 |
| 8 | ✨ [readme-i18n](https://skills.sh/xixu-me/skills/readme-i18n) | xixu-me/skills | 4,955 | ✨ **新進榜** |
| 9 | [use-my-browser](https://skills.sh/xixu-me/skills/use-my-browser) | xixu-me/skills | 4,954 | ↑ 從 5/2 #10（4,706）持平 |
| 10 | ✨ [openclaw-secure-linux-cloud](https://skills.sh/xixu-me/skills/openclaw-secure-linux-cloud) | xixu-me/skills | 4,948 | ✨ **新進榜** |

⬇️ **跌出榜外**（5/2 在榜 → 5/3 跌出）：soultrace（5/2 #7 7,207）、wonda-cli（5/2 #8 6,270）

> **05-03 重大事件分析**：
>
> ### 1. **infsh-skills → inference-skills 改名 + 安裝數重置**
>
> - 5/2 仍稱 `infsh-skills`，5 個 skill 安裝數 27.5k+；5/3 突然改稱 `inference-skills`，安裝數同步跌至 20.5k+
> - **單日 −7,000+ 安裝**——這不是真實流失，是 **repo URL 改名導致 skills.sh 重新統計**
> - 命名統一：`infsh-` 是 Inference.sh 的縮寫；新名稱與 [[Anthropic]] / [[OpenAI]] 等競品「明確品牌」風格一致
> - **Top 1 與 Top 2 順位互換**（ai-image vs ai-video）但差距僅 16 install，可能是統計刷新時機差異
>
> ### 2. **xixu-me/skills 開始壟斷 #7-#10**
>
> 一個帳號占 4 個 Top 10 位置（github-actions-docs / readme-i18n ✨ / use-my-browser / openclaw-secure-linux-cloud ✨）
> - **「skill 集合作為單一發行單位」模式**重複 inference-skills 策略——一個 GitHub 帳號發多個 skill 同步推
> - 安裝數聚集 4,948-4,987 極窄區間 → 同期推送 / 批次安裝信號
>
> ### 3. **vercel-labs/find-skills 倒退**
>
> 5/1: 17,687 → 5/2: 13,007 → 5/3: 11,707（兩日 −5,980）——meta-skill「找其他 skill」需求似乎在減退？或是同樣有 repo URL 重新統計問題？需查核
>
> ### 4. **soultrace 一日上榜又消失**
>
> 5/1 不在 → 5/2 #7 7,207 ✨ → 5/3 跌出。可能是 spike 後消退、或是 trending 算法的時間窗變動

## 2026-05-02

| # | Skill | Source | Installs | 變化 |
|---|-------|--------|----------|------|
| 1 | [ai-image-generation](https://skills.sh/infsh-skills/skills/ai-image-generation) | infsh-skills/skills | **28,028** | ↑ 5/1 27,775（+253） |
| 2 | [ai-video-generation](https://skills.sh/infsh-skills/skills/ai-video-generation) | infsh-skills/skills | 27,936 | ↑ 5/1 27,654（+282） |
| 3 | ↑ [ai-avatar-video](https://skills.sh/infsh-skills/skills/ai-avatar-video) | infsh-skills/skills | 27,900 | **↑ 從 5/1 #6 升 #3**（+12,003 大跳） |
| 4 | ↓ [agent-tools](https://skills.sh/infsh-skills/skills/agent-tools) | infsh-skills/skills | 27,894 | 5/1 #3 → #4 |
| 5 | ↓ [infsh-cli](https://skills.sh/infsh-skills/skills/infsh-cli) | infsh-skills/skills | 27,882 | 5/1 #4 → #5 |
| 6 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | 13,007 | ⬇️ 5/1 #5 17,687 → #6（−4,680） |
| 7 | ✨ [soultrace](https://skills.sh/soultrace-ai/soultrace-skill/soultrace) | soultrace-ai/soultrace-skill | 7,207 | ✨ **新進榜** |
| 8 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 6,270 | ⬇️ 5/1 #7 8,509 → #8（−2,239） |
| 9 | ✨ [github-actions-docs](https://skills.sh/xixu-me/skills/github-actions-docs) | xixu-me/skills | 4,715 | ✨ **新進榜（xixu-me 首件）** |
| 10 | ✨ [use-my-browser](https://skills.sh/xixu-me/skills/use-my-browser) | xixu-me/skills | 4,706 | ✨ **新進榜** |

⬇️ **跌出榜外**（5/1 在榜 → 5/2 跌出）：[[src-mattpocock-skills|grill-me]]（5/1 #8 6,844）、microsoft-foundry（5/1 #9 6,392）、azure-diagnostics（5/1 #10 6,290）

> **05-02 觀察**：
>
> ### 1. **ai-avatar-video 異常跳升 +12,003**
>
> 從 5/1 #6 15,897 → 5/2 #3 27,900——**一日內 +12,003 install**。這個跳升異常巨大：
> - 可能是該 skill 突然爆紅（Anthropic / 其他平台推薦？）
> - 可能是 skills.sh 算法調整或 install 統計合併（與 ai-image-video 共用安裝事件？）
> - **需查核**：infsh-skills 其他 skill 同期變化僅 +200~280，唯獨 avatar-video 跳 12k——強烈異常信號
>
> ### 2. **microsoft/azure-skills 兩件直接跌出 Top 10**
>
> 5/1 microsoft-foundry #9 + azure-diagnostics #10 → 5/2 全部跌出榜外。對應前面對「企業 skill 長尾遞減」的監測重點——果然發生了
>
> ### 3. **xixu-me/skills 首次進榜**
>
> 5/2 同日 #9 + #10 兩件，都是 xixu-me 帳號——「批次推送 + 安裝數聚集 4,706-4,715」symptom 與 inference-skills Top 5 模式雷同；**新興「skill 集合發行者」**
>
> ### 4. **mattpocock/grill-me 跌出**
>
> 5/1 #8 6,844 → 5/2 跌出榜外。可能 5/2 名單重新洗牌（被 soultrace 等新進榜擠出）
>
> ### 5. **vercel-labs/find-skills 5/2 開始倒退**
>
> 5/1 17,687（#5）→ 5/2 13,007（#6，−4,680）——meta-skill「找其他 skill」的 install 計數可能在被重統計或大量解除安裝

## 2026-05-01（首日基線）

| # | Skill | Source | Installs |
|---|-------|--------|----------|
| 1 | [ai-image-generation](https://skills.sh/infsh-skills/skills/ai-image-generation) | infsh-skills/skills | **27,775** |
| 2 | [ai-video-generation](https://skills.sh/infsh-skills/skills/ai-video-generation) | infsh-skills/skills | 27,654 |
| 3 | [agent-tools](https://skills.sh/infsh-skills/skills/agent-tools) | infsh-skills/skills | 27,617 |
| 4 | [infsh-cli](https://skills.sh/infsh-skills/skills/infsh-cli) | infsh-skills/skills | 27,597 |
| 5 | [find-skills](https://skills.sh/vercel-labs/skills/find-skills) | vercel-labs/skills | 17,687 |
| 6 | [ai-avatar-video](https://skills.sh/infsh-skills/skills/ai-avatar-video) | infsh-skills/skills | 15,897 |
| 7 | [wonda-cli](https://skills.sh/degausai/wonda/wonda-cli) | degausai/wonda | 8,509 |
| 8 | [grill-me](https://skills.sh/mattpocock/skills/grill-me) | mattpocock/skills | 6,844 |
| 9 | [microsoft-foundry](https://skills.sh/microsoft/azure-skills/microsoft-foundry) | microsoft/azure-skills | 6,392 |
| 10 | [azure-diagnostics](https://skills.sh/microsoft/azure-skills/azure-diagnostics) | microsoft/azure-skills | 6,290 |

> **05-01 首日觀察（基線）**——本月起新增此來源。為新進榜（✨）建立基線，後續日報才能標註變化。
>
> ### 結構性觀察
>
> 1. **`infsh-skills/skills` 一家獨佔 Top 1-4 + #6** — Inference.sh 自家 skill 集 5 件占榜，安裝數聚集於 ~27.5k–27.7k 區間（極窄區間 → 同期推送/批次安裝信號），加上 ai-avatar-video 共 5 名進入 Top 10。**這是「skill 集合作為單一發行單位」的典型擴散**——使用者裝 infsh-cli 順便裝其他 4 個。
> 2. **`microsoft/azure-skills` Top 9 + 10**（依本日表）以及 raw chunk 中後段更多 azure-skills——**企業級 skill 包以「廣度」獲得分散安裝**，與 infsh 的「單一品牌+多 skill」策略不同。
> 3. **個人開發者 skill 進榜**：
>    - #5 vercel-labs/find-skills（17,687）—— Vercel 官方但概念 meta（找其他 skill 的 skill）
>    - #7 degausai/wonda-cli（8,509）—— Wonda 是個 CLI agent
>    - #8 [[src-mattpocock-skills|mattpocock]]/grill-me（6,844）—— 知名 TS 教育者 Matt Pocock 的 skill 集；wiki 已有 [[src-mattpocock-skills]] 條目
> 4. **[[src-skill-ast-grep]] 不在 Top 10**：4,073 install（04-30）/ 4,138（05-02）—— 排在 #11+（具體位置需查 raw 後段），確認 [[src-skills-picks-2026-04]] 的「ast-grep 連續精選」是 fetcher fallback 假象，不是社群真正的 organic 排名霸主。
>
> ### 跨來源連動
>
> - **[[src-claude-for-creative-work]] 04-28 公告**：Anthropic 與 8 個創意工具夥伴推 MCP connector——對應本榜 #1 ai-image-generation + #2 ai-video-generation + #6 ai-avatar-video 三個 infsh AI 媒體 skill 已霸榜。「AI 圖像/影片生成 skill 化」是早於 Anthropic 公告就成立的市場現實。
> - **[[src-andrej-karpathy-skills]]**：103k stars（GitHub）但 skills.sh trending 沒進 Top 10？需查 install 數——可能新 repo 安裝累積尚未追上 infsh / vercel / Microsoft 的長期累積。
>
> ### 監測重點（後續日報追蹤）
>
> - infsh-skills 五件是否同步成長（批次擴散典型特徵）vs 個別分化
> - microsoft/azure-skills 後段是否被擠出 Top 10（企業 skill 長尾遞減）
> - 是否有新 skill 衝入 Top 10（標 ✨）—— [[Anthropic]] 04-28 創意 connector 對應 skill 是否上榜
> - ast-grep 是否從 #11+ 升入 Top 10（對應安裝數變化）

## 處理慣例

- **新進榜標 ✨**：第一次出現於 Top 10 的 skill 以 ✨ 標於名稱前
- **跌出榜外標 ⬇️**：上一日在榜、當日跌出
- **獨立頁觸發**：手動決定（不自動建獨立頁，避免 [[src-skills-picks-2026-04]] 失敗教訓）
- **異常跳升**：單日 +X% installs 或 +N rank 變化異常時重點標註
