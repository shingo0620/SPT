---
title: Skill、Bash、MCP 介紹
type: source
sources: [Skill、Bash、MCP.md]
created: 2026-04-13
updated: 2026-04-13
tags: [LLM, Skill, Bash, MCP, 工具選擇]
---

# Skill、Bash、MCP 介紹

## 摘要

從 LLM 本質出發，解釋 Skill、Bash、MCP 三種工具的定位、適用時機與常見誤區。核心論點：理解 LLM 是機率模型而非智能體，才能正確選擇工具。

## LLM 本質

LLM 根據訓練資料預測下一個字的機率，準確率取決於：
1. 訓練時看過哪些資料
2. 推論時輸入的資料是什麼

> 使用 LLM 不是「和某個 AI 人工智能體對話」，而是「操控一台吃角子老虎機」。

## 三種工具的角色

- **Skill**：引導 LLM 機率分布，提高生成預期結果的機率。但仰賴 LLM 本身能力，超出訓練範圍就無效。
- **Bash**：讓 LLM 操控 CLI 工具，效率高。但 LLM 生成的指令也是機率性的，風險高。
- **MCP**：固定接口、格式受限、可事先擋錯。安全性高但需更複雜的包裝。

## 常見誤區

- 認為 Skill 萬能，什麼事寫 Skill 就能解決
- 花數週寫 MCP，殊不知一天寫個 Skill 就能快速解決
- 認為 Bash 萬能，開太多權限給 Agent，結果 `rm -rf .` 毀掉檔案系統

## 相關頁面

- [[Skill vs Bash vs MCP]]
- [[src-向三位大師學AI筆記]] — 三大知識管理系統中 QMD 即採用 MCP 整合
- [[src-LLM Wiki]] — LLM Wiki 的 Schema 即是 Skill 的實踐
