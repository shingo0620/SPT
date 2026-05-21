---
title: 為什麼一般人不需要 Agent Team（雷蒙）
type: source
sources: ["為什麼我覺得一般人不需要 Agent Team？.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [agent-team, multi-agent, claude-code, super-individual, single-agent, organization-design]
---

# 為什麼一般人不需要 Agent Team（雷蒙）

> 來源：雷蒙（研究新時代超級個體）長文。引用大人學張國洋老師的觀察。屬個人實踐觀點，非學術論文。

## 一句話主張

對個體工作者而言，與其在 AI 上複製人類組織的「部門牆」（行銷 Agent／設計 Agent／PM Agent…），不如把知識、技能、SOP、工具、品味全寫成 AI 能讀的 Skill / Workflow / CLAUDE.md，**信任單一全能 AI 代理人自行判斷派工**——管「成果與品味」，不管「流程與分工」。

## 三個經濟學/CS 理論支撐

### 1. Coase 交易成本理論——公司分部門是「迫不得已」非「美好設計」

- 寇斯（Ronald Coase）經典問題：「市場若那麼有效率，為何有公司存在？」答案：交易有成本（找人、議價、簽約、驗收、追進度、處理糾紛）
- 公司分部門的本質：**人類受限於自身能力（一人無法同時頂尖行銷+設計+工程）的權衡**，不是最優產出設計
- **關鍵反轉**：AI 沒有這個極限——一個 Claude/GPT 理論上讀過所有公開領域知識、無時間極限、無技能極限。「分部門」的根本原因在 AI 身上不存在

### 2. Brooks's Law（人月神話）——溝通成本以平方增長

- n 個人的溝通連線是 n(n-1)/2：3 人 3 條、10 人 45 條、30 人 435 條
- 套在 Agent Team：每多一個 Agent = 多一個介面/prompt/角色定義/交接協議 = 多一條需維護、測試、翻譯的溝通邊界
- 「你以為在做精細化分工，其實在替自己累積管理債」

### 3. Conway's Law——你怎麼切 Agent，產出就長那樣

- 「組織設計的系統會反映組織的溝通結構」
- 預設「文案歸行銷 Agent、設計歸設計 Agent」= 在 AI 產出裡硬切一條本不需要的邊界 → 文案少視覺感、設計少文字節奏、整合時各 Agent 只看到自己那塊
- 結論：**AI 在「單一任務」表現驚人，但「多 Agent 協作」反而斷點、誤解、重工——不是 AI 變笨，是你把它變回人類組織的樣子**

## 認知層面的核心洞察——「把解法寫進提問」

> 最危險的不在架構層，而在認知層。

當你說「派給行銷 Agent 寫貼文」，你已替 AI 做完 3 個決定：這是行銷任務、要寫成貼文、用行銷視角。AI 接到的不是開放問題，而是被預鋪的軌道——只能在你劃定框框裡找局部最佳解，但**最好的方案常不在框裡**。

雷蒙的 CLAUDE.md 有一條：「當我提出需求，不盲目執行，你會挑戰假設、提出更好方案」——AI 反而常產出比預想更好的方案。

> 這也是為什麼 2024-2025 瘋傳的「提示詞模版」現在反成「詛咒」——你的 AI 能力被限制在模版提供者的認知裡。
> （呼應 [[src-karpathy-12-claude-rules]]「叫 Claude 當 senior 沒用」「範例比規則重、會過擬合」）

## 什麼時候才真的需要 Agent Team？

- **稽核 / 平行測試**：讓 Codex 稽核 Claude Code 的產出——需要獨立視角檢查另一 AI，不被原脈絡污染。此時「資訊隔離」變優點
- **關鍵區別**：這是**動態**分工（被當下任務叫出來），不是**結構性**分工（預先固定組織圖等任務上門）
- 多數教學在做後者——「把組織圖刻在 AI 上，讓任務配合組織圖」，這是反的
- **企業/團隊場景**例外：角色可審查、可重複、新人 onboard 快——這些是組織治理需求

## 與本 wiki 的連結

- **直接對位** [[Multi-Agent 失敗分類學]]（[[src-mast]]）——學術版證實多 agent 失敗率 41-86.7%；本文是「個體工作者」視角的同一結論：結構性多 agent 反而製造 FC1 系統設計 + FC2 跨 agent 對齊失敗
- **引用《人月神話》Brooks's Law**——對應 [[src-hn-2026-05]] 5/9 HN「Mythical Man Month」當日上榜（242 分）
- **「信任單一全能 agent + 寫好 Skill/Workflow/CLAUDE.md」**——呼應 [[src-karpathy-12-claude-rules]] 的「行為契約」+ [[Andrej Karpathy]] Agentic Engineering
- **「管成果不管流程」的放手哲學**——對應 [[src-karpathy-sequoia-ascent-2026]]「外包思考但不外包理解」（雷蒙是外包流程、保留品味判斷）
- **與本 wiki 全域 CLAUDE.md「永遠不過度設計」呼應**——Agent Team 對個體即是過度設計

## 查核備註

- ✅ **三個理論**（Coase 交易成本、Brooks's Law、Conway's Law）引用正確，是真實且廣被驗證的經濟學/CS 原理
- ⚠️ **「AI 沒有極限」屬樂觀簡化**——實際 LLM 有 context window 限制、長 context 注意力衰減（對應 [[src-karpathy-12-claude-rules]] 規則 6 token 預算、規則 10 checkpoint）。單一 agent 在超長多步驟任務仍會「迷失」，故 Karpathy 12 規則才需 checkpoint/budget——這與「單 agent 全能論」有張力，**最佳實踐可能是「單 agent 為主 + 動態子任務隔離」的混合**
- ✅ **觀點本身**（個體工作者不需結構性 multi-agent）與 [[src-mast]] 學術發現方向一致
