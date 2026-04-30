---
title: 太陽鴿鴿 — AI 視頻最大的問題，被 Blender 解決了（Blender + Seedance 2.0 + Nano Banana 2 三步工作流）
type: source
sources: [yt-ai视频最大的问题被blender解决了.md]
source_url: https://www.youtube.com/watch?v=6zOt8nnMoug
created: 2026-04-30
updated: 2026-04-30
tags: [blender, seedance, nano-banana, ai-video, 3d-animation, harness, creative-workflow, 太陽鴿鴿]
---

# AI 視頻最大的問題，被 Blender 解決了

> 來源：YouTube `太陽鴿鴿`，2026-03-28（6 分鐘影片，Whisper medium 自動轉錄）
> 一句話結論：**AI 視頻控制性差的根因是缺三維想像力——用 Blender 做骨架、Nano Banana 2 做視覺、Seedance 2.0 做運動約束，三層解耦疊加可達 4K 60fps 完美控制動畫**

---

## 核心命題

> 「越強大的生成式模型，越需要嚴密的控制條件。」

| 系統 | 本質 | 強項 | 弱項 |
|------|------|------|------|
| 傳統 CG（Blender） | 純數學計算推演畫面 | 精準、可控、透視/物理正確 | 渲染慢、材質光影耗心血 |
| AI 視頻生成 | 在噪點中猜畫面 | 高效、視覺豐富 | 不可控；每幀微小偏差在時間軸瘋狂累加，畫面偏離原設想 |

> 「就像是蒙著眼睛蓋大樓——若先用鋼筋打好框架（Blender），再給工人頂級設計圖（Nano Banana 2），並排監工實時核對（Seedance 2.0 的全能參考），結構就絕不會錯亂。」

**這個論點直接呼應 [[src-agent-model-body-harness]]**：「Harness 永遠存在，因為 LLM 是 non-deterministic」——AI 視頻的「每幀微小偏差累加」就是 non-deterministic 的具體展現；Blender + Seedance 全能參考機制就是創意領域的 harness。

---

## 三步工作流

### 第一步：Blender 空間約束 + 物理動態提取

**核心動作**：用白模（無材質、無光影）做動畫與鏡頭軌跡。

| 過去做三維動畫 | 此工作流 |
|----------------|---------|
| 最耗心血的步驟是材質與渲染 | 剝離出 Blender 無可替代的核心價值 |
| 材質+光影 80% 工時 | 純運動信息 + 透視正確性，後段交給 AI |

**操作**：
1. 在 Blender 中用白模建立動作與鏡頭軌跡
2. 不做材質光影
3. 攝像機視圖 → 頂部視圖 → 視圖渲染動畫，匯出視頻
4. 此檔即「眼思和風的軌道」——純運動資訊

> AI 缺乏三維想像力（本質是二維像素的概率預測）。Blender 製造結構，導出帶絕對透視正確性的基礎動畫——就是給 AI 鋪設運動軌道。

### 第二步：Nano Banana 2 + Seedance 2.0 視覺特質與時間軸約束

**核心動作**：Nano Banana 2 生成視覺風格圖（材質光影），Seedance 2.0 全能參考模式約束時間軸一致性。

**Nano Banana 2 部分**：
1. 在 Blender 場景渲染一張單幀圖片
2. 把該圖作為 Nano Banana 2 初始條件
3. 用提示詞描述要的材質光影風格
4. AI 輸出極具張力的單幀效果圖——即「整個動畫的最高視覺矛盤」

**Seedance 2.0 部分**（吉夢的全能參考功能）：
- 底層邏輯：**效果圖 = global 視覺條件，Blender 動態 = 運動條件**
- 算法強制要求 AI 逐幀「回頭看一眼錨定圖」對齊光影紋理
- 同時嚴格限制 AI 不能越過 Blender 的運動邊界
- 操作：吉夢 → 視頻生成 → 模型 Seedance 2.0 → 全能參考模式 → 導入 Blender 視頻 + Nano Banana 2 圖片
- 提示詞寫法：**「讓圖片 1 參考視頻 1 的動作」**——簡單即可，過度詳細反而限制模型發揮
- 實務 tip：吉夢半夜 1 點後排隊較少，1 小時內可出結果；可批量提交睡覺起來收菜

### 第三步：AI 視頻放大重塑畫質

**問題**：AI 算力受限，初步生成的視頻分辨率與幀率不夠極致。

**解法**：超分辨率重構（superres）+ 幻象生成

| 技術 | 作用 |
|------|------|
| 超分辨率重構 | 模型分析低頻信息→從訓練集提取高頻（材質紋理）強行重構 |
| 幻象生成 | 「修復大師憑腦海中對紋理的熟悉，用細膩筆數把缺失的微觀細節畫出來」 |
| AI 補幀（光流算法） | 精準推算符合物理規律的過渡幀，24/30fps → 60fps |

**結果**：4K + 60fps 細節炸裂的完美動畫。

**模型選擇**：吉夢自帶分辨率提升、SID VR 2（開源）等。

---

## 三層架構的角色分工

```
┌─────────────────────────────────────────────────┐
│                變成掌控算力的導演                 │
└─────────────────────────────────────────────────┘
                        │
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
   [Blender]      [Nano Banana 2]    [Seedance 2.0]
   物理法則         視覺設定         一致性維持
   (Body 結構層)   (Body 視覺層)    (Harness 約束層)
        │               │               │
        └───────────────┼───────────────┘
                        ▼
                  [AI 放大模型]
                  超分辨 + 補幀
                        │
                        ▼
                  4K 60fps 動畫
```

> 「不再執著底層細節，而是身為變成掌控算力的導演——利用 Blender 搭建物理法則、Nano Banana 2 繪製視覺設定、Seedance 2.0 維持一致性、最後用 AI 放大完成重置。**這種底層拼接的架構思維，才是我們不可替代的核心價值**。」

---

## 與本知識庫的關係

### 直接呼應 [[src-claude-for-creative-work]]

[[Anthropic]] 2026-04-28 加入 Blender Development Fund 為 patron，公告 8 個 MCP connector（含 Blender connector）。**本影片 2026-03-28 早於 Anthropic 公告整整 1 個月**——社群早已自發發現「Blender + AI 生成」是創意工作流的核心組合。Anthropic 的動作只是把這個社群實踐**官方化、標準化**。

| 時間 | 事件 |
|------|------|
| 2026-03-28 | 太陽鴿鴿影片發布——展示 Blender + Seedance 2.0 + Nano Banana 2 工作流 |
| 2026-04-28 | [[Anthropic]] 加入 Blender Dev Fund + 8 個 MCP connector |
| 2026-04-28 | [[src-github-trending-2026-04]] #1 nexu-io/open-design 743⭐（Anthropic Claude Design 開源復刻）|

**社群先行 → 官方追認 → 開源復刻**——這個三段式擴散是創意 AI 工作流的典型路徑。

### 與 [[src-agent-model-body-harness]] 三層拆解的對應

本影片是「**Body + Harness 二分**在創意 AI 領域的具體實證**：

| 三層拆解概念 | 影片中對應 |
|-------------|-----------|
| Model | Nano Banana 2、Seedance 2.0、AI 放大模型——各自的生成能力 |
| Body | Blender（提供結構/物理）、吉夢平台（提供 multi-input）、SID VR 2（提供超分辨） |
| Harness | Seedance 2.0 全能參考模式（強制錨定圖+運動邊界）、Blender 渲染管線、提示詞精簡原則 |

**最有趣的是「Harness 永遠存在」論點的創意領域版本**：
- LLM 領域：non-deterministic → 需要 hooks / verification / sub-agent firewall
- 視頻 AI 領域：每幀微小偏差時間軸累加 → 需要錨定圖 + 運動邊界 + 補幀光流

兩者結構同構：**生成式系統的不確定性永遠存在，需要外部約束才能可控**。

### 與 [[AI 輔助遊戲開發]] 的關聯

遊戲動畫製作正面臨同樣選擇——本影片的工作流可直接套用到 indie 遊戲動畫製作（Godot/Unity 場景白模 → Nano Banana 2 視覺風格 → Seedance 2.0 一致性）。是 [[src-遊戲引擎的未來]] 中提到「人 + AI 代理共同使用遊戲引擎」的具體實踐之一。

---

## 主要概念與工具引用

| 工具/概念 | 角色 | 開發者 |
|-----------|------|--------|
| **Blender** | 開源 3D 創作套件、物理結構提供者 | Blender Foundation |
| **Nano Banana 2** | 圖像大模型、視覺風格生成 | （從上下文推測為 Google 系，需驗證） |
| **Seedance 2.0** | 視頻生成、全能參考模式 | 字節跳動「吉夢」平台（jimeng.com）|
| **AI 視頻放大** | 超分辨率 + 幻象生成 + 光流補幀 | 吉夢自帶或 SID VR 2 等開源 |

---

## 查核備註

⚠️ **影片資訊查核**：
- 「Nano Banana 2」是 Gemini 影像生成的暱稱嗎？需查證；Google「Nano Banana」確為 Gemini 圖像功能的非官方暱稱，「2」版本應對應 2026 年初的更新
- 「Seedance 2.0」是字節跳動旗下「吉夢 AI」（jimeng.com）的視頻生成模型；「全能參考模式」是該平台 2026 早期推出的多輸入視頻生成功能
- 「SID VR 2」可能是「SeedVR2」（字節跳動開源的視頻超分辨率模型，2026 早期釋出）
- Whisper medium 模型轉錄可能對技術名詞有誤辨（如「C-Dance」實為「Seedance」、「吉夢姿怠」實為「吉夢自帶」），閱讀時需校正

⚠️ **工作流可行性**：
- 操作步驟連貫合理，但「半夜 1 點後排隊較少」反映吉夢平台的容量限制；2026 年穩定性需追蹤
- Blender + Seedance 全能參考的「強制錨定圖」是否真為算法強制 vs 僅是 prompt 引導，需查吉夢官方文件

---

## 相關頁面

- [[src-claude-for-creative-work]]（[[Anthropic]] 04-28 加入 Blender Dev Fund——本影片是該公告的社群先行案例）
- [[src-agent-model-body-harness]]（三層拆解在創意 AI 領域的對應；harness 永遠存在的視頻版本論證）
- [[綜整-AI協作工程的六大趨勢]]（趨勢一「環境比模型聰明」的創意工作流範例）
- [[AI 輔助遊戲開發]]（同類「傳統工具 + AI 混合工作流」哲學）
- [[src-遊戲引擎的未來]]（秦无邪 OvO 同題：商用引擎 vs 自研 vs 「人 + AI 代理共用」）
- [[Anthropic]]（Blender Dev Fund patron）
