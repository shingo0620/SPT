---
title: defuddle
type: entity
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [defuddle, obsidian, skill, web-scraping, content-extraction]
---

# defuddle

> 本頁統整本 wiki 提及 defuddle 的脈絡；來源為空表示為跨來源歸納。

## 一句話定位

Obsidian 生態的 agent skill 工具，**用於從網頁 HTML 擷取「文章正文」並清理掉 nav/廣告/側欄等雜訊**——是 LLM Wiki 類工作流中「網頁來源 → Markdown」管道的關鍵一環。

## 在 [[src-obsidian-llm-wiki]] 中的角色

aster-life/obsidian-llm-wiki 將 defuddle 作為手動素材擷取的輔助工具：
- 安裝路徑：`.claude/skills/defuddle/`
- 用途：「網頁內容清理工具（擷取文章正文）」
- 在素材擷取流程中作為「手動放入 raw/」的協助工具

## 與本 wiki 工作流的對比

| 工作流 | 主要擷取機制 | Fallback |
|--------|------------|---------|
| **本 wiki**（SPT/llm-wiki） | `fetch-url.sh` → markdown.new API | 無——markdown.new 超時時需手動處理 |
| **obsidian-llm-wiki** | defuddle skill | （或其他 markdown 轉換工具） |

→ defuddle 可作為本 wiki **markdown.new 超時時的 fallback 候選**——例如 2026-04-22 ingest 中 fetch-url.sh 兩次超時的情境

## 相關頁面

- [[src-obsidian-llm-wiki]]（defuddle 出現的源頭）
- [[LLM Wiki]]（本 wiki 主要管道）
