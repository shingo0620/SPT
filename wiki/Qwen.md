---
title: Qwen
type: entity
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [qwen, alibaba, ai-model, open-source, coding-agent]
---

# Qwen（通義千問）

> 本頁統整本 wiki 多處提及的 Qwen 脈絡；來源為空表示為跨來源歸納。

## 一句話定位

阿里巴巴雲（Alibaba Cloud）旗下的開源 LLM 系列，**主打「為 coding agent 而生」的甜蜜點定位**——以 Apache 2.0 授權與多種規模（dense + MoE）切入開源生態，與 [[DeepSeek]] 並列中國開源 LLM 雙雄。

## 模型系列（wiki 涉及版本）

| 代號 | 規模／類型 | 主要定位 | wiki 涉及 |
|------|-----------|---------|----------|
| **Qwen3.6-27B** | 27B dense | 「coding agent 的甜蜜點開源 dense 模型」 | [[src-producthunt-2026-04]] 04-23 #15（91 票）、[[src-hn-2026-04]] 04-22 #11 |
| **Qwen3.6-Max-Preview** | MoE 旗艦 | 「為 agentic coding 打造的旗艦 Qwen」 | [[src-producthunt-2026-04]] 04-22 #13（88 票） |
| Qwen 3 / 2.5 / 2 / 1.5 / 1 | 多代 | 訓練資料層 | — |

## 核心策略：規格分層

Qwen 同時推出兩款規格的策略意圖明顯：
- **27B dense**——「甜蜜點」：能在單張 H100 / RTX 4090 跑、本地部署友善、coding 能力強
- **Max-Preview**（MoE 旗艦）——對標 [[Anthropic]] Claude Opus、[[DeepSeek]] V4 的雲端旗艦

→ 涵蓋「個人開發者本地跑」與「企業雲端用」兩個市場

## 與 [[src-reddit-eli5-2026-04]] 04-24 #11（外接顯卡 ELI5）的連動

[[src-reddit-eli5-2026-04]] 04-24 中「為何外接顯卡不像外接硬碟普及」被問起——eGPU 的關注度回升正源於 Qwen3.6-27B 等中型開源模型可在 16-24GB VRAM 上跑——個人「本地推論硬體」需求帶動 eGPU 議題復活。

## 競爭版圖

| 模型系列 | 公司 | 開源 | 規模 | 1M context | wiki 涉及 |
|---------|------|------|------|-----------|----------|
| **Qwen 3.6** | Alibaba | ✅ Apache 2.0 | 27B / Max | — | 本頁 |
| [[DeepSeek]] V4 | DeepSeek | ✅ MIT/Apache | 671B MoE | ✅ | 04-24 |
| [[Anthropic]] Claude 4.7 | Anthropic | ❌ | 閉源 | ✅ | wiki 主角 |
| Llama 3 | Meta | ✅ | 405B / 70B / 8B | — | 較少提及 |

## 開源 LLM 在中國的雙雄

DeepSeek 與 Qwen 同為中國開源 LLM 主力，差異化：
- **[[DeepSeek]]**——強推理（R1）、長 context（V4 1M）、純粹開源策略
- **Qwen**——強多語言（中文）、規格分層（dense + MoE）、與雲端服務（Alibaba Cloud）綁定

## 相關頁面

- [[DeepSeek]]（同類中國開源 LLM 雙雄）
- [[Anthropic]] / [[Google]] / [[OpenAI]]（閉源前沿廠商）
- [[src-producthunt-2026-04]] / [[src-hn-2026-04]]（近期動態）
- [[src-reddit-eli5-2026-04]]（eGPU 議題的本地推論連動）
