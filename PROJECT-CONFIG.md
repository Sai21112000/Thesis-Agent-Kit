# PROJECT-CONFIG.md — Universal Research Project Configuration
# Fill every section before using /write-chapter.
# Agents read this file before every action.
# Replaces: RQ-SKELETON.md + WORKSPACE-MAPPER.md (v1.0)

---

## 1. Project Identity

Working Title: [Your research title]
Domain: [computer-vision / nlp / reinforcement-learning / biomedical / social-science / other]
Target Venue: [e.g., Remote Sensing (MDPI), IEEE TGRS, ACL, The Lancet]
Target Quartile: [Q1 / Q2]
Citation Style: [APA 7th / IEEE / Vancouver / Chicago]
Document Type: [thesis / journal-paper / conference-paper]

---

## 2. Domain Declaration

domain: [computer-vision]

This field triggers auto-loading of domain modules from `.agent/domains/[domain]/`.
Use exact folder name. Available: computer-vision, nlp, reinforcement-learning, biomedical, social-science.
For unlisted domains: copy `.agent/domains/_template/` and fill it.

---

## 3. Research Problem (50-80 words)

[Current methods for X fail to address Y in context Z, resulting in Q.
Documented in: Author (Year), Author (Year). Consequence: [impact on field].]

---

## 4. Research Gap

Gap Type: [Evidence / Knowledge / Methodological / Population-Context]

[While Author A (Year), Author B (Year), and Author C (Year) demonstrate [X],
[limitation Z] remains unaddressed [in context Y], creating a critical gap in [consequence].]

---

## 5. Research Aim

(One sentence, starts with infinitive verb):
To [verb] [what] [for/using] [how] [in context of].

---

## 6. Research Questions

RQ1: [How / What / To what extent / Which] [phenomenon] [in what context]?
RQ2: [...]
RQ3: [...]

---

## 7. Hypotheses

H1: [If [condition], then [expected outcome] vs [baseline] (p < 0.05).]
H2: [...]
H3: [...]

---

## 8. RQ-to-Method Mapping

| RQ  | Hypothesis | Method/Experiment | Primary Metric | Chapter |
|-----|-----------|-------------------|---------------|---------|
| RQ1 | H1        | [Experiment A]    | [metric]      | Ch.4    |
| RQ2 | H2        | [Experiment B]    | [metric]      | Ch.4    |
| RQ3 | H3        | [Experiment C]    | [metric]      | Ch.4    |

---

## 9. Scope

In scope: [item 1], [item 2], [item 3]
Out of scope: [This study does not address X]

---

## 10. Expected Contributions

1. [Specific measurable contribution 1]
2. [Specific measurable contribution 2]
3. [Specific measurable contribution 3]

---

## 11. Dataset / Data

Total samples:     [N]
Train:             [n1] ([%]%)
Validation:        [n2] ([%]%)
Test:              [n3] ([%]%)
Classes/Categories:[names and counts]
Data format:       [e.g., images 4000x3000 px, text corpus, clinical records]
Source:            [e.g., collected via UAV, public dataset, hospital records]

---

## 12. Experiment Configuration

Model/Method:      [e.g., YOLOv11n, BERT-base, PPO, logistic regression]
Initialization:    [e.g., COCO pre-trained, random, HuggingFace checkpoint]
Hardware:          [GPU/CPU model + RAM/VRAM]
Key Hyperparameters:
  - [param1]: [value]
  - [param2]: [value]
  - [param3]: [value]
Software:          [e.g., PyTorch 2.1, Ultralytics 8.1, R 4.3]

---

## 13. Primary Results

File: RESULTS/[filename]

| Metric          | Value   | Conditions                    |
|-----------------|---------|-------------------------------|
| [primary metric]| [value] | [threshold/config details]    |
| [metric 2]      | [value] |                               |
| [metric 3]      | [value] |                               |
| [metric 4]      | [value] |                               |
| [metric 5]      | [value] |                               |

---

## 14. Ablation / Validation Results

File: RESULTS/[filename]

| Configuration        | [Metric 1] | [Metric 2] | [Metric 3] |
|---------------------|------------|------------|------------|
| Baseline            | [v]        | [v]        | [v]        |
| + Component A       | [v]        | [v]        | [v]        |
| + Component B       | [v]        | [v]        | [v]        |
| Full Proposed       | [v]        | [v]        | [v]        |

---

## 15. Comparison with Prior Work

File: RESULTS/[filename]

| Method (Citation)  | [Metric 1] | [Metric 2] | Year |
|-------------------|------------|------------|------|
| [Baseline method] | [v]        | [v]        | [yr] |
| Proposed          | [v]        | [v]        | [yr] |

---

## 16. Chapter Config (optional overrides)

Uncomment and modify to override CORE-STRUCTURE.md defaults:
<!-- Ch.1 word range: 2000-3500 -->
<!-- Ch.2 word range: 4000-7000 -->
<!-- Ch.3 word range: 3500-6000 -->
<!-- Ch.4 word range: 4000-7000 -->
<!-- Ch.5 word range: 1500-2500 -->

---

## STATUS

Research Architecture:
- [ ] Title confirmed
- [ ] Problem written
- [ ] Gap cited with >=3 papers
- [ ] Aim written
- [ ] RQ1/RQ2/RQ3 defined
- [ ] Hypotheses stated
- [ ] Method mapping complete
- [ ] Advisor sign-off

Experiment Data:
- [ ] Dataset stats filled
- [ ] Experiment config filled
- [ ] Primary results filled
- [ ] Ablation/validation table filled
- [ ] Comparison table filled

CHAPTER 4 BLOCKED until all experiment data items are checked.
