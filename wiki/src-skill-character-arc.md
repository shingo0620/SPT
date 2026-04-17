---
title: "Skill 解析：character-arc"
type: source
sources: [skills-picks-2026-04-16.md]
created: 2026-04-16
updated: 2026-04-16
tags: [skills-sh, agent-skills, writing, fiction, diagnostic]
---

# Skill 解析：character-arc

> skills.sh Pick of the Day — 2026-04-16
> 來源：[jwynia/agent-skills](https://github.com/jwynia/agent-skills) | [skills.sh 頁面](https://skills.sh/jwynia/agent-skills/character-arc) | 安裝數：248

**一句話**：如果你用 AI 寫故事或設計遊戲劇情，這個 skill 是角色弧線的診斷工具。

## 概述

character-arc 是一個**非程式碼類** Agent Skill，專注於創意寫作中的角色弧線（Character Arc）設計與診斷。它證明 skills 不只是給 coding 用的——敘事結構、角色轉變、故事節拍都可以用結構化的 skill 來引導 LLM 行為。

安裝指令：
```
npx skills add https://github.com/jwynia/agent-skills --skill character-arc
```

---

## 1. 製作方式

### Metadata

| 欄位 | 值 |
|------|---|
| type | diagnostic |
| mode | diagnostic + assistive |
| domain | fiction |
| license | MIT |
| version | 1.0 |
| author | jwynia |

### 架構設計

- **單檔 skill**——沒有 rules/references 子目錄，所有知識壓縮在一個 Markdown 定義中
- 結構完整，包含：
  - **Arc Types**：正向變化弧線（Positive Change）、負向弧線（Tragedy）、平面弧線（Flat）三種模板，各有完整的組成要素定義
  - **Diagnostic 診斷流程**：6 個系統性檢查項（No Transformation、Unearned、Abrupt Change、Unclear Lie、Want/Need Alignment、Missing Struggle）
  - **Anti-Patterns**：5 種常見寫作錯誤（Informed Arc、Magic Mentor、Trauma = Transformation、Perfect Protagonist、Instant Epiphany）
  - **Arc Maps to Structure**：故事節拍與弧線節拍的對照表（Setup→Climax→Resolution）
  - **Integration 生態系**：宣告上下游 skill 關係

### 使用的 Agent 能力

- **Output Persistence**——自動將分析結果寫入檔案（`{character-name}-arc-{date}.md`），跨 session 保存
- **Output Discovery**——首次使用時詢問使用者輸出目錄偏好，儲存於 `context/output-config.md`
- 不依賴特殊工具呼叫，**純靠 prompt engineering** 引導 LLM 行為——是 [[Skill vs Bash vs MCP]] 中「Skill」模式的典型範例

### 相容平台

opencode、cursor、codex、claude-code、antigravity、gemini-cli

### 設計特色

skill 明確定義了「What You Do」與「What You Don't Do」邊界：
- **會做**：問謊言是什麼、找背景傷痕、分離 Want/Need、檢查抵抗節拍
- **不做**：不替作者選擇謊言、不指定弧線類型、不強制每個角色都要有弧線

這種邊界定義是 diagnostic 類 skill 的設計範本——輔助而非主導。

---

## 2. 應用場景

### 觸發條件

- 角色感覺靜態（static）
- 轉變不夠說服力（unearned / abrupt）
- 無法說出角色需要放棄什麼信念
- 角色為劇情服務但沒有內在旅程

### 實際使用情境

1. **遊戲敘事設計**——設計 RPG 角色成長弧線時，用 Diagnostic 的 6 個檢查項確認「謊言→真相」的轉變是否合理。特別適合檢查 The Instant Epiphany（主角突然頓悟但沒有鋪墊）和 The Perfect Protagonist（主角沒有缺陷所以沒有弧線）
2. **互動小說/視覺小說**——多條路線的角色需要不同的弧線類型。Arc Types 的三種模板（正向/負向/平面）直接對應好結局、壞結局、角色不變但改變世界的路線。Arc Maps to Structure 表格可以直接對應故事節拍設計
3. **AI 寫作助手搭配**——用 LLM 寫長篇時，當角色行為開始「跑偏」，用 Diagnostic 六問快速定位問題。搭配 [[Restatement]] 機制，可以在長篇創作過程中週期性重申角色弧線規則

### 領域

writing / fiction / game narrative

---

## 3. 工作流整合

### Integration 生態系

character-arc 是 jwynia/agent-skills 寫作 skill 群的一部分，有明確的上下游關係：

**上游（提供輸入）：**
| Skill | 提供什麼 |
|-------|---------|
| story-sense | 診斷「角色缺乏深度」，觸發 character-arc |
| story-idea-generator | 從類型出發的初始角色概念 |

**下游（消費輸出）：**
| Skill | character-arc 提供什麼 |
|-------|----------------------|
| dialogue | 角色聲音特徵（基於弧線位置） |
| scene-sequencing | 場景衝突目標（基於角色內在需求） |
| endings | 弧線完成度檢查（結局是否回應了謊言→真相的轉變） |

**互補：**
| Skill | 關係 |
|-------|------|
| cliche-transcendence | 避免俗套角色類型與轉變 |
| worldbuilding | 角色背景與世界觀一致性 |
| underdog-unit | 多角色弧線的群戲動態 |
| sensitivity-check | 角色刻畫避免刻板印象 |

### 與現有 wiki 的關聯

- **[[Skill vs Bash vs MCP]]**——character-arc 是純 Skill 模式的教科書案例：不依賴外部工具（Bash）或 API（MCP），完全靠結構化知識注入引導 LLM 行為
- **[[AI 輔助軟體工程]]**——呼應「AI 擅長在框架內填充，不擅長選擇框架」。character-arc 提供的正是框架（Lie→Truth 結構），讓 AI 在其中填充具體角色內容
- **[[Restatement]]**——長篇創作中角色弧線規則容易被「埋掉」，Restatement 機制可以週期性重申

### 推薦

適合用 AI 輔助創意寫作或遊戲敘事設計的開發者。也是學習「如何設計一個 diagnostic 類型 skill」的好範本——明確的邊界定義、結構化的診斷流程、Output Persistence 跨 session 保存。

## 相關頁面

- [[src-skills-picks-2026-04]]（月報索引）
- [[Skill vs Bash vs MCP]]（Skill 模式的定位）
- [[AI 輔助軟體工程]]（「框架內填充」原則）
- [[Restatement]]（長任務中維持規則注意力）
