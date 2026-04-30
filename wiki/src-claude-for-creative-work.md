---
title: Claude for Creative Work — Anthropic 進入創意產業（2026-04-28）
type: source
sources: [claude-for-creative-work-anthropic.md]
source_url: https://www.anthropic.com/news/claude-for-creative-work
created: 2026-04-30
updated: 2026-04-30
tags: [anthropic, claude, mcp, connector, blender, adobe, autodesk, ableton, splice, creative]
---

# Claude for Creative Work

> 來源：Anthropic 官方公告，2026-04-28
> 主旨：Claude 透過 connectors 進入創意產業——8 個工具合作夥伴正式 launch

---

## 一句話定位

> 「Today, with a coalition of partners including Blender, Autodesk, Adobe, Ableton, and Splice, we're releasing a set of connectors—tools that let Claude work alongside the software creative professionals rely on, so creatives can extend their reach.」

[[Anthropic]] 從 coding agent 與 enterprise 戰場延伸到 **creative production** 工具鏈——透過 [MCP](https://modelcontextprotocol.io/) connectors 讓 Claude 直接操作創意人日常使用的軟體。

---

## 8 個 launch connector

| 連接器 | 目標軟體 | 作用 |
|--------|----------|------|
| **Ableton** | Ableton Live、Push | 把 Claude 答案 grounded 在 Live/Push 官方文件 |
| **Adobe for creativity** | Photoshop、Premiere、Express 等 50+ 工具（Creative Cloud） | 讓 Claude 把圖片、影片、設計帶到生命中 |
| **Affinity by Canva** | Affinity 套件 | 自動化 batch image 調整、layer 改名、檔案匯出；可在 app 內生成自訂功能 |
| **Autodesk Fusion** | Fusion 3D modeling | 讓設計師與工程師透過對話建立並修改 3D 模型 |
| **Blender** | Blender 3D suite | 自然語言介面到 Blender Python API；探索與理解複雜 setup |
| **Resolume Arena / Wire** | VJ / 即時視覺工具 | 讓 VJ 與 live visual artists 透過自然語言即時控制 |
| **SketchUp** | SketchUp 3D modeling | 把對話變 3D modeling 起點——描述房間/家具/場景概念 |
| **Splice** | Splice 音樂庫 | 從 Claude 內搜尋 royalty-free samples |

> **重要規格**：所有 connector 建立在 [MCP](https://modelcontextprotocol.io/) 標準上——可被其他 LLM 使用，反映 Blender 等夥伴的 open source 與 interoperability 立場（不只是 Claude 獨佔）。

---

## 5 種 Claude 為創意工作的使用場景

| 場景 | Claude 的作用 |
|------|--------------|
| 學習與精通工具 | 充當隨選導師——解釋 modifier stack、合成技巧、不熟功能 |
| 用程式碼擴充工具 | [[Claude Code]] 寫 script、plugin、generative system——custom shader、procedural animation、parametric model |
| 跨工具 pipeline 接合 | 翻譯格式、重組資料、跨 design / 3D / audio 工具同步資產 |
| 快速探索與交付 | **Claude Design**（[[Anthropic]] Labs 新產品）視覺化選項並依回饋 iterate；初支援匯出到 Canva |
| 重複生產工作 | batch 處理資產、設立專案 scaffolding、scene 內 procedural 變更 |

---

## 與 Blender 的特別關係

> 「Blender 是免費、開源 3D 創作套件，從 indie 遊戲開發、motion graphics 到建築可視化、電影製作都在用。」

- Blender 開發者建立了 MCP connector，現官方支援 Claude
- 例：3D 藝術家可用 Blender connector 分析 / debug 整個 Blender scene、透過 Python API 批次更改物件
- **Anthropic 加入 Blender Development Fund 為 patron**——支持 Python API 持續開發
- connector 建立在 MCP 上，**對其他 LLM 也可用**——展現 Blender 的 open source / interoperability 哲學

---

## 學術合作（藝術與 AI 教育）

Anthropic 同步宣布與 3 所藝術院校合作，把 Claude 與新 connectors 帶入 creative computation 課程：

| 學校 | 學程 |
|------|------|
| Rhode Island School of Design | Art and Computation |
| Ringling College of Art and Design | Fundamentals of AI for Creatives |
| Goldsmiths, University of London | MA/MFA Computational Arts |

學生與教員獲得 Claude 與新 connectors，他們的回饋將協助 Anthropic 理解創意實踐者的需求——並計畫擴展到更多機構。

---

## 為什麼重要——延伸 04-18 Anthropic Labs 日

[[Anthropic]] 04-18 已釋出 [[Claude Code]] 系列 + Claude Design（[[src-hn-2026-04]] HN #8 1,104 分 + [[src-producthunt-2026-04]] PH #1）。**04-28 Claude for Creative Work 是同一個產品擴展節奏的延續**：

```
2026-04-18 Anthropic Labs 日 (Claude Design + skills 生態)
       ↓
2026-04-23 Claude Code 品質下降 postmortem (見 [[src-agent-model-body-harness]])
       ↓
2026-04-28 Claude for Creative Work (8 個 connector)
```

**戰略意義**：
- **市場橫向擴張**：從 coder（[[Claude Code]]）→ designer（[[Anthropic]] Labs Claude Design）→ creative professional（本次 connectors）
- **MCP 從技術接口變創意產業標配**：Blender / Autodesk / Adobe / Ableton 等老牌軟體都採 MCP——這個標準化動作的影響超越 Claude 本身
- **與 [[OpenAI]] 路徑分化**：OpenAI 04-21 推 ChatGPT Images 2.0（gpt-image-2）走「自家 image model + thinking」路線；Anthropic 走「合作既有工具 + connector」路線——同樣是創意 AI，兩家路徑完全不同

---

## 與本知識庫的關係

### 直接呼應頁面

- [[Anthropic]]——本次事件加入該 entity 頁時間軸
- [[Claude Code]]——Claude Code 在文中被列為 5 個使用場景之一（用 code 擴充工具）
- [[Skill vs Bash vs MCP]]——8 個 connector 全是 MCP 模式工具——是 MCP 從 SaaS（Linear、Sentry）擴展到創意工具的標誌性事件
- [[src-agent-model-body-harness]]——connectors 屬於 body 層擴充（讓 Claude 能操作 Blender API、Autodesk Fusion 模型等）；harness 不變、body 長新器官的證據

### 連動的 wiki 中既有條目

- [[src-hn-2026-04]] 04-18 Anthropic Labs 日（HN #8 1,104 分）
- [[src-producthunt-2026-04]] 04-18 Claude Design PH #1
- [[src-github-trending-2026-04]] 04-18 awesome-claude-design
- [[src-agent-model-body-harness]] Anthropic 4/23 postmortem（同月份事件鏈）

---

## 查核備註

✅ 內容直接出自 Anthropic 官方公告（不是新聞報導二手）；引用 partner 名單與 Blender Development Fund 加入屬實，可由各 partner 官方 press release 交叉驗證。

⚠️ 「Anthropic 加入 Blender Development Fund」具體 patron level / 金額未公開——值得追蹤是否為一次性贊助或長期合作。

⚠️ 8 個 connector 中部分（如 Affinity by Canva、SketchUp）需確認是 Anthropic 官方維護還是 partner 自行維護的 MCP server——影響長期支援承諾。

---

## 相關頁面

- [[Anthropic]]（本公告發布方）
- [[Claude Code]]（5 個使用場景中的「程式碼擴充工具」載體）
- [[Skill vs Bash vs MCP]]（8 connector = MCP 規模化 launch 標誌）
- [[src-agent-model-body-harness]]（connectors 是 body 層擴充的範例；harness 不變、body 長新器官）
- [[src-hn-2026-04]] / [[src-producthunt-2026-04]] / [[src-github-trending-2026-04]]（04-18 Anthropic Labs 日的 wiki 既有觀察）
- [[綜整-AI協作工程的六大趨勢]]（橫向擴張對 trend 1 的補強）
