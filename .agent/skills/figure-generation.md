---
name: figure-generation
description: >
  Assists with diagrams and figures for thesis chapters. Enforces code-first for
  quantitative and results content with RESULTS/ traceability; restricted AI or
  external-tool imagery for explicit non-data requests only; strict refusal of
  fabricated metrics or unsourced plots. Domain-aware via PROJECT-CONFIG and
  .agent/domains/. Integrates with latex-formatting (placement, captions,
  inclusion) and research-reviewer (six-pillar QA pass-through).
version: 1.0.0
last_reviewed: 2026-04-13
integrates_with:
  - latex-formatting.md
  - CORE-QA.md
  - CORE-LAWS.md
  - research-reviewer.md
  - PROJECT-CONFIG.md
allowed-tools: Read,Write,Glob,Bash
---

# Figure Generation

## When to Use This Skill

Invoke **figure-generation** when prose or structure **needs a diagram, schematic, visualization, or illustration** to support a research claim. Examples:

- **Method pipeline or architecture** (flowchart, layer diagram, network schematic)
- **Results comparison** (side-by-side layout of approaches; multi-panel figure) **from real outputs**
- **Non-numeric concept art** (simplified schematic; visual metaphor) **with caption stating no empirical data**
- **Data-driven plot** (histogram, curve, scatter) **sourced from files under `RESULTS/`** (or paths declared in `PROJECT-CONFIG.md`)

Do **not** use this skill to:

- Generate **fabricated numbers or fake data plots** (e.g. bar charts with invented benchmark scores)
- Create **results figures that bypass `[READ FROM RESULTS/]`** or actual experiment logs
- Replace **measured empirical plots** with AI-generated imagery
- Skip **caption and attribution discipline** (every figure needs a purpose; quantitative content traces to data or code)

---

## Workflow

```
Chapter draft (research-writer.md)
    |
    v
Identify claims requiring visual support
    |
    v
Decision: code-first or imagery?
    +-- [Quantitative / reproducible geometry / LaTeX-tight]
    |       -> Code-first: TikZ, Matplotlib, ggplot, R
    |       -> Templates, naming, traceability to RESULTS/
    |
    +-- [Decorative / concept / complex freeform / fast iteration]
            -> AI raster (explicit user request) or draw.io / Inkscape / etc.
            -> Prompt refinement, layout advice, export to PDF/SVG
    |
    v
Generate code or asset
    |
    v
Export PDF or SVG (preferred for LaTeX)
    |
    v
Write caption (data source, purpose, key insight)
    |
    v
Integrate via latex-formatting.md (figure env, placement, `\includegraphics`)
    |
    v
research-reviewer.md + CORE-QA.md -> QA pass
    |
    v
research-writer.md -> revise chapter prose as needed
```

---

## Code-First or Imagery: Decision Tree

| Scenario | Choose | Why |
|----------|--------|-----|
| Results plot from empirical data | **Code** (Matplotlib, ggplot, TikZ/pgfplots) | Reproducibility; audit trail; versioning with `RESULTS/` |
| System architecture; math-heavy diagram | **Code** (TikZ) | Precision; LaTeX integration |
| Protocol flow (timing/order) | **Code** or **external** | TikZ if dense; draw.io if speed wins |
| Concept schematic (no numeric claims) | **Imagery** (explicit ask) or **external** | Speed; must label illustrative in caption |
| Decorative icon / cover vignette | **Imagery** or **external** | No rigor claim on numbers |
| Multi-panel (diagram + measured plot) | **Code** (subplots + TikZ frame) | Single reproducible pipeline |

**Rule of thumb:** If accuracy or updates depend on **data or logic**, use **code**. If **illustrative and stable**, imagery or external tools is acceptable when the user explicitly wants that path.

---

## Figure Archetypes and Prompt Templates

### Archetype 1: Method pipeline (code-first)

**Use case:** Inputs to preprocessing to model to evaluation to outputs.

**Prompt:**

```
Method pipeline for [domain] thesis, Chapter [N].
Context: [one sentence].
Stages: [ordered list].
Output: TikZ (or similar) suitable for LaTeX; domain terms from .agent/domains/[domain]/.
```

**Expected:** Numbered boxes, labeled arrows, consistent palette; no invented metrics.

---

### Archetype 2: Results comparison panel (code-first)

**Prompt:**

```
Two-panel comparison. Data: RESULTS/[file1] and RESULTS/[file2].
Axes: [names and units]. Error bars if applicable.
Export PDF; caption must cite exact file paths.
```

**Expected:** Panels load from files; legend; units; caption draft with paths.

---

### Archetype 3: Non-data schematic (imagery or external)

**Prompt:**

```
Concept diagram only (no numeric performance claims).
Topic: [e.g. centralized vs federated learning].
Style: clean academic lines; export PDF or SVG for LaTeX `\includegraphics`.
Caption must state illustrative / non-empirical if no real data shown.
```

**Expected:** Editable asset; caption guards against misreading as measured results.

---

### Archetype 4: Mixed architecture + data (hybrid)

**Prompt:**

```
Multi-panel: [left] TikZ or schematic of architecture; [right] heatmap or curve from RESULTS/[file].
Layout fraction: [e.g. 60/40]. Single LaTeX figure; one caption covering both.
```

**Expected:** Code or split pipeline; data side traceable to `RESULTS/`.

---

## Integration Points

### With `.agent/skills/latex-formatting.md`

- Figure environment, `\includegraphics`, width/aspect, `\caption`, `\label{fig:...}`.
- Placement (`[t]`, `[b]`, `[htbp]`, etc.) per venue habit; see template in that skill.
- Multi-part figures (`subcaption`, subfigures) when needed.

### With `PROJECT-CONFIG.md`

- Section 2: read `domain:` and load **all** `.md` files under `.agent/domains/[domain]/` for terminology and norms (there is no required `figure-conventions.md`; teams may add optional per-domain notes later).
- Section 1: **Target Venue**, **Citation Style** inform caption tone and attribution (APA/IEEE/etc.).
- Never invent metrics; align with Sections 11–15 and **Primary Results** tables for Ch.4 figures.

### With `.agent/CORE-LAWS.md` and `.agent/CORE-QA.md`

- **No invented metrics** — numeric figure content matches `RESULTS/` or code output.
- **Six pillars** — results figures support **Reproducibility** and **Result validity**; method figures support **Methodology** and honest **Novelty** claims.

### With `.agent/skills/research-reviewer.md`

Use reviewer for full chapter pass; use the **light checklist** below before submission.

---

## Light QA Checklist (before finalizing)

### Hard rules (do not ship if violated)

- **No fabricated numbers** in plots or axes.
- **Results plots** trace to `RESULTS/` (or equivalent declared path); caption cites source.
- **No AI raster** as a stand-in for a measured empirical plot.

### Judgment checks (question form)

- Does the **caption** state what, why, and (if applicable) where the data live?
- Are **axes, units, and error bars** fully labeled?
- If color encodes information, is there a **secondary cue** (pattern, direct label) for accessibility?
- Could you **regenerate** this figure in six months from saved code and data paths?
- Is the figure **called out in prose** before or where the reader expects it?

Full grading: `.agent/CORE-QA.md` and `.agent/skills/research-reviewer.md`.

---

## Domain-aware behavior

1. Read `domain:` from `PROJECT-CONFIG.md`.
2. Load **all** `.md` in `.agent/domains/[domain]/` (same rule as `research-writer.md`).
3. Tailor examples and vocabulary to that domain (e.g. CV: grids, mAP context in captions; biomedical: flow diagrams, CONSORT-style cohort logic where relevant).

Illustrative examples (not exhaustive):

- **computer-vision:** architecture blocks, qualitative grids, before/after panels; cite split and dataset from config.
- **biomedical:** cohort flow, survival-style curves **from real stats output**, instrument schematics; follow journal figure ethics.

---

## When to defer

- **RQ or novelty scope** → `.agent/skills/research-advisor.md`
- **Draft-level rigor and six pillars** → `.agent/skills/research-reviewer.md`
- **LaTeX breakage, margins, thesis class** → `.agent/skills/latex-formatting.md`

---

## Restrictions and limitations

- **Static** figures for the main thesis (PDF/SVG/PNG/TikZ). Animations or interactive-only content belong in supplements unless the program allows otherwise.
- **3D or heavy viz** may need specialized tools (ParaView, Blender, etc.); this skill does not replace domain tooling.
- **AI-generated decorative images:** only with user request and captions that avoid implying measured performance.

---

## Sample prompts (copy-paste)

**TikZ architecture**

```
TikZ: [N] stages — [list]. Arrows labeled [labels]. No performance numbers.
Integrate as one figure; caption for Methods.
```

**Matplotlib from CSV**

```
Read RESULTS/[file].csv; columns [list]. Line or bar plot; units on axes; legend; save PDF to figures/.
Caption cites RESULTS/[file].csv.
```

**Concept only**

```
Non-data schematic: [topic]. PDF or SVG. Caption: illustrative only; not empirical results.
```

---

## Quick reference

| Situation | Action |
|-----------|--------|
| Explain method visually | Archetype 1; code-first. |
| Plot real results | Archetype 2; load data from `RESULTS/`. |
| Motivation schematic | Archetype 3; label illustrative. |
| Figure looks wrong in PDF | `latex-formatting.md` for sizing and floats. |
| Venue-level figure quality | `research-reviewer.md` + CORE-QA. |

---

## Maintenance

- **Version:** semantic in frontmatter; bump on breaking rule changes.
- **last_reviewed:** update when content is validated against pack core files.
- **Feedback:** via repository issues or maintainer path described in root `README.md`.
