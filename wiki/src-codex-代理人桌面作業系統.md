---
title: Codex 是新一代作業系統？Every CEO 從 Claude Code 投奔 Codex
type: source
sources: [codex是新一代作業系統新創ceo實測6種ai工作流他為何甘願從claude-code投奔codex數位時代-businessnext.md]
created: 2026-05-19
updated: 2026-05-19
tags: [codex, claude-code, agent-os, openai, anthropic, agent-management-interface, workflow]
---

# Codex 是新一代作業系統？Every CEO 從 Claude Code 投奔 Codex

> 來源：數位時代 BusinessNext 2026-05-15（李先泰整理），基於 Every YouTube《Why We Switched From Claude Code to Codex》Codex Camp 直播。[原文](https://www.bnext.com.tw/article/90960/ai-agent-desktop-operating-system-codex-vs-claude)

## 一句話

Every 創辦人 Dan Shipper 從偏愛 Claude Code 轉向 OpenAI Codex 桌面 app，但真正的訊號不在「Codex 比 Claude Code 強」，而在他的判斷：**正在浮現一種新作業系統——專門管理代理人的工作介面（agent management interface），這場競賽會決定知識工作者未來「打開電腦看到的第一個畫面」**。

## 代理人桌面爭霸戰：四家模型公司押注

| 公司 | 押注產品 | 戰略亮點 |
|------|---------|---------|
| [[Anthropic]] | Claude Code、Claude for Work | 最早證明能寫程式的代理人，能做任何形式知識工作 |
| [[OpenAI]] | Codex 桌面 app | 三個月硬轉向，從工程師工具改寫成寫作/招募/營運全職能 app |
| xAI | 與 Cursor 戰略合作 | 100 億美元戰略合作 + 最高 600 億美元收購選擇權（仍未完成；彭博/CNBC 報導） |
| Google | Antigravity IDE | 代理人優先的 IDE 搶占桌面 surface |

> 「誰拿下這層 surface，誰就拿下知識工作者打開電腦看到的第一個畫面。」

## 轉折時間軸

- **GPT-5 時代**：OpenAI 內部分工——一般人在 ChatGPT vibe coding，資深工程師才開 Codex 做 pair programming；當時 Codex「沒有情商、會跟你吵架、讓你覺得自己很笨」，被限制在沙盒
- **Anthropic 證明的事**：一個夠快、夠聰明、有情商、能存取你電腦的模型，對程式設計師是極佳體驗；既然能寫軟體就能做任何知識工作——Claude Code 因此從工程師工具長成跨職能代理人
- **OpenAI 三個月「硬轉向」**：Codex 從只給工程師 → 寫作/招募/營運都能用的桌面 app
- **GPT-5.5 是真正轉折**（4/23 發表、5/5 GPT-5.5 Instant）：Every 提前試用發現「模型本身已和 Anthropic 至少打平」（除設計工作仍信任 Claude Opus）

## 為什麼是 Codex 桌面 app 而非 Claude？

成長主管 Austin 的全面搬家「不是模型，是 app 本體」：
- **「我從來沒成功讓 Claude for Work 在我這邊跑起來」**
- Codex 桌面 app 的速度、子代理（sub agent）品質、自動化推送順暢度，是 Anthropic 桌面 app 還沒追上的細節
- 「我 80% 工作時間在 Codex 裡，它從 Gmail/Slack/Notion/Stripe 拉資料」

> Shipper 警告：未來一兩年兩家像賽馬輪流領先；現在切換成本還低，但等生態長出來，**選定的代理人桌面 app 會像 10 年前選 iOS vs Android 那樣把你綁進整個工作生態**。

## Every 六種代理人工作流

| # | 工作流 | 一句話精華 |
|---|--------|-----------|
| 1 | 整套工作環境變成資料夾 | API 金鑰、專案說明、審稿代理人全放進「every growth OS」單一資料夾 |
| 2 | 先讓代理人腦力激盪 | 不直接下命令，先讓 Codex 從 Notion/Slack/Gmail 看你怎麼工作再提建議 |
| 3 | 代理人寫草稿、人類完稿 | Codex 在 Slack/Gmail 留草稿，使用者切回原生介面才送出，保留人對人判斷瞬間 |
| 4 | GTM 計畫五分鐘出底稿 | 逐字稿/Slack/模板全餵 Codex 跑「複合工程」三段流程，輸出 80-90% 就位 |
| 5 | 招募變「大海撈針」 | 用具體假設（如「2010 年代 GA 校友後轉 AI」）讓代理人撈名單，取代獵頭兩週 |
| 6 | KPI 儀表板逐欄手動驗證 | 初版誤差 5-10% 必須退回手動——源頭 3% 誤差會讓下游決策歪掉 |

## 兩個關鍵洞察

### 1. 讓代理人告訴你工具該怎麼用——SaaS 邏輯反轉

Austin 開新對話常先反問 Codex：「看看我最常用 Notion/Slack/Gmail 做什麼，建議幾個自動化。」
> Shipper：「讓前沿模型告訴你『這工具該怎麼用』，比自己想破頭快太多。」
- **舊**：我有目的、工具幫我達成
- **新**：我有原料、模型告訴我能做什麼

### 2. KPI 儀表板：3% 誤差會讓下游全歪——代理人鏈誤差複合放大

- Austin 鐵則：「只要源頭資料有 3% 誤差，整個代理人鏈下游決策都會歪掉」
- 飲料店比喻：POS 設定錯 3%（微糖記成半糖）→ 第一層代理人算出「客人愛甜」→ 第二層設計新品更甜 → 第三層多叫糖漿少叫茶葉 → 新品全偏甜、糖漿爆庫存、茶葉缺貨
- **每個代理人都「照數據合理調整」，但因起點 3% 錯，整條決策鏈一起被帶歪——誤差在鏈條中複合放大，非線性增加**

## 文件讀者從「人」變「人透過代理人」

- Shipper 重定義工作本質：「上班時間大部分是把已想過的東西轉成別人能讀的格式。重要的是先把思考做完」（呼應 [[src-karpathy-sequoia-ascent-2026]]「外包思考但不外包理解」）
- Every 規矩：交出代理人寫的文件，會議被問細節不能說「我不知道有寫這個」——被抓包就完了
- Codex 專案檔放規則：「不要自己加沒在別處出現過的內容」「新建議丟 chat 不要塞進文件」——把 AI 從「會幻想的助理」拉回「會整理的祕書」
- **agent-readability（可被代理人解析）開始比文字優美度更重要**——Every 推自家產品 Proof（markdown 在團隊間傳遞、讓代理人直接讀）

## 三個趨勢（給台灣讀者）

1. **代理人重定義「打開電腦做什麼」**——入口從瀏覽器/SaaS 儀表板 → 能跨 app 操作的代理人桌面
2. **工具切換速度以「季」為單位**——「選一家供應商走到底」風險變高；每季至少保留一天「玩工具時間」（Every 每年兩次「Think Week」）
3. **文件設計要為代理人讀者服務**——markdown、清晰章節、可被機器引用的段落結構從「工程師偏好」變「跨部門通用標準」

> 結尾金句：「工具與工作流變得太快，光跟著現在的工作方式跑，會被用新工具新範式的人靠預設值打敗。」

## 與本 wiki 的連結

- **「agent management interface 作業系統」**——對應 [[src-agent-model-body-harness]]、[[src-oh-my-codex]]（Codex CLI harness 工具）
- **「3% 誤差複合放大」**——對應 [[Multi-Agent 失敗分類學]] FC2 跨 agent 對齊失敗 + [[src-雷蒙-不需要-agent-team]] Conway's Law「代理人鏈斷點」；三來源（學術/個體/企業）同指「多 agent 鏈式誤差」
- **「文件為代理人讀者服務 / agent-readability」**——正是 [[LLM Wiki]] 本專案的核心（markdown wiki 讓 LLM 直接讀），呼應 [[src-karpathy-sequoia-ascent-2026]] Karpathy 把 LLM Wiki 列為代表案例
- **GPT-5.5 / Codex 3.0**——對應 [[OpenAI]] 既有記錄（04-24 GPT-5.5 + Codex 3.0）
- **同期 bnext 報導鏈**：本文 + [[src-karpathy-12-claude-rules]]（bnext「CLAUDE.md 12 條」改寫）+ Founder's Playbook（bnext「Anthropic 新創 AI 指南」，PDF 待擷取）——台灣科技媒體同期 agent 工程主題密集

## 查核備註

- ✅ **四家押注**：Anthropic/OpenAI/Google 產品屬實；xAI-Cursor 600 億收購選擇權「仍未完成」已正確標注（彭博/CNBC 報導）
- ⚠️ **立場揭露**：Shipper 與 Austin 是 OpenAI 深度使用者與生態共建者，對 Codex 有正面立場；「Codex 比 Claude 強」是個人體驗非客觀評比
- ⚠️ **本文初稿 AI 編撰**（bnext 自陳，李先泰整理）——二手轉述 Every 直播，非第一手
