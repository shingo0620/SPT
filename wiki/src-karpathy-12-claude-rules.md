---
title: Karpathy 4 規則擴充為 12 條 CLAUDE.md 模板
type: source
sources: ["Karpathy's 4 CLAUDE.md rules cut Claude mistakes from 41% to 11%. After 30 codebases, I added 8 more.md"]
created: 2026-05-19
updated: 2026-05-19
tags: [claude-code, claude-md, karpathy, agentic-engineering, best-practices]
---

# Karpathy 4 規則擴充為 12 條 CLAUDE.md 模板

> 來源：Mnimiy（@Mnilax）2026-05-09 X 長文，[原文](https://x.com/Mnilax/article/2053116311132155938)。延伸自 [[src-andrej-karpathy-skills]]（forrestchang 的 4 規則 repo）。

## 一句話

把 [[Andrej Karpathy]] 2026 年 1 月抱怨 Claude 寫程式的 3 種失敗模式提煉成的 4 條 CLAUDE.md 規則，經 30 個 codebase / 6 週實測後再加 8 條，補上 2026 年 5 月才出現的 agent 編排問題（agent 互鬥、hook 級聯、skill 載入衝突、跨 session 多步驟工作流），把錯誤率從 41% 降到 3%。

## 背景脈絡

- **起點**：Karpathy 1 月發推抱怨 Claude 寫程式三大失敗——靜默錯誤假設、過度複雜化、對不該動的程式碼造成「正交損害」
- **forrestchang 的 4 規則**：[[src-andrej-karpathy-skills]] 把抱怨打包成單檔 CLAUDE.md，首日 5,828 stars、兩週 60,000 bookmarks、至今 120,000 stars（文中數據；本 wiki 既有頁記為 103k，**屬不同時間點快照，數字成長中**）
- **本文作者貢獻**：實測證實 4 規則有效（playing-to-strengths 任務錯誤率從 ~40% 降到 <3%），但 4 規則是為「1 月的寫程式問題」設計，補 8 條對應「5 月的 agent 編排問題」

## 原始 4 規則（floor）

1. **Think Before Coding**——不靜默假設、表達 tradeoff、簡單解法先講、不確定就問
2. **Simplicity First**——最小可解程式碼、無投機功能、單次用程式碼不抽象
3. **Surgical Changes**——只動該動的、不「改善」鄰近程式碼、配合既有風格
4. **Goal-Driven Execution**——定義成功標準後迭代，而非規定步驟

> 註：這 4 條與本 wiki 使用者全域 CLAUDE.md 的「Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution」四原則**字面幾乎相同**——使用者的全域規範正是源自 forrestchang 這份 repo。

## 新增 8 規則（ceiling）

| # | 規則 | 防止的失敗 |
|---|------|-----------|
| 5 | **只用模型做判斷題**——分類/草稿/摘要/抽取用 Claude；路由/重試/狀態碼處理/確定性轉換用普通程式碼 | 把確定性邏輯交給模型導致「每週決策不同」的隨機 if-else |
| 6 | **token 預算非建議性**——每任務 4,000、每 session 30,000；逼近就摘要重開 | debug session 失控燒 token、模型反覆試已否決的修法 |
| 7 | **暴露衝突，不要平均**——兩個矛盾 pattern 挑一個（較新/較測試過），標另一個待清理 | Claude 為討好兩邊寫出「雙重 error handler」的不連貫程式碼 |
| 8 | **先讀再寫**——加程式碼前先讀該檔 exports、直接 caller、共用工具 | 在沒讀過的相同函式旁邊又寫一個重複函式 |
| 9 | **測試驗證意圖，非僅行為**——測試要編碼「為何重要」而非「做什麼」 | 12 個測試全過但 auth 在 prod 壞掉（測「有回傳」非「回傳對的」） |
| 10 | **多步驟操作要 checkpoint**——每步驟後摘要「做了什麼/已驗證/還剩什麼」 | 6 步驟重構在第 4 步出錯，第 5、6 步疊在壞狀態上 |
| 11 | **慣例勝於新意**——配合 codebase 慣例即使你不認同；要改是另一場對話 | 在 class-component codebase 引入 hooks，破壞既有測試假設 |
| 12 | **大聲失敗，不要靜默**——不確定是否成功就明說 | migration「完成」卻靜默跳過 14% 記錄，11 天後才發現 |

## 實測數據

- 30 codebases / 6 週 / 50 代表性任務 / 3 種配置
- **錯誤率**：無規則 41% → 4 規則約 11% → 12 規則 3%
- **關鍵發現**：4 規則→12 規則幾乎不增加 compliance 負擔（78%→76%），但再砍 8 個百分點錯誤率——新規則覆蓋的是不同失敗模式，不爭奪同一注意力預算
- **上限警告**：測到 18 條時 compliance 從 76% 掉到 52%；**過 14 條 / 200 行後 Claude 開始 pattern-match「規則存在」而不真正讀**

## 4 個原始模板「靜默崩壞」處

1. **長時 agent 任務**——4 規則只針對「寫程式當下」，對多步驟 pipeline 無預算/checkpoint/fail-loud 規則
2. **多 codebase 一致性**——「配合既有風格」假設只有一種風格；monorepo 12 服務時 Claude 隨機挑或平均
3. **測試品質**——Goal-Driven 把「測試通過」當成功，未要求測試有意義
4. **production vs prototype**——「Simplicity First」會對「合理需要 100 行投機鷹架」的早期原型過度開火

## 「什麼沒用」（作者試錯）

- 抄 Reddit/X 上的規則——多是 4 規則換句話說或無法泛化的領域特定規則
- 超過 12 條——200 行天花板是真的
- 依賴可能不存在的工具（「always use eslint」）——改用 capability-agnostic 措辭
- 在 CLAUDE.md 放範例而非規則——範例比規則重、Claude 會過擬合
- 「be careful」/「think hard」——純噪音，compliance ~30%（不可測試）
- 叫 Claude「當 senior」——沒用，Claude 已自認 senior；gap 在「想 vs 做」

## 心智模型

> CLAUDE.md 不是願望清單，是**行為契約**——每條規則都該回答「這防止什麼錯誤」。

作者強調「讀 12 條、留下對應你真實犯過的錯的、丟掉其餘」——**一個對準你真實失敗模式的 6 條 CLAUDE.md 勝過有 6 條你用不到的 12 條**。

## 與本 wiki 的連結

- 延伸自 [[src-andrej-karpathy-skills]]（forrestchang 4 規則 repo）
- 規則 5「只用模型做判斷題」呼應 [[Skill vs Bash vs MCP]]（如有）的「確定性工作不交給 LLM」
- 規則 7「暴露衝突不要平均」、規則 12「大聲失敗」呼應 [[Multi-Agent 失敗分類學]] 的 FC3 任務驗證失敗
- [[Andrej Karpathy]] 的 Agentic Engineering（見 [[src-karpathy-sequoia-ascent-2026]]）——CLAUDE.md 規則化正是「agent 工程從手藝升格學科」的微觀體現
- 對應 [[src-hn-2026-05]] 5/16「AI psychosis」、5/17「AI 不會讓流程更快」——規則化是對抗 AI 過度信任的防線

## 查核備註

- ⚠️ **stars 數字**：文中「120,000 stars」與本 wiki 既有 [[src-andrej-karpathy-skills]]「103k stars」為不同時間快照，repo 仍在成長；未獨立驗證 120k 數字
- ⚠️ **41%→3% 錯誤率**：單一作者 self-report，無公開資料集或第三方複現；方法（50 任務分類計數）合理但屬個人實測，非學術對照——與 [[src-mast]] 的學術 41-86.7% 失敗率「數字接近」屬巧合，兩者衡量對象不同
- ✅ **規則內容**：12 條規則本身與 Claude Code 官方「CLAUDE.md advisory、~80% 遵循、過 200 行劣化」說法一致
