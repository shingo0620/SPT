---
title: "Gemma 4 Multi-Token Prediction Drafters — 3x inference 加速"
type: source
sources: [multi-token-prediction-in-gemma-4.md]
created: 2026-05-11
updated: 2026-05-11
tags: [gemma, google, multi-token-prediction, speculative-decoding, inference-optimization, edge-llm]
---

# Gemma 4 Multi-Token Prediction Drafters

> 來源：[Google blog](https://blog.google/innovation-and-ai/technology/developers-tools/multi-token-prediction-gemma-4/) | 作者：Olivier Lacombe（Director, PM）+ Maarten Grootendorst（DevRel）| 發表 2026-05-05

## 核心發布

[Gemma 4](https://blog.google/innovation-and-ai/technology/developers-tools/gemma-4/)（前幾週發布，已 **60M+ downloads**）的 **Multi-Token Prediction (MTP) drafters** 上線——透過專門的 speculative decoding 架構，**最高 3x speedup**，無品質或推理邏輯降級。

測試平台：LiteRT-LM、MLX、Hugging Face Transformers、vLLM。

## 為何需要 speculative decoding

- 標準 LLM 推論是 **memory-bandwidth bound**——處理器大部分時間在把數十億參數從 VRAM 搬到 compute unit，只為生成單一 token
- 結果：compute 未充分利用 + 高延遲，尤其消費級硬體

## 機制

**heavy target model（如 Gemma 4 31B）+ lightweight drafter（MTP model）**：
1. 用閒置 compute 讓 drafter「預測」多個未來 token——比 target model 處理單一 token 還快
2. target model 平行驗證所有建議的 token
3. 若 target model 同意 draft → 一個 forward pass 接受整段 + 額外生成一個自己的 token
4. → 應用可以在「平常生成一個 token 的時間」內輸出「整段 drafted sequence + 1 token」

基於 Google 2022 年論文 [Fast Inference from Transformers via Speculative Decoding](https://arxiv.org/abs/2211.17192)。

## 架構增強

- draft models 利用 target model 的 activations + 共用其 KV cache——不用重算 context
- E2B / E4B edge models：final logit calculation 是瓶頸 → 在 embedder 用 clustering technique 加速
- 硬體特化：26B MoE 在 Apple Silicon batch=1 有 routing challenge，但 batch 4-8 可達 ~2.2x；Nvidia A100 增 batch 也有類似收益

## 取得方式

- Apache 2.0 開源（同 Gemma 4）
- 權重在 [Hugging Face](https://huggingface.co/collections/google/gemma-4) / [Kaggle](https://www.kaggle.com/models/google/gemma-4)
- 支援 transformers / MLX / vLLM / SGLang / Ollama
- Edge：Google AI Edge Gallery（Android / iOS）

## 跨 wiki 連動

- **[[Inference.sh]]**：本地 LLM inference 平台；MTP drafters 是「讓本地推論更快」的核心技術，與 Inference.sh 的價值主張相關
- **[[antirez]]**：在 Pi 跑 llama.cpp 的 indie 邊緣設備實驗；Gemma 4 E2B/E4B + MTP 是「邊緣設備跑能用的 LLM」的官方版本
- **[[Armin Ronacher]]**：mitsuhiko/pi-ds4（在 Pi 跑 DeepSeek V4）——同「edge LLM」軸
- **[[Multi-Agent 失敗分類學]]** / [[src-karpathy-sequoia-ascent-2026]]：Karpathy 提「autonomous agents that require rapid multi-step planning」——MTP 的低延遲對 agentic 工作流是關鍵 enabler（每個 millisecond 在多步規劃中累積）

## 觀察

### 數據可信度
- ✅ **3x speedup**——Google 官方數字，附測試平台（LiteRT-LM/MLX/HF/vLLM）；但「最高 3x」是 best case，實際 batch=1 邊緣場景可能 ~2.2x（文中自承）
- ✅ **60M+ downloads in first few weeks**——Gemma 4 採用速度，與其他開源模型（Llama 等）同量級

### 對 wiki 的補充價值
這是 wiki 少見的「LLM 底層技術」來源——多數既有來源偏應用/工程/產品面。MTP / speculative decoding 是理解「為何 agentic 工作流需要快速推論」的技術基礎，補上 [[Inference.sh]] 等本地推論主題的技術深度。

### 待後續觀察
- MTP drafters 是否成為開源模型標配
- edge LLM（手機/Pi）的實用化進度
- speculative decoding 的「draft acceptance rate」在真實 agentic 工作負載下的表現
