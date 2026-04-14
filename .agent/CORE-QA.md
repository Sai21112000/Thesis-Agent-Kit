# CORE-QA.md — Six-Pillar Quality Rubric
# Domain-agnostic quality assessment framework.
# Referenced by research-reviewer.md and /review-draft workflow.
# Version: 2.0.0

---

## The Six Pillars

Every research draft is evaluated against these six pillars.
Each pillar receives a grade: **Pass**, **Weak**, or **Fail** — with quoted evidence.

---

### Pillar 1 — Novelty

Does the work introduce something genuinely new?

| Grade | Criteria |
|-------|----------|
| Pass  | Specific, measurable, proportional contribution claims; novelty stated explicitly |
| Weak  | Vague claims ("we propose a new approach") without specifics |
| Fail  | No discernible novelty; restates existing work without differentiation |

Check: contribution claims in Ch.1/Ch.5 match evidence in Ch.4.

---

### Pillar 2 — Methodology

Is the study design sound, reproducible, and statistically valid?

| Grade | Criteria |
|-------|----------|
| Pass  | Complete method chain: design -> data -> procedure -> metrics; ablation/validation present |
| Weak  | Method described but missing reproducibility details (hardware, hyperparameters, splits) |
| Fail  | Method fundamentally flawed; no validation; metrics inappropriate for task |

Check: another researcher can replicate from Ch.3 alone.

---

### Pillar 3 — Gap Integrity

Is the research gap well-argued with literature evidence?

| Grade | Criteria |
|-------|----------|
| Pass  | Gap cited with >=3 papers; follows gap formula; specific limitation identified |
| Weak  | Gap stated but under-cited (<3 papers) or too broad |
| Fail  | No gap statement; "no research has been done" without evidence |

Gap formula: "While [A], [B], and [C] demonstrate [X], [limitation Z] remains unaddressed [in context Y], creating a critical gap in [consequence]."

---

### Pillar 4 — Result Validity

Are results consistent, honestly presented, and properly hedged?

| Grade | Criteria |
|-------|----------|
| Pass  | Real data from experiments; hedging language; failure analysis; limitations stated |
| Weak  | Results present but cherry-picked or missing confidence intervals/error bounds |
| Fail  | Fabricated or estimated values; no hedging; overclaiming |

Check: every number traces to RESULTS/ or PROJECT-CONFIG.md experiment data.

---

### Pillar 5 — Writing Quality

Does the text meet Q1 academic register standards?

| Grade | Criteria |
|-------|----------|
| Pass  | T-C-E-L paragraphs; correct tense/voice; no fluff; signposted transitions |
| Weak  | Mostly correct but isolated violations (wrong tense, missing transitions) |
| Fail  | Conversational tone; bullet lists in body; forbidden phrases; no paragraph structure |

Check against all 6 Laws in CORE-LAWS.md.

---

### Pillar 6 — Citation Integrity

Are all claims properly cited with verifiable sources?

| Grade | Criteria |
|-------|----------|
| Pass  | 2-6 citations per paragraph; >=60% within 5 years; APA 7th format; DOI-verifiable |
| Weak  | Some claims uncited; over-reliance on 1-2 sources; format inconsistencies |
| Fail  | Fabricated citations; systematic absence of evidence; >40% older than 5 years |

---

## Verdict Scale

| Verdict               | Criteria                                               |
|-----------------------|--------------------------------------------------------|
| STRONG                | All 6 pillars Pass                                     |
| ACCEPTABLE            | No pillar Fail; <=2 pillars Weak                       |
| NEEDS MAJOR REVISION  | 1-2 pillars Fail, or >=3 pillars Weak                  |
| REJECT                | >=3 pillars Fail                                       |

---

## Review Report Template

```
/review-draft REPORT | [Chapter N, Section X.X] | RQ: [#]

SCORECARD
P1 Novelty:    [Pass/Weak/Fail] — "[evidence quote]"
P2 Method:     [Pass/Weak/Fail] — "[evidence quote]"
P3 Gap:        [Pass/Weak/Fail] — "[evidence quote]"
P4 Results:    [Pass/Weak/Fail] — "[evidence quote]"
P5 Writing:    [Pass/Weak/Fail] — "[evidence quote]"
P6 Citations:  [Pass/Weak/Fail] — "[evidence quote]"
OVERALL: [VERDICT]

CRITICAL ISSUES (fix before submission)
1. [issue — quote — required fix]

MODERATE ISSUES
1. [issue — quote — suggested fix]

REVISION PRIORITY
1. [highest-impact action first]
```

---

## Annotated Revision Format

For each critical/moderate issue:

```
ORIGINAL: "[quoted text]"
PROBLEM:  [specific issue identified]
REVISED:  "[corrected text with metric/citation]"
```
