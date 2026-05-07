---
title: Inference.sh
type: entity
sources: [skills-trending-2026-05-01.md, skills-trending-2026-05-02.md, skills-trending-2026-05-03.md, skills-trending-2026-05-04.md, skills-trending-2026-05-05.md, skills-trending-2026-05-06.md]
created: 2026-05-04
updated: 2026-05-07
tags: [organization, agent-skills, ai-media, skills-sh, skill-publisher]
---

# Inference.sh

> AI 媒體生成 skill 集合的主要發行者，2026-05-03 將 GitHub 帳號從 `infsh-skills` 改名為 `inference-skills`，是 [[skills.sh]] trending 上 5 件 skill 持續霸佔 Top 1-5 的單一最大 skill 集合。

## 簡介

Inference.sh 是一家專注於 AI 媒體生成（圖像/影片/avatar）的 skill 發行者，在 [[skills.sh]] 平台上以「skill 集合作為單一發行單位」策略佔據 trending 排行榜頂端。

### 五大核心 skill（霸榜 Top 1-5）

| Skill | 用途 |
|-------|------|
| **ai-image-generation** | AI 圖像生成 |
| **ai-video-generation** | AI 影片生成 |
| **ai-avatar-video** | AI 虛擬人物影片 |
| **agent-tools** | agent 工具集 |
| **infsh-cli** | Inference.sh 官方 CLI |

5 件 skill 在 [[skills.sh]] trending 上**持續同步增長**——典型「裝 infsh-cli 順便裝其他 4 個」批次擴散模式。

## 重大事件 — 2026-05-03 repo 改名（24 小時恢復）

| 日期 | GitHub 帳號 | Top 5 安裝數區間 |
|------|------------|----------------|
| 2026-05-01 | `infsh-skills` | 27,597 ~ 27,775 |
| 2026-05-02 | `infsh-skills` | 27,882 ~ 28,028（單日 +200~280） |
| 2026-05-03 | **`inference-skills`** | **20,590 ~ 20,628（單日 −7,000~7,400 重置）** |
| 2026-05-04 | `inference-skills` | **31,353 ~ 31,426（單日 +10,762 ~ +10,798 完全恢復）** |
| 2026-05-05 | `inference-skills` | 30,234 ~ 30,327（單日 −1,099 ~ −1,121 集體微跌） |
| 2026-05-06 | `inference-skills` | 31,324 ~ 31,469（恢復至 31.4k 區間） |

> **5/3 重置非真實流失，已被 5/4 數據驗證**——5 件 Top 5 skill 在 5/4 同步躍升 +10,762~+10,798（精準對齊排除自然成長可能性）。改名觸發的統計斷層在 24h 內由 [[skills.sh]] 後台修補完成。命名統一：`infsh-` 縮寫 → `inference-` 全稱，與 [[Anthropic]] / [[OpenAI]] 等明確品牌風格一致。
>
> **5/5 集體微跌 −1,100 後 5/6 即恢復 31.4k**——進一步驗證日間波動是 [[skills.sh]] 算法重統計（包含取消/到期過濾），非真實 uninstall。**對任何依賴 install 數的 OSS 投資判斷（[[src-multica-devv-ai盡調]] R-1 評分）：24h 短期波動可能完全是統計層級事件，需以 7+ 日趨勢為基準。**

### 重大事件意義

1. **品牌成熟化**——從工程 codename（infsh）轉為 marketing-friendly 全名（inference）
2. **安裝數重置教訓**——對任何依賴 [[skills.sh]] install 數的觀察都需考量「URL 變動」可能造成的數據斷層
3. **Top 1/2 順位互換**——5/3 改名後 ai-video 從 #2 升 #1（差距僅 16 install），可能是統計刷新時機差異

## 與 wiki 其他主題的關聯

- **[[skills.sh]]** — Inference.sh 是該平台上 trending 第一名單一發行者
- **[[src-skills-trending-2026-05]]** — 5/1-5/3 三日連續 5 件 skill 占 Top 1-5 詳細追蹤
- **[[src-claude-for-creative-work]]** — 2026-04-28 [[Anthropic]] 與 8 個創意工具夥伴推 MCP connector；Inference.sh 的 AI 媒體 skill 早於該公告就主導市場，**「AI 圖像/影片生成 skill 化」是先於 Anthropic 戰略的市場現實**
- **[[src-skill-ast-grep]]** 與 Inference.sh 對比 — ast-grep 安裝 4,324（5/3）vs Inference.sh Top 1 20,628——數量級差異反映**「coding skill」vs「AI media skill」**兩個市場的規模落差
- **競爭者**：
  - `xixu-me/skills` — 5/2 起進 Top 7-10，4 件 skill 以類似「集合發行」策略佔位（github-actions-docs、readme-i18n、use-my-browser、openclaw-secure-linux-cloud）
  - `vercel-labs/skills` — meta-skill「找 skill 的 skill」find-skills 5/3 跌至 11,707（單日 −1,300）
  - `microsoft/azure-skills` — 5/1 #9 #10 兩件 → 5/2 已跌出 Top 10

## 觀察重點

- **改名後 Inference.sh Top 5 是否回升至原 27.5k+ 區間**——若回升表示 install 真實未流失，只是統計重新計算；若不回升表示原數字虛高
- **是否擴張新 skill**——5 件 skill 已成熟，下一波擴張方向？
- **與其他「AI media skill」競品**——OpenAI Sora skill / Google Veo skill 等是否會在 [[skills.sh]] 上挑戰？

## 不確定 / 待查項目

- ⚠️ 「Inference.sh」公司詳情（成立時間、團隊、商業模式）暫無資料；目前僅從 [[skills.sh]] trending 觀察其 skill 表現
- ⚠️ skill 與其底層 AI 模型（如 Stable Diffusion / Sora 等）的關係：是 wrapper 還是有自家模型？
