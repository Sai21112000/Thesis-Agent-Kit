---
name: literature-review
description: Activate when writing or reviewing Chapter 2 — enforces PRISMA-inspired systematic selection documentation, thematic synthesis over chronological summaries, gap articulation formula, comparison table structure, and Q1 citation density standards.
version: 2.0.0
allowed-tools: Read,Write,Glob
---

# Literature Review Skill

Governs Chapter 2. Enforces thematic synthesis, PRISMA selection documentation, gap-to-methodology bridging, and Q1 citation density.

---

## Overview

**Invoke when**: drafting or reviewing Chapter 2 or any literature survey.
**Prerequisites**: >=20 verified papers; PROJECT-CONFIG.md filled (Sections 1-10).

---

## Section 1 — PRISMA-Inspired Selection

Document in Chapter 2 or Appendix:

Database Search -> Scopus/WoS/Scholar query
  -> Initial results: [N]

Screening (Title+Abstract)
  -> Included: [n1] relevant | Excluded: [n2] off-topic

Eligibility (Full text)
  -> Included: [n3] | Excluded: [n4] with reasons

Final corpus: [n3] papers

Inclusion criteria:
  Q1/Q2 indexed or top-tier venue for declared domain
  Published <=5 years (except seminal)
  Directly addresses >=1 research topic area from PROJECT-CONFIG.md
  Full text available

---

## Section 2 — Thematic Structure

3-theme structure (NOT chronological):

2.1 Broad domain — significance + context
    -> Ends: "Despite advances, [limitation X] remains..."

2.2 Core methods — comparison table for 3+ methods
    -> Ends: "Existing methods fail to address [gap Y]..."

2.3 Target context — your specific application
    -> Most specific; ends with master gap statement

2.4 Gap Summary (0.5-1 page)
    -> Aggregates all gaps; states RQs as response; bridges to Ch.3

---

## Section 3 — Synthesis (Not Summary)

FORBIDDEN:
"Wang (2023) used YOLOv8 and got 87%. Chen (2022) got 83%."

REQUIRED:
"Recent studies demonstrate consistent progress in one-stage detection
(Chen et al., 2022; Wang et al., 2023), with mAP@50 ranging 83-89%.
However, all operate at fixed resolution, failing to address GSD
variation — a critical limitation for operational UAV surveys."

Rule: Citation groups must produce a field-level collective claim, not individual summaries.

---

## Section 4 — Gap Formula

"While [A], [B], and [C] demonstrate [X], [limitation Z] remains
unaddressed [in context Y], creating a critical gap in [consequence]."

Every sub-section must end with a gap statement using this formula.

---

## Section 5 — Comparison Table Template

Table 2.X — Summary of Related Works on [Topic]

| Author (Year) | Method | Dataset | [Domain Metric] | Limitation |
|--------------|--------|---------|-----------------|-----------|
| [Author 1]   | [method] | [data] | [value]        | [gap]     |
| This study   | [proposed] | [data] | -             | -         |

Last row: always "This study" showing gap filled.

---

## Section 6 — Citation Density

Per paragraph: 2-6 citations
Per sub-section: >=6 unique sources
Total chapter: >=20 unique verified sources
Recency: >=60% within 5 years

---

## Section 7 — Mandatory Transition (End of Ch.2)

"[Consolidated gap]. [Proposed solution].
Chapter 3 presents the research methodology designed to address these gaps."

---

## Error Handling

Fewer than 20 papers:
-> "Expand database search before drafting."

Chronological summaries detected:
-> Flag: "[SUMMARY NOT SYNTHESIS — restructure around collective field claim]"

Gap statement absent:
-> Flag: "[GAP STATEMENT MISSING — add gap articulation to end of sub-section]"
