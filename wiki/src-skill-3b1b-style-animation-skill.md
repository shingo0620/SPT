---
title: "Skill 解析：3b1b-style-animation-skill"
type: source
sources: [skills-picks-2026-04-17.md]
created: 2026-04-17
updated: 2026-04-17
tags: [skills-sh, agent-skills, manim, math, education, visualization, pedagogy]
---

# Skill 解析：3b1b-style-animation-skill

> skills.sh Pick of the Day — 2026-04-17
> 來源：[subinium/3b1b-style-animation-skill](https://github.com/subinium/3b1b-style-animation-skill) | [skills.sh 頁面](https://skills.sh/subinium/3b1b-style-animation-skill/3b1b-style-animation-skill) | 安裝數：1

**一句話**：如果你想用 AI 做 3Blue1Brown 風格的數學解釋動畫，這個 skill 幫你把 Manim 技術與教學哲學整合成可重用的 agent 工作流。

## 概述

3b1b-style-animation-skill 是一個專門針對 **Manim 數學動畫**的 Agent Skill，靈感來自 Grant Sanderson（[[3Blue1Brown]]）的知名教育頻道。它的核心主張是：**動畫的目的不是展示數學，而是建立理解**（"The goal is not to animate math, but to build understanding."）。

安裝指令：
```
npx skills add https://github.com/subinium/3b1b-style-animation-skill --skill 3b1b-style-animation-skill
```

---

## 1. 製作方式

### Metadata

| 欄位 | 值 |
|------|---|
| author | subinium |
| version | 1.0.0 |
| tags | manim, 3b1b, math, education, pedagogy, visualization |

### 架構設計

這個 skill 採用**中央索引 + 多子規則**架構，比起 character-arc 的單檔 diagnostic 更龐大：

- **主檔**：skill 入口，定義核心哲學、何時使用、Rules Index
- **rules/ 子目錄**：約 20+ 個專門規則檔，按主題分類
  - 最高優先級（品質與規劃）：visual-quality、pre-production、layout-spacing
  - 高優先級（教學與內容）：pedagogy、mathematical-rigor、narrative-flow、audio-sync
  - 視覺設計：color-scheme、scene-basics、camera-work
  - 領域規則——**線性代數**：linear-transformations、matrix-operations、eigenvalues、vector-space
  - 領域規則——**統計與機率**：distributions、bayes-theorem、sampling
  - 領域規則——**深度學習**：neuron、layer、network-architecture、forward-pass、gradient-flow、attention、transformer-block
  - 領域規則——**CNN**：convolution、feature-maps、pooling
  - 技術：manim-setup、narration

### 核心哲學（教學四原則）

1. **Intuition Before Formalism**——先建立視覺理解，再展示公式
2. **Why Before What**——先激發動機，再下定義
3. **Concrete Before Abstract**——從具體例子開始，再推廣
4. **Show, Don't Tell**——讓視覺替你解釋

這四條是 3Blue1Brown 教學法的精髓，也是 skill 行為的第一原則。

### Agent 能力使用

- **AskUserQuestion**：強制要求在 coding 前詢問使用者偏好（音訊、時長）
- **工作流四步**：Draft Plan → Ask Preferences → Present Plan → Execute
- **決策樹**：根據音訊選擇走不同 pipeline（有音訊：Script → TTS → Measure Duration → Code → Render → Combine；無音訊：Estimate Timing → Code → Render）

### 關鍵技術原則

- **時長由內容決定，不是固定寫死**——LLM 產出解釋稿後用 TTS 測時間，而不是硬性限定 60 秒
- **一律先問、不預設**——音訊偏好、時長偏好、細節層級都必須詢問
- **顏色方案語義化**——3b1b palette 不只是美學，每個顏色有特定語意

### 相容平台

未明確聲明相容 agent 平台（Claude Code / Codex / Gemini CLI），推測為通用設計——所有支援 Agent Skills 規範的平台都能使用。

---

## 2. 應用場景

### 觸發條件（來自 skill 的 "When to Use"）

- 用 Manim 製作數學動畫
- 視覺化解釋演算法
- 建立深度學習視覺化
- 產出教育影片內容

### 具體使用情境

**情境 A：教師／內容創作者做教學影片**
- 需求：為線性代數課程錄一段「特徵向量是什麼」的影片
- 這個 skill 強迫走「先直覺、再形式化」的結構，避免直接丟公式
- 領域規則（eigenvalues.md）提供 3b1b 風格的幾何直覺切入

**情境 B：技術部落格補動畫**
- 需求：寫了一篇 Transformer 原理的部落格，想配一段 attention 機制視覺化
- skill 的 attention.md、transformer-block.md 規則直接覆蓋此需求
- 有音訊／無音訊雙路徑，適合影片平台與純嵌入式動畫

**情境 C：研究論文解釋**
- 需求：把自己論文的方法圖動畫化給 Twitter 或 YouTube
- pedagogy.md 與 narrative-flow.md 規則確保動畫有教育結構，不只是 slideshow
- 避免「我看得懂但別人看不懂」的研究者通病

### 領域歸屬

- **主要領域**：education / visualization / math
- **次要領域**：deep learning（內建 CNN、Transformer、attention 等規則）
- **技術棧**：Python + Manim（Grant Sanderson 的開源動畫框架）
- **內容類型**：影片、動畫、教學

---

## 3. 工作流整合

### 前置需求

1. 安裝 Manim（Python 動畫框架）——skill 的 rules/manim-setup.md 應有指引
2. 如需 TTS 音訊，需準備 TTS 服務或本地模型
3. Agent 平台支援 AskUserQuestion 類工具（否則詢問環節會退化）

### 與已知工具／知識的關係

- **延續 [[Skill vs Bash vs MCP]] 的分類**——這是一個純 skill 實作，把 Manim 使用知識壓縮進 prompt
- **對比 [[src-skill-character-arc]]**——character-arc 是單檔 diagnostic skill，3b1b 是多檔具體生產 skill，兩者代表 Agent Skill 的兩個極端
- **架構參考 [[src-mattpocock-skills]]**——Matt Pocock 的 skills 多為 PRD/Issue/Plan 工作流；3b1b 則是更垂直的內容生產工作流
- **與 [[AI 輔助軟體工程]] 互補**——後者談結構化 AI 開發，3b1b 談結構化 AI 教育內容生產

### 一句話推薦

**適合內容創作者**：如果你每週做 2 支以上的數學／ML 教學影片，安裝這個 skill 能把「什麼時候該用動畫」「動畫該怎麼分鏡」的決策外包給規則庫。

**不適合**：
- 只是偶爾想做一張教學圖——過度設計
- 不會 Manim 也不打算學——這個 skill 假設你能看懂 Manim 程式碼輸出

---

## 來源事實查核

- ✅ GitHub repo 存在：github.com/subinium/3b1b-style-animation-skill
- ✅ Manim 為真實開源框架，由 3Blue1Brown 的 Grant Sanderson 創造
- ✅ "The goal is not to animate math, but to build understanding." 是 3Blue1Brown 頻道的公開教育主張
- ⚠️ 安裝數 1：確實為當日精選，但安裝量極低，屬於 skills.sh 早期階段的冷門推薦

## 相關

- 月報：[[src-skills-picks-2026-04]]
- 相關 skill：[[src-skill-character-arc]]（另一個 skills.sh 精選，對比參考）
- 概念：[[Skill vs Bash vs MCP]]、[[AI 輔助軟體工程]]
