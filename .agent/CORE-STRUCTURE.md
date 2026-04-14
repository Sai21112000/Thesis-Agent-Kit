# CORE-STRUCTURE.md — Universal Document Architecture
# Domain-agnostic research document structure.
# Word counts and section orders are defaults; override in PROJECT-CONFIG.md.
# Version: 2.0.0

---

## The Research Chain

Every research document follows a single logical chain. No link may be skipped.

```
Problem -> Gap -> Aim -> RQ -> Hypothesis -> Design -> Method -> Result -> Conclusion
    ^                                                                          |
    └───────────── Every conclusion loops back to answer the RQ ───────────────┘
```

---

## IMRaD Mapping

The universal IMRaD structure maps to the 5-chapter thesis format:

| IMRaD Section | Thesis Chapter | Primary Job                       |
|---------------|----------------|-----------------------------------|
| Introduction  | Chapter 1      | Problem + Gap + Aim + RQs         |
| Introduction  | Chapter 2      | Literature Review (expanded)      |
| Methods       | Chapter 3      | Design + Data + Procedure         |
| Results+Disc. | Chapter 4      | Findings + Interpretation         |
| Conclusion    | Chapter 5      | Summary + Contributions + Future  |

---

## Chapter Defaults

Override any value in PROJECT-CONFIG.md under `## Chapter Config`.

### Chapter 1 — Introduction
Word range: 2,000-3,500
Order: Hook -> Problem Statement -> Research Gap -> Aim -> Research Questions -> Significance -> Scope -> Chapter Overview
Forbidden: results, numerical findings, model/method names without citation

### Chapter 2 — Literature Review
Word range: 4,000-7,000
Order: Opening synthesis -> Thematic sub-sections (3 minimum) -> Gap summary -> Transition to Chapter 3
Forbidden: chronological summaries, uncited claims, direct quotes >40 words

### Chapter 3 — Methodology
Word range: 3,500-6,000
Order: Design justification -> Dataset/Data Collection -> Procedure/Architecture -> Training/Analysis -> Evaluation Metrics -> Ablation/Validation Design -> Reproducibility Statement
Forbidden: results, performance numbers, interpretation

### Chapter 4 — Results and Discussion
Word range: 4,000-7,000
Order: Results tables/figures first -> Per-RQ discussion -> Ablation/Validation -> Comparison with prior work -> Failure analysis -> Limitations
Forbidden: restating methodology, overclaiming without hedging

### Chapter 5 — Conclusion
Word range: 1,500-2,500
Order: Aim restatement -> Per-RQ conclusions -> Contributions list -> Limitations -> Future work (specific) -> Closing statement
Forbidden: new data, vague future work ("further research is needed")

---

## Section Output Format

1. Full prose paragraphs (no bullets in thesis body)
2. `[CITATION NEEDED: claim-type]` for uncited claims
3. `[READ FROM RESULTS/]` for unverified metrics
4. Section heading: `## N.M Section Title`
5. `[TRANSITION -> next section]` at section end
6. `[Draft word count: ~XXX]` at draft end

---

## Quality Gate (Post-Section)

After drafting each section, verify:

- [ ] Declarative topic sentence per paragraph?
- [ ] T-C-E-L structure applied?
- [ ] All claims cited or flagged?
- [ ] No forbidden phrases (Law 2)?
- [ ] Correct tense for section type (Law 3)?
- [ ] RQ traceability confirmed (Law 1)?
- [ ] No unverified quantitative claims?

Issues found: self-correct all before delivering.
