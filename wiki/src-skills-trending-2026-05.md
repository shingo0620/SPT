---
title: skills.sh Trending Top 10 月報 — 2026-05
type: source
sources: [skills-trending-2026-05-01.md]
created: 2026-05-01
updated: 2026-05-01
tags: [skills-sh, agent-skills, trending, monthly-digest]
---

# skills.sh Trending Top 10 — 2026 年 5 月

> 每日自動收集 [skills.sh/trending](https://skills.sh/trending) Top 10（按 installs 降序），由 LLM 觀察排名變化、新進榜（✨）與生態結構。日期依新到舊排列。
>
> 與 [[src-skills-picks-2026-04]]（編輯精選，已停發）的對比：trending 反映 organic 流行度，是 skills.sh 上「真正最受歡迎」skills 的縱向追蹤。

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
