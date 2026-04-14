---
name: write-chapter
description: Activate with /write-chapter to orchestrate a step-by-step guided chapter drafting session — validates PROJECT-CONFIG prerequisites, loads core laws, domain modules, and chapter constraints, then delivers section-by-section prose with automatic quality gate checks and snapshot triggers.
version: 2.0.0
command: /write-chapter
allowed-tools: Read,Write,Glob
---

# /write-chapter Workflow

Primary drafting orchestrator.

---

## Step 0 — Prerequisites (BLOCKING)

CHECK 1: PROJECT-CONFIG.md exists with filled RQs (Sections 1-10)?
  FAIL -> STOP: "PROJECT-CONFIG.md empty or missing. Run /interview to build it, or /advisor for strategy."

CHECK 2: Experiment data (Sections 11-15) filled? (required for Ch.4 only)
  FAIL Ch.4 -> STOP: "Experiment data missing. Fill PROJECT-CONFIG.md Sections 11-15."
  FAIL other -> WARN: "Experiment data empty. Metric placeholders will be inserted."

CHECK 3: Target chapter specified?
  FAIL -> ASK: "Which chapter? [1] Intro [2] LitReview [3] Methods [4] Results [5] Conclusion"

---

## Step 1 — Load Skills and Core

1. Read `.agent/CORE-LAWS.md` — load 6 Immutable Laws
2. Read `.agent/CORE-STRUCTURE.md` — load chapter defaults
3. Read PROJECT-CONFIG.md Section 16 for chapter overrides
4. Load research-writer skill

Domain loading:
  Read `domain:` field from PROJECT-CONFIG.md
  Load all `.md` files from `.agent/domains/[domain]/`

Chapter-specific:
  Chapter 2: also load literature-review skill
  All chapters: load research-writer skill
  Figures/diagrams/plots (on user request or Ch.3/Ch.4 visual needs): load `.agent/skills/figure-generation.md` (or `/figures`)

Ask: "Which section of Chapter [N] to start?"

---

## Step 2 — Snapshot (Pre-Draft)

If target file exists, invoke snapshot-manager:
  Create snapshot with label `pre-write-chapter-[N]`
  Append to SNAPSHOT-INDEX.md

---

## Step 3 — Section Brief

Produce and confirm before drafting:
TARGET: [Chapter N, Section X.X]
RQ SERVED: [RQ1/RQ2/RQ3]
JOB: [1-sentence purpose]

---

## Step 4 — Drafting Rules

Read output format from `.agent/CORE-STRUCTURE.md`:
- Full prose paragraphs (no bullets in thesis body)
- [CITATION NEEDED: claim type] for uncited claims
- [READ FROM RESULTS/] for missing metrics
- [TRANSITION -> next section] at section end
- [Draft word count: ~XXX] at draft end

---

## Step 5 — Auto Quality Gate

After each section, check against CORE-LAWS.md:

QUALITY GATE
- Declarative topic sentence per paragraph? (Law 6)
- T-C-E-L structure applied? (Law 6)
- All claims cited or flagged? (Law 4)
- No forbidden phrases? (Law 2)
- Correct tense for section? (Law 3)
- RQ traceability confirmed? (Law 1)
- No unverified quantitative claims?

Issues: [N] — self-correct all before delivering.

---

## Step 6 — Snapshot (Post-Draft)

Invoke snapshot-manager:
  Create snapshot with label `post-write-chapter-[N]-section-[X]`
  Append to SNAPSHOT-INDEX.md

---

## Step 7 — Continue or Switch

"[C] Continue | [R] /review-draft | [S] Switch chapter | [D] Done"

---

## Chapter Word Counts (Defaults)

Read from CORE-STRUCTURE.md. Override in PROJECT-CONFIG.md Section 16.
Ch.1: 2,000-3,500 | Ch.2: 4,000-7,000 | Ch.3: 3,500-6,000
Ch.4: 4,000-7,000 | Ch.5: 1,500-2,500

---

## Fallback Behavior

Brief not confirmed -> proceed noting assumption.
Required section skipped -> "Section [X] required. Offer shorter version."
Domain module not found -> WARN and draft with core rules only.
