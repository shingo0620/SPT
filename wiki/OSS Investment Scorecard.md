---
title: OSS Investment Scorecard
type: concept
sources: [src-multica-devv-ai盡調.md]
created: 2026-04-21
updated: 2026-04-21
tags: [創投, OSS, 盡職調查, 分析框架, 投研]
---

# OSS Investment Scorecard

## 定義

由某新加坡 VC 駐企家 E.I.R.（匿名作者）自創的**開源專案投研框架**，用於在早期階段判斷 OSS 專案的投資價值。本頁記錄的是 2026-04 更新到 v1.3.1 的版本，包含三個新外掛模組。

> 這是該作者的**個人框架**，非業界標準或學術方法。

## 維度

作者提及 A/B 兩個維度（完整框架未全文披露）：

- **A 維度：Popularity**——專案熱度、社群關注度
- **B 維度：Team**——核心團隊背景、執行力
- 其他維度未在本次盡調中展開

## v1.3.1 的三個外掛模組

### R-1：Star 健康度診斷模組

**用途**：A 維度（Popularity）的輔佐

**方法**：用 GitHub API 抓 5 個量化指標，20 分鐘內判斷專案熱度是否被人為灌水

**指標範例**（[[Multica]] 盡調案例）：

| 指標 | Multica 值 | 判讀 |
|------|-----------|------|
| Star/Fork 比 | 8.1 倍 | 健康（低說明是社群真實採用，高說明是灌水看熱鬧） |
| Star/Issue 比 | 73 倍 | 健康 |
| Fork 率 | 12.4% | 健康（Fork 率太低說明沒人真用） |

其他 2 個指標原文未詳述。

### R-2：Commit 集中度分析模組

**用途**：作為 **Bus Factor（公車指數）** 的 Proxy

**方法**：計算 Top N 貢獻者的 commit 佔比

**判讀法則**：

| 集中度 | 判讀 |
|--------|------|
| 低（<50%） | 典型草根社群專案——多人貢獻、Bus Factor 高、學習曲線平 |
| 高（>90%） | 正規軍團隊外流的 OSS——少數人主導、Bus Factor 低、但執行力強 |

**案例**：Multica 的 97.4% 畸形集中度 → 直接分辨出「正規軍團隊外流」。

### R-3：匿名團隊身分追溯 SOP

**用途**：B 維度（Team）的起底

**五步驟**：

1. **Contributors API**：爬出核心開發的 Handle
2. **資料欄位**：看 bio、email、company、location、blog
3. **LinkedIn 交叉比對**：用 Handle 或 email domain 找到真人
4. **ProductHunt 交叉比對**：看有無做過其他產品
5. **Indie Hackers 交叉比對**：看有無商業披露（MRR、回顧文章）

**案例**：作者透過 forrestchang 的 bio「Building @multica-ai」+ email jiayuan@multica.ai → 確認是 Devv.AI 的 Jiayuan Zhang。

## 框架演進史

| 版本 | 觸發案例 | 新增內容 |
|------|----------|----------|
| v1.2 | Aryn / Sycamore | Acqui-hire 標記機制 |
| v1.3.1 | [[Multica]] / [[Devv.AI]] | R-1 Star 健康度、R-2 Commit 集中度、R-3 匿名團隊追溯 |

> Framework 就是要在這種實戰中不斷吃燃料迭代。——作者

## 評估結果判讀

作者用的分數等級（不完整揭露）：

- **Watch**：持續觀察、尚未投資
- **Pass**：不投

盡調後 Multica 總分 5.56，卡在 Watch 和 Pass 邊緣——**能不能起底團隊底細，直接決定了專案在早期階段的生死判定**。

## 與既有概念的關係

- **補充 [[AI 輔助軟體工程]]**：不是開發方法論，而是**判斷誰的開發方法論值得投資**
- **延伸 [[src-Solo SaaS架構]] 的視角**：Solo SaaS 架構是怎麼做，OSS Investment Scorecard 是怎麼**判斷別人做得好不好**

## 限制與批判

- **個人框架**：非業界標準、未經第三方驗證
- **指標仰賴公開資料**：若團隊刻意不留公開蹤跡（無 LinkedIn、無 ProductHunt），R-3 追溯鏈會斷
- **Bus Factor 判讀過度二元**：真實中可能有「3 人團隊但互相重疊」這種中間狀態
- **抄襲成本低**：公開框架後，新創可反向規避——例如刻意分散 commit、加人掛名

## 來源

- [[src-multica-devv-ai盡調]]：框架 v1.3.1 的案例與來源
