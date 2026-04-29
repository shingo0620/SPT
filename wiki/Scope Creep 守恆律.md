---
title: Scope Creep 守恆律
type: concept
sources: ["On sabotaging projects by overthinking, scope creep, and structural diffing.md"]
created: 2026-04-27
updated: 2026-04-27
tags: [ai-assisted-development, scope-creep, project-management, anti-pattern]
---

# Scope Creep 守恆律

Scope Creep 守恆律是從 [[src-overthinking-scope-creep-structural-diffing]] 抽出的概念：AI 工具降低實作成本後，省下的時間不一定變成更快交付，常被更多想法、更多抽象化、更多 structural diff 與更多「順手改善」吃掉。

## 核心觀察

- AI 加速的是「寫出更多 code」而不一定是「更快完成正確範圍」。
- 當實作成本下降，需求範圍會自然膨脹。
- 真正的瓶頸從 typing / coding 轉移到判斷、取捨、驗收與停止。

## 與本 wiki 的關聯

- [[AI 品質共謀]]：AI 同時寫 code 與測試時，錯誤理解會被自動化流程放大。
- [[Specification by Example]]：用具體例子約束 scope，是對抗 scope creep 的方法之一。
- [[AI 輔助軟體工程]]：需要把 AI 的產能放進規劃、測試、review 與驗收制度中。
- [[src-Solo SaaS架構|Solo SaaS架構]]：小系統與低維運負擔是另一種範圍控制策略。
