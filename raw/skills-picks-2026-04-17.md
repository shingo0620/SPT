---
title: "skills.sh Pick of the Day — 2026-04-17"
source: "https://skills.sh/picks"
author:
  - "skills.sh"
published: 2026-04-17
created: 2026-04-17
tags:
  - "skills-sh"
  - "agent-skills"
  - "daily-digest"
---

# skills.sh Pick — 2026-04-17

## 今日精選

- **Skill**：3b1b-style-animation-skill
- **來源**：subinium/3b1b-style-animation-skill
- **GitHub**：https://github.com/subinium/3b1b-style-animation-skill
- **頁面**：https://skills.sh/subinium/3b1b-style-animation-skill/3b1b-style-animation-skill
- **安裝數**：1
- **安裝指令**：`npx skills add https://github.com/subinium/3b1b-style-animation-skill --skill 3b1b-style-animation-skill`
- **簡介**：Create 3Blue1Brown-style math animations using Manim. If you have ever wanted to explain a concept with those beautiful animated proofs, this is how you do it with an AI agent.

## Skill 定義（YAML frontmatter + 完整內容）

```yaml
---
name: 3b1b-style-animation-skill
description: Create pedagogically-focused mathematical animations in 3Blue1Brown style using Manim
metadata:
  author: subinium
  version: 1.0.0
  tags: manim, 3b1b, math, education, pedagogy, visualization
---

# 3Blue1Brown Style Mathematical Animations

Use this skill when creating mathematical animations, visualizations, or educational videos about math, algorithms, or deep learning.

## Core Philosophy

\u003e "The goal is not to animate math, but to build understanding."

1. **Intuition Before Formalism** — Build visual understanding before showing formulas
2. **Why Before What** — Motivate concepts before defining them
3. **Concrete Before Abstract** — Start with specific examples, then generalize
4. **Show, Don't Tell** — Let the visual do the explaining

## When to Use

- Creating mathematical animations with Manim
- Explaining algorithms visually
- Building deep learning visualizations
- Producing educational video content

---

## AI-Guided Planning (REQUIRED)

**Before starting any video, follow this workflow:**

### Step 1: Draft Plan Internally

When user requests an animation:
- Understand the topic
- Draft content structure
- Identify visual elements needed

### Step 2: Ask User Preferences

**Use AskUserQuestion tool to gather preferences:**

```python
questions = [
    {
        "question": "Do you want narration audio in this video?",
        "header": "Audio",
        "options": [
            {"label": "With Audio (Recommended)", "description": "TTS narration synced to animation"},
            {"label": "Without Audio", "description": "Animation only, add your own audio later"}
        ],
        "multiSelect": False
    },
    {
        "question": "How long should the video be?",
        "header": "Duration",
        "options": [
            {"label": "Short (30-60s)", "description": "Quick concept overview"},
            {"label": "Medium (1-2 min)", "description": "Standard explanation"},
            {"label": "Long (3+ min)", "description": "Deep dive with examples"},
            {"label": "Auto (Recommended)", "description": "Let content determine length"}
        ],
        "multiSelect": False
    }
]
```

### Step 3: Present Plan for Approval

Show the content plan before coding:

```
📋 Animation Plan: [Topic]

1. Hook: [Opening question]
2. Setup: [Context]
3. Core: [Main explanation]
4. Example: [Demonstration]
5. Takeaway: [Conclusion]

Settings: Audio=Yes, Duration=Auto (~70s)

Shall I proceed?
```

### Step 4: Execute Based on Choices

| Choice | Workflow |
|--------|----------|
| With Audio | Script → TTS → Measure Duration → Code Animation → Render → Combine |
| Without Audio | Estimate Timing → Code Animation → Render |

---

## Key Principles

### Duration is NOT Fixed

```python
# ❌ WRONG: Force fixed duration
duration = 60  # arbitrary

# ✅ RIGHT: Content determines duration
script = write_explanation(topic)
duration = measure(script)  # natural length
```

### Always Ask, Never Assume

- Audio preference
- Duration preference
- Detail level (if relevant)

---

## Rules Index

### Highest Priority: Quality \u0026 Planning

| Rule | Description |
|------|-------------|
| `rules/visual-quality.md` | **CRITICAL** - No overlaps, readable text, clear hierarchy |
| `rules/pre-production.md` | AI-guided planning with user interaction |
| `rules/layout-spacing.md` | Screen zones, spacing, margins |

### High Priority: Pedagogy \u0026 Content

| Rule | Description |
|------|-------------|
| `rules/pedagogy.md` | Teaching philosophy and explanation structures |
| `rules/mathematical-rigor.md` | Ensuring mathematical correctness |
| `rules/narrative-flow.md` | Smooth transitions and completeness |
| `rules/audio-sync.md` | Synchronizing narration with visuals |

### Visual Design

| Rule | Description |
|------|-------------|
| `rules/color-scheme.md` | 3b1b color palette and semantic meaning |
| `rules/scene-basics.md` | Animation timing and sequencing |
| `rules/camera-work.md` | Focus, zoom, and visual hierarchy |

### Domain: Linear Algebra

| Rule | Description |
|------|-------------|
| `rules/linear-transformations.md` | Geometric interpretation of transforms |
| `rules/matrix-operations.md` | Matrix multiplication visualization |
| `rules/eigenvalues.md` | Eigenvector and eigenvalue intuition |
| `rules/vector-space.md` | Vector operations and spaces |

### Domain: Statistics \u0026 Probability

| Rule | Description |
|------|-------------|
| `rules/distributions.md` | PDF/CDF visualization |
| `rules/bayes-theorem.md` | Bayesian reasoning |
| `rules/sampling.md` | Monte Carlo methods |

### Domain: Deep Learning

| Rule | Description |
|------|-------------|
| `rules/neuron.md` | Single neuron visualization |
| `rules/layer.md` | Layer representations |
| `rules/network-architecture.md` | Full network diagrams |
| `rules/forward-pass.md` | Data flow visualization |
| `rules/gradient-flow.md` | Backpropagation visualization |
| `rules/attention.md` | Attention mechanism |
| `rules/transformer-block.md` | Transformer architecture |

### Domain: CNN

| Rule | Description |
|------|-------------|
| `rules/convolution.md` | Convolution operation |
| `rules/feature-maps.md` | Feature map visualization |
| `rules/pooling.md` | Pooling operations |

### Technical

| Rule | Description |
|------|-------------|
| `rules/manim-setup.md` | Installation and configuration |
| `rules/narration.md` | TTS integration and script writing |

---

## Example Interaction

```
User: "quick sort 애니메이션 만들어줘"

AI: [Internal: Draft plan for QuickSort]

AI: [AskUserQuestion]
    "I'll create a QuickSort animation. Quick questions:

    1. Audio: With narration / Without
    2. Duration: Short / Medium / Auto"

User: "audio 있고, auto로"

AI: "Here's my plan:

    📋 QuickSort Animation

    1. Hook: How do we sort efficiently?
    2. Setup: Unsorted array
    3. Core: Pivot selection, partitioning
    4. Example: Sort [8,3,7,1,5,2]
    5. Takeaway: O(n log n) average

    Duration: ~90s (based on narration)

    Proceed?"

User: "네"

AI: [Executes workflow]
    → Generates TTS
    → Measures timing
    → Creates animation
    → Renders \u0026 combines
    → Shows result
```

---

## Quick Start Code

```python
from manim import *

class ExplanationScene(Scene):
    def construct(self):
        self.camera.background_color = "#1c1c1c"

        # Sync to audio timing (if audio enabled)
        # TIMING = {...}  # from TTS generation

        # 1. Hook: Pose the question
        # 2. Intuition: Build visual understanding
        # 3. Formalize: Show the math
        # 4. Verify: Demonstrate with example
```
```

## Skill README

# ast-grep Code Search

## Overview

This skill helps translate natural language queries into ast-grep rules for structural code search. ast-grep uses Abstract Syntax Tree (AST) patterns to match code based on its structure rather than just text, enabling powerful and precise code search across large codebases.

## When to Use This Skill

Use this skill when users:
- Need to search for code patterns using structural matching (e.g., "find all async functions that don't have error handling")
- Want to locate specific language constructs (e.g., "find all function calls with specific parameters")
- Request searches that require understanding code structure rather than just text
- Ask to search for code with particular AST characteristics
- Need to perform complex code queries that traditional text search cannot handle

## General Workflow

Follow this process to help users write effective ast-grep rules:

### Step 1: Understand the Query

Clearly understand what the user wants to find. Ask clarifying questions if needed:
- What specific code pattern or structure are they looking for?
- Which programming language?
- Are there specific edge cases or variations to consider?
- What should be included or excluded from matches?

### Step 2: Create Example Code

Write a simple code snippet that represents what the user wants to match. Save this to a temporary file for testing.

**Example:**
If searching for "async functions that use await", create a test file:

```javascript
// test_example.js
async function example() {
  const result = await fetchData();
  return result;
}
```

### Step 3: Write the ast-grep Rule

Translate the pattern into an ast-grep rule. Start simple and add complexity as needed.

**Key principles:**
- Always use `stopBy: end` for relational rules (`inside`, `has`) to ensure search goes to the end of the direction
- Use `pattern` for simple structures
- Use `kind` with `has`/`inside` for complex structures
- Break complex queries into smaller sub-rules using `all`, `any`, or `not`

**Example rule file (test_rule.yml):**
```yaml
id: async-with-await
language: javascript
rule:
  kind: function_declaration
  has:
    pattern: await $EXPR
    stopBy: end
```

See `references/rule_reference.md` for comprehensive rule documentation.

### Step 4: Test the Rule

Use ast-grep CLI to verify the rule matches the example code. There are two main approaches:

**Option A: Test with inline rules (for quick iterations)**
```bash
echo "async function test() { await fetch(); }" | ast-grep scan --inline-rules "id: test
language: javascript
rule:
  kind: function_declaration
  has:
    pattern: await \$EXPR
    stopBy: end" --stdin
```

**Option B: Test with rule files (recommended for complex rules)**
```bash
ast-grep scan --rule test_rule.yml test_example.js
```

**Debugging if no matches:**
1. Simplify the rule (remove sub-rules)
2. Add `stopBy: end` to relational rules if not present
3. Use `--debug-query` to understand the AST structure (see below)
4. Check if `kind` values are correct for the language

### Step 5: Search the Codebase

Once the rule matches the example code correctly, search the actual codebase:

**For simple pattern searches:**
```bash
ast-grep run --pattern 'console.log($ARG)' --lang javascript /path/to/project
```

**For complex rule-based searches:**
```bash
ast-grep scan --rule my_rule.yml /path/to/project
```

**For inline rules (without creating files):**
```bash
ast-grep scan --inline-rules "id: my-rule
language: javascript
rule:
  pattern: \$PATTERN" /path/to/project
```

## ast-grep CLI Commands

### Inspect Code Structure (--debug-query)

Dump the AST structure to understand how code is parsed:

```bash
ast-grep run --pattern 'async function example() { await fetch(); }' \
  --lang javascript \
  --debug-query=cst
```

**Available formats:**
- `cst`: Concrete Syntax Tree (shows all nodes including punctuation)
- `ast`: Abstract Syntax Tree (shows only named nodes)
- `pattern`: Shows how ast-grep interprets your pattern

**Use this to:**
- Find the correct `kind` values for nodes
- Understand the structure of code you want to match
- Debug why patterns aren't matching

**Example:**
```bash
# See the structure of your target code
ast-grep run --pattern 'class User { constructor() {} }' \
  --lang javascript \
  --debug-query=cst

# See how ast-grep interprets your pattern
ast-grep run --pattern 'class $NAME { $$$BODY }' \
  --lang javascript \
  --debug-query=pattern
```

### Test Rules (scan with --stdin)

Test a rule against code snippet without creating files:

```bash
echo "const x = await fetch();" | ast-grep scan --inline-rules "id: test
language: javascript
rule:
  pattern: await \$EXPR" --stdin
```

**Add --json for structured output:**
```bash
echo "const x = await fetch();" | ast-grep scan --inline-rules "..." --stdin --json
```

### Search with Patterns (run)

Simple pattern-based search for single AST node matches:

```bash
# Basic pattern search
ast-grep run --pattern 'console.log($ARG)' --lang javascript .

# Search specific files
ast-grep run --pattern 'class $NAME' --lang python /path/to/project

# JSON output for programmatic use
ast-grep run --pattern 'function $NAME($$$)' --lang javascript --json .
```

**When to use:**
- Simple, single-node matches
- Quick searches without complex logic
- When you don't need relational rules (inside/has)

### Search with Rules (scan)

YAML rule-based search for complex structural queries:

```bash
# With rule file
ast-grep scan --rule my_rule.yml /path/to/project

# With inline rules
ast-grep scan --inline-rules "id: find-async
language: javascript
rule:
  kind: function_declaration
  has:
    pattern: await \$EXPR
    stopBy: end" /path/to/project

# JSON output
ast-grep scan --rule my_rule.yml --json /path/to/project
```

**When to use:**
- Complex structural searches
- Relational rules (inside, has, precedes, follows)
- Composite logic (all, any, not)
- When you need the power of full YAML rules

**Tip:** For relational rules (inside/has), always add `stopBy: end` to ensure complete traversal.

## Tips for Writing Effective Rules

### Always Use stopBy: end

For relational rules, always use `stopBy: end` unless there's a specific reason not to:

```yaml
has:
  pattern: await $EXPR
  stopBy: end
```

This ensures the search traverses the entire subtree rather than stopping at the first non-matching node.

### Start Simple, Then Add Complexity

Begin with the simplest rule that could work:
1. Try a `pattern` first
2. If that doesn't work, try `kind` to match the node type
3. Add relational rules (`has`, `inside`) as needed
4. Combine with composite rules (`all`, `any`, `not`) for complex logic

### Use the Right Rule Type

- **Pattern**: For simple, direct code matching (e.g., `console.log($ARG)`)
- **Kind + Relational**: For complex structures (e.g., "function containing await")
- **Composite**: For logical combinations (e.g., "function with await but not in try-catch")

### Debug with AST Inspection

When rules don't match:
1. Use `--debug-query=cst` to see the actual AST structure
2. Check if metavariables are being detected correctly
3. Verify the node `kind` matches what you expect
4. Ensure relational rules are searching in the right direction

### Escaping in Inline Rules

When using `--inline-rules`, escape metavariables in shell commands:
- Use `\$VAR` instead of `$VAR` (shell interprets `$` as variable)
- Or use single quotes: `'$VAR'` works in most shells

**Example:**
```bash
# Correct: escaped $
ast-grep scan --inline-rules "rule: {pattern: 'console.log(\$ARG)'}" .

# Or use single quotes
ast-grep scan --inline-rules 'rule: {pattern: "console.log($ARG)"}' .
```

## Common Use Cases

### Find Functions with Specific Content

Find async functions that use await:
```bash
ast-grep scan --inline-rules "id: async-await
language: javascript
rule:
  all:
    - kind: function_declaration
    - has:
        pattern: await \$EXPR
        stopBy: end" /path/to/project
```

### Find Code Inside Specific Contexts

Find console.log inside class methods:
```bash
ast-grep scan --inline-rules "id: console-in-class
language: javascript
rule:
  pattern: console.log(\$\$\$)
  inside:
    kind: method_definition
    stopBy: end" /path/to/project
```

### Find Code Missing Expected Patterns

Find async functions without try-catch:
```bash
ast-grep scan --inline-rules "id: async-no-trycatch
language: javascript
rule:
  all:
    - kind: function_declaration
    - has:
        pattern: await \$EXPR
        stopBy: end
    - not:
        has:
          pattern: try { \$\$\$ } catch (\$E) { \$\$\$ }
          stopBy: end" /path/to/project
```

## Resources

### references/
Contains detailed documentation for ast-grep rule syntax:
- `rule_reference.md`: Comprehensive ast-grep rule documentation covering atomic rules, relational rules, composite rules, and metavariables

Load these references when detailed rule syntax information is needed.

## 近期其他精選

| 日期 | Skill | 來源 | 安裝數 | 簡介 |
|------|-------|------|--------|------|
| 2026-04-18 | [ast-grep](https://skills.sh/ast-grep/agent-skill/ast-grep) | ast-grep/agent-skill | 2,906 | AST-based code search and transform. Like grep but it unders… |
| 2026-04-16 | [character-arc](https://skills.sh/jwynia/agent-skills/character-arc) | jwynia/agent-skills | 258 | A craft-focused creative writing skill for building characte… |
| 2026-04-15 | [alphafold](https://skills.sh/adaptyvbio/protein-design-skills/alphafold) | adaptyvbio/protein-design-skills | 24 | Protein structure prediction with AlphaFold. Computational b… |
| 2026-04-14 | [audit-prep-assistant](https://skills.sh/trailofbits/skills/audit-prep-assistant) | trailofbits/skills | 1,765 | Trail of Bits is one of the most respected security firms in… |
| 2026-04-13 | [coding-agent](https://skills.sh/steipete/clawdis/coding-agent) | steipete/clawdis | 1,196 | Peter Steinberger (PSPDFKit founder, iOS legend) built a com… |
