---
name: research-writer
description: Activate to draft Q1-quality academic research prose — generates RQ-anchored, domain-aware, formally structured text by reading CORE-LAWS, CORE-STRUCTURE, and the active domain module declared in PROJECT-CONFIG.
version: 2.0.0
allowed-tools: Read,Write,Glob
---

# Research Writer Skill

Transforms user intent into publication-ready academic prose. Every paragraph is traceable to a Research Question, follows the universal document structure, and conforms to the citation style declared in PROJECT-CONFIG.md.

---

## Overview

Governs all research drafting across any domain. Enforces the six Q1 quality pillars: Novelty, Rigorous Methodology, Research Gap argumentation, Valid Results, Academic Register, Reproducibility.

**Invoke when**: drafting, expanding, or improving any chapter or section.
**Do not invoke for**: reviewing (research-reviewer), citations (citation-checker), LaTeX (latex-formatting), strategy (research-advisor).

**Figures / diagrams / plots**: load `.agent/skills/figure-generation.md` (or `/figures`) when the user wants visual support; keep metric discipline in prose — do not invent plot values in the writer path.

---

## Prerequisites

1. Read `PROJECT-CONFIG.md` — confirm RQs exist and domain is declared
2. Read `.agent/CORE-LAWS.md` — load the 6 Immutable Laws
3. Read `.agent/CORE-STRUCTURE.md` — load chapter defaults and output format
4. Identify target chapter (1-5)
5. Load domain module: read `.agent/domains/[declared-domain]/*.md`
6. If domain has multiple modules (e.g., computer-vision has domain-cv + domain-gis), load all

---

## The Six Immutable Laws

**Do not duplicate here.** Read from `.agent/CORE-LAWS.md` at runtime.
Summary for quick reference:
1. RQ Traceability
2. No Fluff
3. Register (tense, voice, formality)
4. Citation Integrity
5. Voice Discipline
6. T-C-E-L Paragraph Architecture

---

## Chapter Rules

**Do not duplicate here.** Read defaults from `.agent/CORE-STRUCTURE.md`.
Check `PROJECT-CONFIG.md` Section 16 for overrides.

For each chapter, enforce:
- Word range (from CORE-STRUCTURE defaults or PROJECT-CONFIG override)
- Section order (from CORE-STRUCTURE defaults or PROJECT-CONFIG override)
- Forbidden content (defined per chapter in CORE-STRUCTURE)

---

## Domain-Aware Drafting

1. Read `PROJECT-CONFIG.md` field `domain:`
2. Load all `.md` files from `.agent/domains/[domain]/`
3. Use domain terminology bank for precise vocabulary
4. Use domain evaluation metrics for results sections
5. Use domain forbidden phrases to catch imprecise language
6. Use domain canonical references as citation anchors

If domain is not declared:
-> WARN: "No domain declared in PROJECT-CONFIG.md. Drafting with core rules only. Set domain field for domain-specific terminology and metrics."

---

## Output Format

Read from `.agent/CORE-STRUCTURE.md` Section "Section Output Format".
Summary:
1. Full prose paragraphs
2. `[CITATION NEEDED: claim-type]` for uncited claims
3. `[READ FROM RESULTS/]` for unverified metrics
4. Section heading: `## N.M Section Title`
5. `[TRANSITION -> next section]` at section end
6. `[Draft word count: ~XXX]` at draft end

---

## Error Handling

PROJECT-CONFIG.md missing or RQs empty:
-> STOP: "PROJECT-CONFIG.md missing or incomplete. Define RQ1/RQ2/RQ3 before drafting. Type /advisor for guidance."

Domain module not found:
-> WARN: "Domain '[name]' has no module in .agent/domains/. Copy _template/ and fill it, or draft with core rules only."

Law violation requested:
-> Flag specific law number. Rewrite to compliance before delivering.

Chapter 4 attempted without experiment data:
-> STOP: "Experiment data missing in PROJECT-CONFIG.md. Fill Sections 11-15 before drafting Chapter 4."
