---
title: Manim
type: entity
entity_type: tool
sources: [src-skill-3b1b-style-animation-skill.md]
created: 2026-04-22
updated: 2026-04-22
tags: [python, animation, math, education, visualization, open-source]
---

# Manim

## 一句話定位

[[3Blue1Brown]] 的 Grant Sanderson 為自製數學教學影片而開發的 **Python 動畫引擎**，後衍生社群維護版 `manim-community`，成為 ML／教育類動畫內容生產的事實標準。

## 核心特徵

- **程式化動畫**：用 Python code 描述物件、變換、時序——可精確控制每幀
- **數學物件原生支援**：TeX 公式、向量、函數曲線、幾何圖形皆為 first-class primitive
- **「視覺先於公式」的教學哲學載體**：Manim 不只是工具，更是 3Blue1Brown 教學風格的技術基礎——**先讓觀眾看見，再用公式確認**

## 兩個分支

| 分支 | 用途 | 維護者 |
|------|------|--------|
| **ManimGL**（原版） | Grant Sanderson 本人持續使用於 3Blue1Brown 頻道 | Grant Sanderson |
| **manim-community** | 社群分叉，文件完整、入門友善——ML/教育類內容的主流 | 社群 |

## 在本 wiki 的位置

- **教學哲學載體**：[[3Blue1Brown]] 的核心創作工具
- **Agent Skill 封裝**：[[src-skill-3b1b-style-animation-skill]] 把 Manim 技術與 3b1b 教學哲學整合成可重用的 agent 工作流——安裝該 skill 後，agent 能以 3b1b 風格產出 Manim 動畫
- **製作痛點**：非程式出身的教育創作者需先克服 Python 學習曲線；skill 的一大價值正是**把這個門檻降到「說自然語言需求」**

## 相關頁面

- [[3Blue1Brown]]（創造 Manim 的 YouTube 頻道）
- [[src-skill-3b1b-style-animation-skill]]（把 Manim 使用知識壓縮進 prompt 的 agent skill）
- [[Skill vs Bash vs MCP]]（Manim 本體是 CLI/套件，skill 把它「高階化」的典型範例）
