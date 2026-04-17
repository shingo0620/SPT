---
title: Solo SaaS 架構——$20/月的反叛
type: source
sources: [當一個人的 SaaS 不再需要矽谷.md]
created: 2026-04-17
updated: 2026-04-17
tags: [SaaS, 架構, 獨立開發, Go, SQLite, 本地AI]
---

# Solo SaaS 架構——$20/月的反叛

Steve Hanov 同時經營多個月營收破萬美元（$10K MRR）的 SaaS，全部跑在月費約 $20 的基礎設施上。創投拒絕他的理由是：「你到底需要錢幹嘛？」——這句話本身就是答案。

## 技術棧總覽

| 層級 | 選擇 | 月費 |
|------|------|------|
| 運算 | Go binary on Linode VPS | $5-10 |
| 資料庫 | SQLite（WAL mode） | $0 |
| AI 推理（批次） | 二手 RTX 3090 + VLLM | $0（一次性 $900） |
| AI 推理（備援） | OpenRouter（多 provider aggregator） | 按量 |
| 開發工具 | VS Code + Copilot | — |
| **合計** | | **≈ $20/月** |

代表產品：websequencediagrams.com（序列圖工具）、eh-trade.ca（用本地 LLM 批次分析上市公司季報的股票研究）。

## 反直覺的技術決策

### Go 而非 Rust

- Rust 更快、記憶體安全由編譯器保證，但**一人維護多產品需要的是最低認知負擔**
- Go 學習曲線 1-2 週 vs Rust 3-6 個月；Go 編譯秒級 vs Rust 分鐘級
- 關鍵因素：**LLM 生成 Go 幾乎不出錯，生成 Rust 遇到 lifetime 問題容易失敗**——當你的「同事」是 AI，你得選 AI 也寫得好的語言（→ [[AI 輔助軟體工程]]）

### SQLite 而非 Postgres

- SQLite 透過 C 介面直接讀記憶體，比 TCP 連線到遠端 Postgres **快一個數量級**
- `PRAGMA journal_mode=WAL` 一行指令解決併發，撐幾千個併發用戶
- 零運維：沒有 connection pool、沒有 migration 工具鏈、**備份 = 複製一個檔案**

### $5 VPS 而非 AWS

- 原話：「AWS 控制台是設計來榨取升級費用的迷宮」
- 一台機器 = 知道 log 在哪、知道為什麼 crash、知道怎麼重啟
- 不需要 EKS、不需要 NAT Gateway、不需要在還沒有用戶前就月花 $300

### 本地 GPU 而非 API

- $900 二手 RTX 3090（24GB VRAM）跑 VLLM 做批次推理
- VLLM 用 PagedAttention 把 GPU 記憶體壓到極致——**16 個並行請求的總時間跟 1 個差不多**
- Ollama 做原型、VLLM 上生產，批次任務不再需要付 API 費用

## Cloudflare Edge Stack——更極端的路線

如果 Hanov 的 VPS 是反雲端的第一步，Cloudflare 的 edge stack 就是邏輯盡頭。

| 面向 | Hanov Stack | Cloudflare Edge Stack |
|------|------------|----------------------|
| 運算 | Go binary on VPS | Workers（V8 isolates, edge 部署） |
| 資料庫 | SQLite（本地檔案） | D1（SQLite 跑在 edge） |
| 儲存 | 本地磁碟 | R2（S3 相容，零 egress 費用） |
| 狀態管理 | Go + 記憶體 | Durable Objects（全球分散有狀態運算） |
| 延遲 | 依伺服器位置 | 全球 edge，最近節點 |
| 月費 | ~$20 | ~$5 起步 |

優勢：Workers 冷啟動毫秒級（非 Lambda 秒級）、R2 零 egress 消除 S3 最惡名昭彰的成本陷阱。

代價：**vendor lock-in**——Hanov 的 Go binary 可以 scp 到任何 Linux 機器，Worker 只能跑在 Cloudflare 上。自由度跟便利性的取捨。

## 本地 AI 推理比較

| 面向 | RTX 3090 + VLLM | Mac Mini M4 + MLX |
|------|-----------------|-------------------|
| 成本 | $900（二手） | $600（新品） |
| 功耗 | 350W | 15-25W |
| 噪音 | 風扇直升機 | 幾乎無聲 |
| 記憶體 | 24GB VRAM（獨立） | 16GB 統一記憶體 |
| 吞吐量 | 高（PagedAttention） | 中（單用戶批次夠用） |
| 生態 | CUDA + PyTorch（最成熟） | MLX + llama.cpp（成長中） |
| 運維 | 需要 Linux host | macOS 當桌機用 |

3090 在高併發批次推理勝出。但 solo developer 一天跑幾十到幾百次推理——Mac Mini 安靜地坐在桌上就夠了，功耗差十倍以上，7/24 電費完全不同。

可跑模型：Qwen3 8B、Llama 3.3 8B、量化後 14B，開源模型品質已到「本地跑就夠好」的水準。

## 核心洞見——低維護成本 > 低製作成本

- **製作成本降低** → 更多產品出現
- **維護成本降低** → 這些產品存活下來

Hanov 的架構不是為了 scale to millions——是為了讓一個人輕鬆維護 100 個客戶以下的產品。SQLite 不是「不夠好」的妥協，而是「我不需要 scale」前提下的最優解。

## 微型 SaaS 的夜市經濟學

當軟體的生產和維護都降到一個人能承受的程度：

- **垂直領域切極碎**：不是「給餐廳用的 SaaS」，而是「給台北日式居酒屋用的排班工具」
- **大公司不會搶**：百貨不會跟你搶月營收 $10K 的生意
- **一千個攤販 = 新經濟物種**：每一攤都小、都快、老闆就站在攤位後面——你有問題直接跟他說
- 這與 [[顧客終身價值]] 的 CLV vs CAC 邏輯一致：micro-SaaS 的獲客成本極低（垂直社群口碑），CLV 雖然單客不高，但維護成本趨近於零，利潤率極高

## Harness 概念的延伸

Hanov 的 laconic（為 8K context window 設計的 agentic researcher）：

- 像作業系統的**虛擬記憶體管理器**——把不相關的對話「page out」，只保留最關鍵的事實在 active context
- 這就是 **context paging**：用 harness 管理有限的 context window
- 核心主張：**小模型 + 好 harness > 大模型 + 無 harness**

## 五個決策框架

1. **先問「我需要 scale 嗎？」**——100 個客戶以下，SQLite + 單台伺服器 + Cloudflare 免費 tier 就是正確答案
2. **選 AI 寫得好的語言**——Go 和 TypeScript 目前是 LLM 程式碼生成品質最穩定的語言（→ [[AI 輔助軟體工程]]）
3. **批次推理自己跑**——API 適合即時低量高品質；批次分析幾百份文件用本地 GPU，6-12 個月回本
4. **用 aggregator 不綁單一 AI 公司**——OpenRouter 一個介面、多 provider、自動 fallback
5. **把 VC 的錢當最後手段**——能在 $20/月跑出 $10K MRR = 已驗證 product-market fit，而且你擁有 100% 股權

## 結構性轉變的信號

基礎設施已完全競爭化：VPS $5、SQLite 免費、Go compiler 免費、開源模型免費——基礎設施變成了水電。

> 語言模型和 AI Agent 做的事情是人類歷史上從來沒出現過的：它普及了智力本身。

SaaS Apocalypse 的投資端在蒸發 $2T 市值。Hanov 的建設端在證明：替代品的成本已經低到荒謬。

## 相關頁面

- [[AI 輔助軟體工程]] — AI 作為「隊友」時語言選擇很重要：Go/TypeScript 是 LLM 生成品質最穩定的語言，這直接影響了 Hanov 的技術棧決策
- [[顧客終身價值]] — micro-SaaS 的 CLV 與獲客成本關係：垂直 niche 的獲客成本極低，維護成本趨近零，CLV/CAC 比值遠超傳統 SaaS
