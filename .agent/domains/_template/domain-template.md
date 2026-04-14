---
name: domain-[your-domain]
domain: [folder-name]
description: "[One sentence: Activate when writing or reviewing sections involving [domain topic] — injects [what it provides].]"
version: 1.0.0
allowed-tools: Read,Glob
---

# Domain: [Your Domain Name]

Domain expertise for [domain] research sections. Targets: [list 3-5 target venues].

---

## Overview

**Invoke when**: writing about [domain-specific topics].
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Prerequisites

- Read PROJECT-CONFIG.md for domain-relevant RQs
- Read PROJECT-CONFIG.md Sections 11-15 before writing any metric values

---

## Section 1 — Terminology Bank

| Term | Precise Definition |
|------|-------------------|
| [Term 1] | [Definition] |
| [Term 2] | [Definition] |
| [Term 3] | [Definition] |
| [Term 4] | [Definition] |
| [Term 5] | [Definition] |
| [Term 6] | [Definition] |
| [Term 7] | [Definition] |
| [Term 8] | [Definition] |
| [Term 9] | [Definition] |
| [Term 10] | [Definition] |

Minimum 10 terms required.

---

## Section 2 — Evaluation Metrics

PRIMARY (all must be reported):
  [metric 1], [metric 2], [metric 3]

SECONDARY (for additional claims):
  [metric 4], [metric 5]

Metric formulas:
  [metric 1] = [formula]
  [metric 2] = [formula]

---

## Section 3 — Chapter 3 Checklist

- [ ] [Data source and acquisition method]
- [ ] [Data format, size, splits]
- [ ] [Preprocessing steps]
- [ ] [Method/model with citation]
- [ ] [Key hyperparameters or configuration]
- [ ] [Evaluation protocol]
- [ ] [Validation/ablation design]
- [ ] [Reproducibility details]

---

## Section 4 — Ablation / Validation Table Template

Table X.X — [Ablation/Validation] Study on [Dataset/Context]

| Configuration          | [Metric 1] | [Metric 2] | [Metric 3] |
|-----------------------|------------|------------|------------|
| Baseline              | [FILL]     | [FILL]     | [FILL]     |
| + Component A         | [FILL]     | [FILL]     | [FILL]     |
| + Component B         | [FILL]     | [FILL]     | [FILL]     |
| Full Proposed         | [FILL]     | [FILL]     | [FILL]     |

Rule: each row isolates exactly ONE variable vs. full system.

---

## Section 5 — Comparison Table Template

Table X.X — Comparison with Prior Work

| Method (Citation)     | Dataset | [Metric 1] | [Metric 2] | Year |
|----------------------|---------|------------|------------|------|
| [Prior method 1]     | [data]  | [v]        | [v]        | [yr] |
| [Prior method 2]     | [data]  | [v]        | [v]        | [yr] |
| Proposed             | [data]  | [v]        | [v]        | [yr] |

Only compare methods on equivalent datasets and conditions. Bold best per column.

---

## Section 6 — Canonical References

1. [Author, A., et al. (Year). Title. Venue. DOI.]
2. [Author, B., et al. (Year). Title. Venue. DOI.]
3. [Author, C., et al. (Year). Title. Venue. DOI.]
4. [Author, D., et al. (Year). Title. Venue. DOI.]
5. [Author, E., et al. (Year). Title. Venue. DOI.]

Minimum 5 verified references required.

---

## Section 7 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "[vague claim 1]" | "[precise alternative with metric]" |
| "[vague claim 2]" | "[precise alternative with metric]" |
| "[vague claim 3]" | "[precise alternative with metric]" |
| "[vague claim 4]" | "[precise alternative with metric]" |

---

## Error Handling

[Key data field] not specified:
-> Flag: "[[FIELD] NOT SPECIFIED — required for all [domain] sections]"

[Key validation] absent:
-> BLOCK: "Add [validation type] to PROJECT-CONFIG before drafting Chapter 4."
