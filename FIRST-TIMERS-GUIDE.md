# First Timers Guide — Thesis Agent Kit v2.1

Get from zero to your first Q1 draft section in 15 minutes.

## Step 0: Run /interview (Recommended)

Type `/interview` in your AI editor. The Research Interrogator will:
- Walk you through every section of `PROJECT-CONFIG.md`
- Score each section 0-100%
- Refuse to let you proceed until aggregate confidence ≥ 90%

This is the fastest path to a solid config. If you prefer to fill it manually, skip to Step 1.

## Step 1: Fill PROJECT-CONFIG.md (Do this FIRST)

Open `PROJECT-CONFIG.md` at the project root. Fill every section:

**Section 1-2: Identity + Domain**
- Study title, target venue, quartile
- Domain declaration (triggers auto-loading of domain expertise)

**Sections 3-10: Research Architecture**
- Research problem (the wound in the literature)
- Research gap (cited with >=3 papers)
- Research aim (one sentence, infinitive verb)
- RQ1, RQ2, RQ3 (interrogative, specific, complex, novel)
- Hypotheses (one per RQ, testable prediction)
- RQ-to-Method mapping table
- Scope and expected contributions

**Sections 11-15: Experiment Data** (fill when experiments are done)
- Dataset stats, training config, primary results, ablation, comparison
- Chapter 4 is BLOCKED until these are complete — agents do not invent metrics

Stuck on RQs? Type `/advisor` in your editor.
See `examples/sample-PROJECT-CONFIG.md` for a pre-filled reference.

## Step 2: Choose Your Domain

Set the `domain:` field in PROJECT-CONFIG.md Section 2.

Available domains: `computer-vision`, `nlp`, `reinforcement-learning`, `biomedical`, `social-science`.

Not listed? Copy `.agent/domains/_template/` to `.agent/domains/[your-domain]/` and fill the template.

## Step 3: Start Writing

Type `/write-chapter` in your AI editor.
Select chapter -> confirm section brief -> receive draft.

## Step 4: Review Every Draft

Type `/review-draft` and paste the section.
6-pillar adversarial critique with line-level revisions.
Do not submit anything with NEEDS MAJOR REVISION or REJECT verdict.

## Step 5: Check Citations Before Submission

Type `/check-citations` and paste reference list.
Every FABRICATED citation must be removed — non-negotiable.

## Step 6: Use Snapshots

Your work is automatically versioned:
- `/snapshot my-label` — save current state manually
- `/history filename` — see all versions of a file
- `/restore timestamp` — roll back to any previous version

## The Three Rules

1. PROJECT-CONFIG first — fill it before any drafting
2. Real data only — experiment sections or [READ FROM RESULTS/]
3. Verify citations — `/check-citations` before every submission

## If Stuck

- Stuck on RQs: `/advisor`
- Stuck on section: `/write-chapter` with specific target
- Draft feels weak: `/review-draft` -> follow revision priority
- Unsure about citation: `/check-citations` on that reference
- Need to undo: `/restore` to roll back
