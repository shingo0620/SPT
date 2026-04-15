---
title: dotLLM——用 C# 打造 LLM 推論引擎
type: source
sources: [dotllm-building-llm-inference-engine-in-csharp.md]
created: 2026-04-15
updated: 2026-04-15
tags: [LLM, dotnet, AI輔助開發, 推論引擎]
---

# dotLLM——用 C# 打造 LLM 推論引擎

## 來源資訊

- 作者：Konrad 'Dev Nerd' Kokosa
- 連結：https://kokosa.dev/blog/2026/dotllm/
- 發布日期：2026-04-14

## 摘要

.NET 開發者 Konrad Kokosa 花兩個月用 C#/.NET 10 從零打造 LLM 推論引擎 dotLLM。文章同時記錄了完整的 AI 輔助開發方法論——60 個步驟、7 個階段的結構化規劃，以及人類主導架構、AI 負責實作的分工模式。

## 技術成果

### 支援模型

Llama、Mistral、Phi、Qwen（從 GGUF 檔案載入）

### 效能優化

| 技術 | 說明 |
|------|------|
| 零分配推論 | `NativeMemory.AlignedAlloc`（64-byte 對齊） |
| SIMD 向量化 | `System.Runtime.Intrinsics` 處理量化運算 |
| CUDA 後端 | PTX kernels + cuBLAS 整合 |
| 記憶體映射 | GGUF 檔案直接映射載入 |
| 量化格式 | FP16、Q8_0、Q4_K_M |

### 效能實測

- **Decode**：達 llama.cpp 的 66-88%
- **Prefill**：慢 2-5 倍（瓶頸：RyuJIT 暫存器壓力，需要 23 個 YMM 暫存器但 AVX2 只有 16 個）

### 服務功能

- OpenAI 相容 API（`/v1/chat/completions`、`/v1/completions`）
- 投機解碼（Speculative Decoding）+ KV-cache 回滾
- FSM 結構化輸出（JSON/Schema/regex/GBNF）

## AI 輔助開發方法論

這是本文最有價值的部分——一套經實戰驗證的 [[AI 輔助軟體工程]] 方法論：

### 規劃即方法論

> "Planning documentation IS the development methodology"

- **ROADMAP.md**：60 個實作步驟，分 7 個階段，標註依賴關係
- **CLAUDE.md**：AI 的行為指引與專案脈絡

### 人機分工

| 角色 | 負責 |
|------|------|
| 人類 | 架構決策、基礎技術選型、品質判斷 |
| Claude Code (Opus 4.6) | 程式碼實作 |
| Codex + Gemini | 獨立 PR review（與實作者分離） |
| GitHub Actions | 非同步 AI 輔助流程 |

### 關鍵發現

- **雙重 review 分離**有效：實作者（Claude）與審查者（Codex/Gemini）各自獨立抓出不同 bug
- **架構決策不可委託 AI**：基礎技術選型仍需人類主導
- **結構化規劃文件**是成功關鍵，而非 AI 能力本身

## 相關頁面

- [[AI 輔助軟體工程]]
- [[AI 輔助遊戲開發]]（同為 AI 輔助開發，但面向不同）
- [[LLM Wiki]]（同樣以 CLAUDE.md 作為 AI 行為指引）
