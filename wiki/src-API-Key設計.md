---
title: API Key 設計探索——從 SHA-256 到 SHAKE256 的多租戶路由方案
type: source
sources: [My adventure in designing API keys.md]
created: 2026-04-15
updated: 2026-04-15
tags: [API, 安全性, 資料庫, 軟體工程]
---

# API Key 設計探索——從 SHA-256 到 SHAKE256 的多租戶路由方案

## 來源資訊

- 作者：vjay15
- 連結：https://vjay15.github.io/blog/apikeys/
- 發布日期：2026-04-12
- HN 討論：https://news.ycombinator.com/item?id=47739278

## 摘要

一位開發者在多租戶分片系統中設計 API Key 的實戰記錄。核心問題：如何用 API Key 路由到正確的 DB Shard？探索了 4 種方案，最終選擇 SHAKE256（SHA3 變體）+ base64url 編碼。過程中發現了 B-Tree 索引與 BigInt 效能的反直覺結論。

## API Key 結構

```
[前綴] + [隨機 hex] + [checksum]
```

- **前綴**：識別 key 類型（如 GitHub 用 `gh_`、Stripe 用 `sk_live_`）
- **隨機部分**：隨機生成的 hex 字串
- **Checksum**：打 DB 之前先驗證格式是否有效
- HN 社群回饋：前綴 + checksum 的真正用途是**離線 secret 掃描**

Key 建立後 hash 存 DB，原文不保留——跟密碼一樣，只顯示一次。

## 多租戶路由：4 種方案比較

| 方案 | 做法 | RTT 中位數 | 缺點 |
|------|------|-----------|------|
| 完整 SHA-256 映射 | hash → 帳號 ID | 0.222ms | 重複儲存完整 hash |
| 前綴方案 | 帳號專屬前綴嵌入 key | 可比 | 前綴可預測，碰撞風險微增 |
| Base-62/70 編碼 | hash 編碼後取前 N 字元 | 0.779ms | BigInt 除法慢 43 次 |
| **SHAKE256**（最終） | 可變長度 hash + base64url | **0.113ms** | 無明顯缺點 |

## 關鍵發現

### B-Tree 對字串一樣高效

> 「我假設縮短字串會加速查找——這是錯的。」

PostgreSQL 的 B-Tree 索引對任何可排序資料都有效。64 字元的 SHA hash 在樹中就是一個可排序的節點，查找效率與短字串無異。

### JavaScript BigInt 很慢

Base-62/70 方案需要反覆做 BigInt 除法（43 次）。BigInt 是軟體模擬的任意精度數學，不走硬體原生指令，每次都在 heap 上分配記憶體。

### SHAKE256 的優勢

SHA3 家族的海綿結構（sponge）允許**擠出任意長度的 hash**——不需要先算完整 hash 再截斷。計算成本與索引大小同時降低。

### Birthday Paradox 碰撞估算

- 8 字元：281 兆種可能
- 10 字元：72 京（quintillion）種可能——碰撞機率趨近於零

最終選擇 10 字元。

## 相關頁面

- [[AI 輔助軟體工程]]（作者使用 Claude 協助研究方案）
