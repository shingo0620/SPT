---
title: LLM Wiki 原始構想文件
type: source
sources: [LLM Wiki.md]
created: 2026-04-13
updated: 2026-04-13
tags: [LLM Wiki, 構想文件, Karpathy, 知識管理]
---

# LLM Wiki 原始構想文件

## 摘要

[[Andrej Karpathy]] 撰寫的 [[LLM Wiki]] 完整構想文件。刻意保持抽象——描述的是想法而非特定實作，具體細節由使用者與 LLM agent 協作決定。

## 核心論點

大多數人用 LLM 搭配文件的體驗像 RAG：每次查詢都從頭重新發現知識，沒有累積性。LLM Wiki 不同——讓 LLM 逐步建立並維護一個持久存在的 wiki，知識只需整理編譯一次，之後持續更新。

> wiki 是一個持續存在、會不斷複利增長的成果物。交叉引用已經存在，矛盾也早已被標記出來。

## 三層架構

1. **Raw sources**（不可變真實來源）
2. **Wiki**（LLM 生成維護的 Markdown 目錄）
3. **Schema**（CLAUDE.md / AGENTS.md，約束 LLM 行為的設定檔）

## 三種操作

- **Ingest**：匯入來源，單一來源可能影響 10-15 頁。偏好一次一個、持續參與。
- **Query**：查詢 wiki，好的回答可回存成新頁面，探索也產生複利。
- **Lint**：健康檢查——矛盾、過時主張、孤立頁面、缺漏概念、資料缺口。

## 歷史脈絡

精神承接 Vannevar Bush 於 1945 年提出的 Memex：私人的、主動策展的知識儲存，文件之間的關聯與文件本身同樣有價值。Bush 當年無法解決的維護問題，現在交給 LLM。

## 為什麼有效

人們放棄 wiki 是因為維護成本增長超過價值。LLM 不會覺得無聊、不會忘記更新交叉引用，能一次處理 15 個檔案。人類負責：挑選來源、引導分析、提出好問題。LLM 負責：其餘的一切。

## 使用情境

- 個人：目標、健康、心理狀態、自我成長追蹤
- 研究：深入鑽研主題，論文與報告的持續整合
- 讀書：角色、主題、情節線與關聯（類比 Tolkien Gateway 粉絲 wiki）
- 商業團隊：Slack、會議逐字稿、專案文件、客戶通話的內部 wiki
- 其他：競品分析、盡職調查、旅遊規劃、課程筆記

## Obsidian 工具整合

- **Web Clipper**：瀏覽器擴充套件，網頁轉 Markdown 匯入 raw/
- **圖片本地化**：設定附件資料夾為 raw/assets/，綁定快捷鍵下載
- **Graph View**：觀察 wiki 結構，辨識樞紐與孤點
- **Marp**：Markdown 簡報生成
- **Dataview**：對 frontmatter 執行查詢，動態表格與清單

## 相關頁面

- [[LLM Wiki]]
- [[Andrej Karpathy]]
- [[src-karpathy筆記實作]]
- [[src-向三位大師學AI筆記]]
