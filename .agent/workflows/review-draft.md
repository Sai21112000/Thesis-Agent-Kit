---
name: review-draft
description: Activate with /review-draft to run an adversarial Q1-level critique — loads CORE-QA pillars and domain module, then produces a 6-pillar scorecard, critical issue list with annotated revisions, and a priority-ordered action plan. Triggers snapshot on revision.
version: 2.0.0
command: /review-draft
allowed-tools: Read,Glob
---

# /review-draft Workflow

Adversarial quality gate. Does not soften feedback.

---

## Step 1 — Context

Ask: chapter/section, RQ addressed, first draft or revision.
Infer from content if skipped; state assumptions.

Load:
1. `.agent/CORE-QA.md` — 6-pillar rubric
2. `.agent/CORE-LAWS.md` — 6 Immutable Laws
3. `PROJECT-CONFIG.md` — RQs, domain, experiment data
4. Domain module from `.agent/domains/[domain]/` if declared
5. research-reviewer skill

---

## Step 2 — Six-Pillar Review

Read pillar definitions from `.agent/CORE-QA.md`.
Score Pass/Weak/Fail with quoted evidence.

Pillar 1 — Novelty: specific, measurable, proportional claims?
Pillar 2 — Methodology: reproducible, metrics correct, validation present?
Pillar 3 — Gap Integrity: gap cited with >=3 papers, specific formula?
Pillar 4 — Result Validity: real data, hedging language, failure analysis?
Pillar 5 — Writing: no fluff, T-C-E-L, tense/voice correct, citation format?
Pillar 6 — Citations: all claims cited, no over-reliance, >=60% recent?

Domain-specific checks from loaded domain module.

---

## Step 3 — Review Report

Use template from `.agent/CORE-QA.md`:

/review-draft REPORT | [Chapter N, Section X.X] | RQ: [#]

SCORECARD
P1 Novelty:    [Pass/Weak/Fail]
P2 Method:     [Pass/Weak/Fail]
P3 Gap:        [Pass/Weak/Fail]
P4 Results:    [Pass/Weak/Fail]
P5 Writing:    [Pass/Weak/Fail]
P6 Citations:  [Pass/Weak/Fail]
OVERALL: [STRONG / ACCEPTABLE / NEEDS MAJOR REVISION / REJECT]

CRITICAL ISSUES (fix before submission)
1. [issue — quote — required fix]

MODERATE ISSUES
1. [...]

REVISION PRIORITY
1. [highest-impact first]

---

## Step 4 — Annotated Revisions

For each critical/moderate issue:

ORIGINAL: "[quoted text]"
PROBLEM: [specific issue]
REVISED: "[corrected text with metric/citation]"

---

## Step 5 — Snapshot on Revision

If revisions are applied, invoke snapshot-manager:
  Create snapshot with label `post-review-chapter-[N]`
  Append to SNAPSHOT-INDEX.md

---

## Fallback Behavior

Draft < 200 words -> "Paste complete section (>=200 words)."
No chapter specified -> infer and state assumption.
Domain module missing -> WARN and review with core checks only.
