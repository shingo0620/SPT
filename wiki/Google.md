---
title: Google
type: entity
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [google, ai-company, gemini, tpu, workspace]
---

# Google

> 本頁統整本 wiki 多處提及的 Google 脈絡；來源為空表示為跨來源歸納。

## 一句話定位

全球最大科技公司之一，**在本 wiki 主要以 AI 模型（Gemini）、AI 硬體（TPU）、企業 AI（Workspace Intelligence、Gemini Enterprise Agent Platform）三條 AI 戰線**出現——是 [[Anthropic]] / [[OpenAI]] / [[DeepSeek]] 的主要競爭者。

## 三條 AI 戰線（wiki 涉及版本）

### 1. 模型線：Gemini 系列

- **Gemini 1.5 / 2.0**——支援 1M+ context，與 [[Anthropic]] Claude Opus 4.7、[[DeepSeek]] V4 並列「長 context 三巨頭」
- **gemini-cli**——對標 [[Claude Code]] 的官方 CLI（[[Anthropic]] 頁有提及）

### 2. 硬體線：TPU（Tensor Processing Unit）

- **第 8 代 TPU**（2026-04-22 發表）——「為 agentic 時代打造」
  - [[src-hn-2026-04]] 04-22 #5（156 分）
  - 兩款晶片定位：訓練 + 推理
- 自有 ASIC 是 Google 對抗 NVIDIA 高 GPU 成本的核心戰略

### 3. 企業 AI 線

- **Gemini Enterprise Agent Platform**（2026-04-23 PH 上架）
  - [[src-producthunt-2026-04]] 04-23 #14（96 票）
  - 「以企業規模運行 AI agent 的平台」
- **Google Workspace Intelligence**（2026-04-24 PH 上架）
  - [[src-producthunt-2026-04]] 04-24 #8（122 票）
  - 「理解並增強你 Workspace 的 AI」
  - 與 Microsoft Copilot for Microsoft 365 直接對標

## 2026-04 關鍵事件時序

| 日期 | 事件 | wiki 涉及 |
|------|------|----------|
| 04-22 | 第 8 代 TPU 發表（agentic 時代） | [[src-hn-2026-04]] 04-22 #5 |
| 04-23 | Gemini Enterprise Agent Platform PH 上架 | [[src-producthunt-2026-04]] 04-23 #14 |
| 04-24 | Google Workspace Intelligence PH 上架 | [[src-producthunt-2026-04]] 04-24 #8 |

連續三日的企業 AI 發表節奏顯示 Google 在 **agent 企業化**主題的密集動作——對標 Anthropic Claude 與 OpenAI Codex 的相同戰略。

## 競爭版圖（與 wiki 其他 AI 廠商）

| 公司 | 主力模型 | 主要 CLI／Agent | 硬體自主 |
|------|---------|----------------|---------|
| **Google** | Gemini 系列 | gemini-cli + Workspace Intelligence | ✅ TPU |
| [[Anthropic]] | Claude Opus 4.7 | [[Claude Code]] | ❌（用 AWS / GCP / Azure） |
| [[OpenAI]] | GPT-5.5 / Codex 3.0 | Codex CLI | ❌（用 Azure） |
| [[DeepSeek]] | V4 | API only | 部分（幻方量化集群） |

## 相關頁面

- [[Anthropic]] / [[DeepSeek]] / [[Qwen]]（同類 AI 廠商）
- [[Claude Code]]（gemini-cli 對標目標）
- [[src-hn-2026-04]] / [[src-producthunt-2026-04]]（近期動態）
