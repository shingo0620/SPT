---
title: "Skill — guizang-ppt（雜誌風網頁 PPT）"
type: source
sources: [op7418-guizang-ppt-skill-README.md]
created: 2026-04-26
updated: 2026-04-26
tags: [agent-skill, ppt, html, magazine-style, op7418, guizang, design-system]
---

# Skill — guizang-ppt（雜誌風網頁 PPT）

> 作者：[op7418](https://github.com/op7418)（歸藏，X/Twitter 知名 AI 內容創作者，「一人公司」題材線下分享主講人）
> Repo：[op7418/guizang-ppt-skill](https://github.com/op7418/guizang-ppt-skill)
> 授權：MIT © 2026
> 安裝指令：`npx skills add https://github.com/op7418/guizang-ppt-skill --skill guizang-ppt-skill`

## 一句話定位

把 prompt 直接變成「**電子雜誌 × 電子墨水**」風格的橫向翻頁 HTML 簡報——像 Monocle 雜誌貼上代碼的樣子。10 種 layout、5 套主題色、WebGL hero 背景、**單檔 HTML 不需 build 不需 server**。

---

## 1. 製作方式（這個 skill 是怎麼建的？）

### 檔案結構（README 對外公開部分）

```
guizang-ppt-skill/
├── SKILL.md              ← 主指令：工作流、原則、常見錯誤
├── README.md             ← 對外介紹
├── assets/
│   └── template.html     ← 完整可跑的 seed HTML（CSS + WebGL + 翻頁 JS 全配好）
└── references/
    ├── components.md     ← 組件手冊（字體、色、網格、圖示、callout、stat、pipeline）
    ├── layouts.md        ← 10 種頁面 layout 骨架（可直接貼）
    ├── themes.md         ← 5 套主題色預設（**不允許自訂 hex**）
    └── checklist.md      ← 品質檢查清單（P0/P1/P2/P3 分級）
```

### 設計哲學的「強約束」

| 設計選擇 | 用意 |
|---------|------|
| **不允許自訂 hex 值，只能選 5 套** | 「**保護美學優先於給自由**」——避免使用者把所有 PPT 都調成醜色 |
| **layout 限定 10 種**（封面、章節幕封、數據大字報、左文右圖、圖片網格、Pipeline、懸念問題、大引用、Before/After、圖文混排） | 強制使用者選擇現有結構，不允許自由排版 |
| **單檔 HTML、不允許 build** | 對抗「PPT 變成軟體工程專案」的傾向 |
| **WebGL 背景只能在 hero 頁** | 避免裝飾過度 |
| **術語統一**：Skills 就是 Skills，不中英混譯 | 文化自信、避免 cargo cult |

→ 這是典型「**透過約束釋放創造力**」的設計風格——對應 `references/checklist.md` 的 P0/P1/P2/P3 嚴格分級

### 6 步驟工作流

| 步驟 | 做什麼 |
|------|-------|
| 1. 需求澄清 | **6 問清單**：受眾、時長、素材、圖片、主題色、硬約束 |
| 2. 拷貝模板 | `assets/template.html` → 專案目錄，改 `<title>`、換主題色 |
| 3. 填充內容 | 從 10 種 layout 骨架挑、貼、改文案（先做類名預檢 + 主題節奏規劃） |
| 4. 自檢 | 對照 `references/checklist.md`，**P0 級必須全過** |
| 5. 預覽 | 瀏覽器直接開啟 |
| 6. 迭代 | inline style 改字號／高度／間距 |

### 與其他 skill 的設計風格對比

| skill | 風格 | 主軸 |
|-------|------|------|
| **[[src-skill-ast-grep]]** | 極簡派 | 工作流步驟驅動，無 metadata |
| **[[src-skill-character-arc]]** | 結構派 | 豐富 metadata、多層 diagnostic protocol |
| **[[src-skill-3b1b-style-animation-skill]]** | 內容派 | 強 core philosophy + 三層子目錄 |
| **guizang-ppt（本頁）** | **強約束派** | 透過 5 主題、10 layout、P0~P3 分級限制使用者選擇 |

---

## 2. 應用場景（什麼時候該用這個 skill？）

### 適合
- 線下分享、行業內部講話、私享會
- AI 產品發布、demo day
- 帶強烈個人風格的演講

### 不適合
- 大段表格資料（資訊密度不夠）
- 培訓課件
- 多人協作編輯（靜態 HTML、無協作）

### 觸發語
- 「幫我做一份雜誌風 PPT」
- 「生成一個 horizontal swipe deck」
- 「editorial magazine style presentation」
- 「electronic ink 風格演講 slides」

---

## 3. 工作流整合（怎麼融入我的工作流？）

### 與 wiki 既有概念的關係

**與 [[Skill vs Bash vs MCP]]**：
- guizang-ppt 是**內容生成型 skill**——本質是「把使用者的口語需求 + 6 問清單 → 渲染為高品質 HTML」
- 比 ast-grep（工具型 skill）更貼近「設計師助理」角色
- 對應 [[綜整-AI協作工程的六大趨勢]] 中「skill 垂直化」主軸——**從通用 PPT 工具（如 Marp）走向「特定美學風格 + 特定使用情境」**的精細分層

**與 [[Garry Tan]] 的「Thin Harness, Fat Skills」**：
- README 直接引用 Garry Tan 此論述為視覺參考
- guizang-ppt 是「Fat Skill」的具體案例：
  - **Thin Harness**：Claude Code agent 本身只負責對話與 tool calling
  - **Fat Skill**：本 skill 包含完整 layout、theme、checklist、template——所有設計決策內建

**與 [[src-Solo SaaS架構]] / [[levelsio]] / [[antfu]] 的 indie 哲學**：
- op7418 是中文 AI 圈版本的 levelsio——「一人公司、個人品牌、線下分享 → 沉澱為開源資產」
- 與 antfu 的「微型工具」風格不同，guizang-ppt 是**「個人方法論的工具化」**——把多次線下分享踩的坑（checklist.md）封裝成可重複執行的 skill

### 一句話推薦

> **如果你常做「個人風格強烈、注重美學、單向發送」的線下分享或 demo day，這個 skill 把「美學 + 工作流 + 踩坑經驗」一次給你。但若你需要協作或大量數據呈現，回去用 Slidev、Marp 或 Google Slides。**

「強約束派」的設計選擇也意味著**自由度低**——你拿不到自訂 hex 顏色、不能加新 layout——是它的特色與限制。

## 相關頁面

- [[src-skill-ast-grep]] / [[src-skill-character-arc]] / [[src-skill-3b1b-style-animation-skill]]（其他 skill 解析頁，風格對比）
- [[Skill vs Bash vs MCP]]（skill 在 LLM 工具光譜中的定位）
- [[Garry Tan]]（"Thin Harness, Fat Skills" 論述參考來源）
- [[skills.sh]]（agent skill 策展平台）
- [[綜整-AI協作工程的六大趨勢]]（skill 垂直化趨勢的具體案例）
- [[src-addyosmani-agent-skills]] / [[src-mattpocock-skills]] / [[src-obsidian-llm-wiki]]（其他 skill 集合）
