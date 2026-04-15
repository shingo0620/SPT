---
source-url: "https://kokosa.dev/blog/2026/dotllm/"
title: "dotLLM: Building an LLM Inference Engine in C#"
author: "Konrad 'Dev Nerd' Kokosa"
published: 2026-04-14
fetched: 2026-04-15
tags:
  - LLM
  - Architecture
  - Tools
  - dotnet
  - AI-assisted-development
---

# dotLLM: Building an LLM Inference Engine in C#

**Article by:** Konrad 'Dev Nerd' Kokosa
**Published:** April 14, 2026
**Tags:** LLM, Architecture, Tools

## Overview

Konrad Kokosa introduced dotLLM, a native C#/.NET 10 LLM inference engine developed over two months. The project runs transformer-based models (Llama, Mistral, Phi, Qwen) from GGUF files with SIMD-optimized CPU inference, CUDA GPU acceleration, and an OpenAI-compatible API.

## Key Features

**Performance optimizations:**
- Zero-allocation inference using `NativeMemory.AlignedAlloc` (64-byte aligned)
- SIMD vectorization via `System.Runtime.Intrinsics` for quantized operations
- CUDA backend with PTX kernels and cuBLAS integration
- Memory-mapped GGUF file loading
- Support for FP16, Q8_0, Q4_K_M quantization formats

**Serving capabilities:**
- OpenAI-compatible `/v1/chat/completions` and `/v1/completions` endpoints
- Speculative decoding with KV-cache rollback
- Structured output via FSM-based constrained decoding (JSON/Schema/regex/GBNF)

**Architecture:**
The system uses layered abstractions with separate NuGet packages for CLI, Server, Engine, Models, Tokenizers, CPU, and CUDA components, all depending on a Core abstraction layer.

## Performance Reality

Decode throughput reaches 66-88% of llama.cpp performance, but prefill operations run 2-5x slower due to compute-bound matrix multiplication challenges with RyuJIT register pressure.

## Development Methodology

The project used structured AI-assisted development:

- **60 implementation steps** organized into 7 phases with documented dependencies
- **ROADMAP.md** and **CLAUDE.md** as foundational planning documents
- **Claude Code** (Opus 4.6) for implementation
- **Codex and Gemini** for independent PR reviews
- Custom GitHub Actions workflow for asynchronous AI assistance

## Critical Findings

**Successes:**
- Disciplined documentation proved essential; "planning documentation IS the development methodology"
- Dual-review separation (implementation vs. review) caught significant bugs independently
- Architectural decisions remained human-driven while AI handled implementation details

**Challenges:**
- Fundamental architecture selection required human judgment
- Prefill gap caused by outer-product tiled matmul register pressure (23 YMM needed, AVX2 has 16)
- Occasional tool-execution constraints interrupted workflow autonomy

## Project Status

Currently v0.1.0-preview.2 with planned phases including diagnostics, additional model architectures, and production-grade continuous batching.

**Resources:**
- GitHub: github.com/kkokosa/dotLLM
- Website: dotllm.dev
- License: GPLv3
