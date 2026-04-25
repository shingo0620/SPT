---
title: antfu
type: entity
sources: []
created: 2026-04-25
updated: 2026-04-25
tags: [antfu, anthony-fu, vue, vite, unocss, oss-developer]
---

# antfu（Anthony Fu）

> 本頁統整本 wiki 提及 antfu 的脈絡；來源為空表示為跨來源歸納。

## 一句話定位

Vue.js 與 Vite 核心團隊成員，**以「single-purpose、type-safe、極簡微工具」風格在 npm 生態系大量產出 OSS utilities** 的代表開發者——「antfu 風格」已成為一種開源工具設計哲學。

## 主要 OSS 作品

| 作品 | 定位 | 領域 |
|------|------|------|
| **Vue.js core** | 共同維護者 | Frontend framework |
| **Vite core** | 共同維護者 | Build tool |
| **UnoCSS** | 即時原子化 CSS 引擎 | CSS framework |
| **Iconify / @iconify/json** | 統一 icon 介面 | Icon system |
| **Vitest** | 共同維護者 | Testing |
| 大量 utility npm packages | single-responsibility | DevTools |

## wiki 涉及

- **[[src-github-trending-2026-04]] 04-23 #11 `whenexpr`**——「微型 when-clause 表達式求值器，具完整型別安全」
  - 19 stars 即上 GitHub Trending，反映 antfu 個人品牌的話題拉力
  - 完美體現「antfu 風格」：single-purpose（只做一件事）+ 完整型別安全 + 微型實作

## 「antfu 風格」設計哲學

從本月 `whenexpr` 與其他作品歸納：
1. **Single-Purpose**——每個 package 只做一件事，不混合多功能
2. **Type-Safe by Default**——TypeScript 第一，runtime + compile-time 雙重保證
3. **Minimal Surface Area**——API 越小越好，文件足以閱讀完
4. **Composable**——小型工具組合成大應用，而非 monolithic framework

→ 與 [[src-Solo SaaS架構]]「微型 + 自建 + 高槓桿」精神接近、但著重於「OSS 工具庫」而非「SaaS 產品」

## 相關頁面

- [[src-github-trending-2026-04]]（whenexpr 出現位置）
- [[src-Solo SaaS架構]]（精神接近的個人開發者哲學）
- [[levelsio]]（另一風格——SaaS 產品 vs OSS 工具）
