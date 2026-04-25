---
title: DeepSeek
type: entity
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [deepseek, ai-company, llm, china, open-source]
---

# DeepSeek（深度求索）

> 本頁統整本 wiki 多處提及的 DeepSeek 脈絡；來源為空表示為跨來源歸納。

## 一句話定位

杭州幻方量化（High-Flyer）旗下 AI 子公司，**以「開源 + 高性價比 + 強推理」為核心策略**，與 [[Anthropic]]、[[OpenAI]] 等閉源前沿模型形成對比的中國 LLM 廠商。

## 模型系列（wiki 涉及版本）

| 代號 | 發布 | 主要特色 | wiki 涉及 |
|------|------|---------|----------|
| **DeepSeek-V4** | 2026-04-24 | **1M context** 開源旗艦、coding agent 強化 | 04-24 HN #2（1,430 分）、PH #2（206 票）、GitHub Trending #1 + #7 |
| DeepSeek-R1 | 2025-01 | 純 RL 推理模型、開源震撼 AI 界 | 訓練資料 |
| DeepSeek-V3 | 2024-12 | 671B MoE 參數、推理成本壓低 | 訓練資料 |
| DeepSeek-V2 | 2024-05 | MoE 架構首版 | 訓練資料 |

## 2026-04-24 V4 發布事件（wiki 多處同步）

**單日三榜聯動**——當日 AI 模型發布關鍵節點：
- **HN #2**（1,430 分）：[[src-hn-2026-04]] 04-24 — API 上線、1M context 開源
- **PH #2**（206 票）：[[src-producthunt-2026-04]] 04-24 — 「開源時代的 1M context 智能」
- **GitHub Trending #1**（512 stars）：[[src-github-trending-2026-04]] 04-24 — `deepseek_v4_rolepaly_instruct` 角色扮演 prompt 集首發
- **GitHub Trending #7**（30 stars）：同日 — `deepseek-v4-deep-dive` 73 頁 PPT 解讀
- **連帶效應**：[[src-skill-ast-grep]] 連 7 日精選 + 04-24 安裝數 +186 加速擴散——推論與 V4 1M context 引發「大 codebase 結構化搜尋」需求密度上升相關

## 核心策略

- **開源優先**——V3/R1/V4 主要開放權重，部分採 MIT/Apache 2.0
- **高性價比**——R1 將推理成本壓至 OpenAI o1 的 ~3%，引發定價衝擊
- **長 context 賽道**——V4 1M context 直接對標 [[Claude Code]] Opus 4.7 與 [[Google]] Gemini 1.5/2.0
- **量化基金背景**——母公司幻方量化的 GPU 集群為訓練基礎，與純創投融資的美國新創差異化

## 競爭版圖（與 wiki 其他 AI 廠商對比）

| 公司 | 旗艦模型 | 開源策略 | 1M context | wiki 涉及 |
|------|---------|---------|-----------|----------|
| **DeepSeek** | V4（2026-04-24） | ✅ 開源 | ✅ | 本頁 |
| [[Anthropic]] | Claude Opus 4.7 | ❌ 閉源 | ✅（Opus 4.7） | ⭐ wiki 主角 |
| [[OpenAI]] | GPT-5.5 / Codex 3.0 | ❌ 閉源 | — | 04-24 同日發布 |
| [[Google]] | Gemini Workspace Intelligence | ❌ 閉源 | ✅（Gemini 1.5+） | 04-24 同日發布 |
| Alibaba [[Qwen]] | Qwen3.6-Max / 27B | ✅ 開源 | — | 04-22/23 提及 |

## 相關頁面

- [[src-hn-2026-04]]（04-24 V4 發布頭版討論）
- [[src-producthunt-2026-04]]（04-24 V4 PH 上架）
- [[src-github-trending-2026-04]]（04-24 V4 相關 repo 雙上榜）
- [[src-skill-ast-grep]]（V4 連帶引發的 ast-grep 加速擴散）
- [[Anthropic]] / [[Qwen]]（同類競品）
