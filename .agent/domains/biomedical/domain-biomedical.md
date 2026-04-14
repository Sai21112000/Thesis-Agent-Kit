---
name: domain-biomedical
domain: biomedical
description: Activate when writing or reviewing sections involving clinical trials, epidemiological studies, diagnostic evaluation, or health outcomes research — injects biomedical terminology, CONSORT/STROBE reporting standards, clinical metrics (sensitivity, specificity, AUC-ROC, NNT), and ethics documentation requirements.
version: 1.0.0
allowed-tools: Read,Glob
---

# Domain: Biomedical and Health Sciences

Domain expertise for biomedical research sections. Targets: The Lancet, BMJ, JAMA, NEJM, PLOS Medicine, BMC Medicine.

---

## Overview

**Invoke when**: writing about clinical trials, epidemiology, diagnostic accuracy, public health interventions, or health outcomes.
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Prerequisites

- Read PROJECT-CONFIG.md for study design and outcome measures
- Read PROJECT-CONFIG.md Sections 11-15 before writing any statistical results
- Confirm ethics approval documented in PROJECT-CONFIG.md

---

## Section 1 — Terminology Bank

| Term | Precise Definition |
|------|-------------------|
| RCT | Randomized Controlled Trial — gold standard for causal inference |
| CONSORT | Consolidated Standards of Reporting Trials — mandatory reporting checklist for RCTs |
| STROBE | Strengthening the Reporting of Observational Studies in Epidemiology |
| PRISMA | Preferred Reporting Items for Systematic Reviews and Meta-Analyses |
| p-value | Probability of observing data at least as extreme as results, assuming null hypothesis |
| Confidence Interval (CI) | Range within which the true parameter lies with stated probability (typically 95%) |
| NNT | Number Needed to Treat — patients treated per one additional favorable outcome |
| Hazard Ratio (HR) | Ratio of hazard rates between groups; HR<1 favors treatment |
| Kaplan-Meier | Non-parametric survival curve estimator |
| ITT | Intention-to-Treat analysis — all randomized participants analyzed in assigned groups |
| Per-protocol | Analysis restricted to participants who completed the protocol as designed |
| Blinding | Concealment of group assignment from participants/investigators/assessors |
| Placebo | Inactive treatment used as comparator in controlled trials |
| Crossover | Design where participants receive both treatment and control sequentially |
| Cohort Study | Longitudinal observational study following exposed vs. unexposed groups |
| Case-Control | Retrospective comparison of cases (disease) vs. controls (no disease) |
| Odds Ratio (OR) | Ratio of odds of exposure in cases vs. controls |
| Relative Risk (RR) | Ratio of event rates between exposed and unexposed groups |
| AUC-ROC | Area Under Receiver Operating Characteristic curve — discrimination metric |
| Sensitivity | True Positive Rate — proportion of actual positives correctly identified |
| Specificity | True Negative Rate — proportion of actual negatives correctly identified |
| PPV | Positive Predictive Value — proportion of positive results that are true positives |
| NPV | Negative Predictive Value — proportion of negative results that are true negatives |

---

## Section 2 — Evaluation Metrics

### Diagnostic Accuracy
PRIMARY: Sensitivity, Specificity, AUC-ROC
SECONDARY: PPV, NPV, Likelihood Ratios (LR+, LR-)

### Treatment Efficacy
PRIMARY: Hazard Ratio (HR), Relative Risk (RR), Odds Ratio (OR)
SECONDARY: NNT, Absolute Risk Reduction (ARR), 95% CI for all effect sizes

### Survival Analysis
Kaplan-Meier curves with log-rank test p-value
Cox proportional hazards for adjusted HR

### Formulas
  Sensitivity = TP / (TP + FN)
  Specificity = TN / (TN + FP)
  PPV = TP / (TP + FP)
  NPV = TN / (TN + FN)
  NNT = 1 / ARR
  OR = (a*d) / (b*c)  [2x2 table: a=exposed cases, b=exposed controls, c=unexposed cases, d=unexposed controls]

---

## Section 3 — Chapter 3 Checklist

- [ ] Study design (RCT, cohort, case-control, cross-sectional)
- [ ] CONSORT or STROBE checklist compliance stated
- [ ] Ethics approval: IRB/Ethics Committee name and approval number
- [ ] Informed consent procedure documented
- [ ] Sample size calculation with power analysis (alpha, beta, effect size)
- [ ] Inclusion and exclusion criteria
- [ ] Randomization method (if RCT): sequence generation, allocation concealment
- [ ] Blinding: single/double/triple/open-label
- [ ] Primary and secondary outcome measures with operational definitions
- [ ] Data collection instruments with validity/reliability evidence
- [ ] Statistical analysis plan: tests, software, significance threshold
- [ ] Missing data handling strategy (MCAR/MAR/MNAR, imputation method)
- [ ] ITT vs. per-protocol analysis declared

---

## Section 4 — Results Table Templates

### Table X.X — Baseline Characteristics

| Characteristic | Treatment (n=X) | Control (n=X) | p-value |
|---------------|-----------------|---------------|---------|
| Age, mean (SD) | | | |
| Sex, n (%) | | | |
| [Covariate 3] | | | |

### Table X.X — Primary Outcomes

| Outcome | Treatment | Control | Effect Size (95% CI) | p-value |
|---------|-----------|---------|---------------------|---------|
| [Primary] | | | | |
| [Secondary 1] | | | | |

Rule: always report effect sizes with 95% CI. p-values alone are insufficient.

---

## Section 5 — Comparison Table Template

Table X.X — Comparison with Prior Studies

| Study (Year) | Design | Population | N | Primary Outcome | Effect Size |
|-------------|--------|------------|---|-----------------|-------------|
| [Author 1] | RCT | [pop] | [n] | [outcome] | [HR/OR/RR] |
| This study | [design] | [pop] | [n] | [outcome] | [HR/OR/RR] |

---

## Section 6 — Canonical References

- Schulz, K.F., et al. (2010). CONSORT 2010 statement. The Lancet, 375(9721), 1136-1144. https://doi.org/10.1016/S0140-6736(10)60456-4
- von Elm, E., et al. (2007). STROBE statement. The Lancet, 370(9596), 1453-1457. https://doi.org/10.1016/S0140-6736(07)61602-X
- Higgins, J.P.T., et al. (2019). Cochrane Handbook for Systematic Reviews (6th ed.). Cochrane. https://training.cochrane.org/handbook
- Moher, D., et al. (2009). PRISMA statement. PLOS Medicine, 6(7), e1000097. https://doi.org/10.1371/journal.pmed.1000097
- Altman, D.G. (1991). Practical Statistics for Medical Research. Chapman & Hall.

---

## Section 7 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "The treatment works" | "HR = 0.72 (95% CI: 0.58-0.89, p = 0.002)" |
| "statistically significant" alone | "statistically significant (p = 0.003) with a clinically meaningful effect size (RR = 0.65)" |
| "proves that" | "provides evidence that" or "suggests that" |
| "we enrolled patients" | "Participants were recruited from [setting] between [dates]" |
| "the p-value is good" | "p < 0.001, with effect size [OR/HR/RR] = X (95% CI: Y-Z)" |
| "large sample" | "N = 1,247 participants (power = 0.80 for detecting [effect size])" |

---

## Section 8 — Reporting Standards

### For RCTs: CONSORT Flow Diagram Required
Enrollment -> Allocation -> Follow-up -> Analysis
Document: assessed for eligibility, excluded (with reasons), randomized, allocated, lost to follow-up, analyzed

### For Observational Studies: STROBE Checklist
Title/Abstract -> Introduction -> Methods -> Results -> Discussion -> Other
22-item checklist, all items must be addressed

---

## Error Handling

Ethics approval not documented:
-> BLOCK: "Ethics approval number required before drafting Methods. Add IRB details to PROJECT-CONFIG.md."

Sample size justification absent:
-> Flag: "[SAMPLE SIZE NOT JUSTIFIED — add power analysis to Methods section]"

Effect sizes without CI:
-> Flag: "[CONFIDENCE INTERVAL MISSING — report 95% CI for all effect sizes]"

p-value without effect size:
-> Flag: "[EFFECT SIZE MISSING — p-value alone is insufficient; report OR/HR/RR with 95% CI]"
