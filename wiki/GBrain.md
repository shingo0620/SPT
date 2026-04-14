---
title: GBrain
type: concept
sources: [向三位大師學AI筆記.md]
created: 2026-04-13
updated: 2026-04-13
tags: [知識管理, 企業級, pgvector, Agent]
---

# GBrain

由 [[Garry Tan]] 建立的企業級個人知識管理系統，是真實運行的日常系統。

## 核心理念

當個人知識庫像公司一樣有資產負債表，你需要的是資料庫與管線，而不只是資料夾。

## 規模

- 萬級 Markdown 頁面
- 千級人物檔
- 多年日曆與會議轉錄

## 頁面模型

- **Compiled truth**：當前最佳論述，隨新證據更新
- **Timeline**：只增不刪的證據鏈，保留歷史脈絡

## 檢索架構

- 關鍵字 + 向量 + RRF（Reciprocal Rank Fusion）的工程級組合
- Postgres + pgvector 支撐

## Agent 整合

- Agent 透過 skills 知道何時讀、何時寫
- 自動 enrichment 與夢境維護
- 知識隨訊號進場而更新
- 與 OpenClaw / Hermes 類 agent memory 分工：一個管世界事實，一個管操作偏好

## 適用場景

- 人脈、公司、交易、會議高密度的知識工作者
- 資料量已讓 grep 失效、需要增量同步與圖譜式關聯的人
- 願意承擔雲端資料庫與嵌入成本換取長期可運營的人

## 相關頁面

- [[Garry Tan]]
- [[LLM Wiki]]
- [[QMD]]
- [[三大知識管理系統比較]]
