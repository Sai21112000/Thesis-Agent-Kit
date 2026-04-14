# SAMPLE PROJECT-CONFIG — Oil Palm Detection (Pre-filled Reference)
# SaiTeja Vaidya's thesis — use as reference example.

---

## 1. Project Identity

Working Title: "Automated Oil Palm Detection and Instance Segmentation
Using YOLOv11 and Segment Anything Model on Multi-Resolution UAV Imagery"
Domain: Computer Vision / Remote Sensing
Target Venue: Remote Sensing (MDPI) — Scopus Q1
Target Quartile: Q1
Citation Style: APA 7th
Document Type: thesis

---

## 2. Domain Declaration

domain: computer-vision

---

## 3. Research Problem

Current automated oil palm detection relies on fixed GSD imagery, failing to
maintain accuracy across variable flight altitudes common in operational UAV
surveys (Santoso et al., 2023; Wibowo et al., 2022; Chandrasekaran et al., 2021).
Consequence: no operationally deployable pipeline exists for smallholder farm
oil palm inventory across Southeast Asia's diverse UAV conditions.

---

## 4. Research Gap

Gap Type: Methodological + Population-Context

While Santoso et al. (2023), Wibowo et al. (2022), and Chandrasekaran et al. (2021)
demonstrate effective detection at fixed GSD (5-10 cm/px), performance degradation
across variable GSD (2-15 cm/px) remains unaddressed in multi-altitude UAV surveys,
creating a critical gap in scalable smallholder farm monitoring tools.

---

## 5. Research Aim

To evaluate the effectiveness of integrating YOLOv11 and SAM for automated
oil palm detection and instance segmentation from UAV imagery acquired across
multiple GSD conditions.

---

## 6. Research Questions

RQ1: How does GSD (2-10 cm/px) affect YOLOv11 detection accuracy (mAP@50)?
RQ2: To what extent does integrating SAM improve instance segmentation vs standalone detection?
RQ3: Which YOLO variant (v8 vs v11) achieves superior performance-speed trade-off at low GSD?

---

## 7. Hypotheses

H1: mAP@50 degrades significantly at GSD > 8 cm/px (p < 0.05, >5 pp decrease vs 2-5 cm/px).
H2: YOLOv11-SAM achieves >=5% higher Mask IoU vs standalone YOLOv11.
H3: YOLOv11n achieves >=10% higher FPS than YOLOv8n at equivalent mAP@50.

---

## 8. RQ-to-Method Mapping

| RQ  | Hypothesis | Method              | Metric      | Chapter |
|-----|-----------|---------------------|-------------|---------|
| RQ1 | H1        | Multi-GSD evaluation | mAP@50     | Ch.4.1  |
| RQ2 | H2        | SAM integration comparison | Mask IoU | Ch.4.2 |
| RQ3 | H3        | YOLO variant ablation | FPS, mAP@50 | Ch.4.3 |

---

## 9. Scope

In scope: UAV RGB nadir imagery 2-10 cm/px, oil palm smallholder context SE Asia,
YOLOv8n/v11n/v11s, SAM ViT-H prompt segmentation.
Out of scope: satellite data, disease classification, edge deployment, other crops.

---

## 10. Expected Contributions

1. First systematic YOLOv11-SAM evaluation across variable GSD for oil palm detection
2. Quantified GSD degradation curve with operational altitude thresholds
3. Open-source annotated oil palm UAV dataset spanning 2-10 cm/px GSD

---

## 11. Dataset / Data

Total samples:     [N]
Train:             [n1] ([%]%)
Validation:        [n2] ([%]%)
Test:              [n3] ([%]%)
Classes/Categories: oil palm crown (single class)
Data format:       RGB images, 4000x3000 px
Source:            Collected via DJI Phantom 4 Pro at 30-80m AGL

---

## 12. Experiment Configuration

Model/Method:      YOLOv11n (Jocher et al., 2024)
Initialization:    COCO pre-trained
Hardware:          [GPU model + VRAM]
Key Hyperparameters:
  - Batch size: [N]
  - Learning rate: [value]
  - Epochs: [N]
  - Optimizer: AdamW
  - LR Scheduler: Cosine
  - Image size: 640x640
Software:          Ultralytics 8.x, PyTorch 2.x

---

## 13. Primary Results

File: RESULTS/[filename].csv

| Metric          | Value   | Conditions                    |
|-----------------|---------|-------------------------------|
| mAP@50          | [value] | conf=0.5, IoU=0.5             |
| mAP@50-95       | [value] | COCO evaluation               |
| Precision       | [value] | conf=[threshold]              |
| Recall          | [value] |                               |
| F1-Score        | [value] |                               |
| FPS             | [value] | [GPU], batch=1                |
| Model Size      | [value] MB |                            |

---

## 14. Ablation / Validation Results

File: RESULTS/ablation_[date].csv

| Configuration        | mAP@50 | mAP@50-95 | FPS |
|---------------------|--------|-----------|-----|
| Baseline (YOLOv8n)  | [v]    | [v]       | [v] |
| + Fine-tuning       | [v]    | [v]       | [v] |
| + Augmentation      | [v]    | [v]       | [v] |
| + SAM integration   | [v]    | [v]       | [v] |
| Full Proposed       | [v]    | [v]       | [v] |

---

## 15. Comparison with Prior Work

File: RESULTS/comparison_[date].csv

| Method (Citation)  | mAP@50 | mAP@50-95 | Year |
|-------------------|--------|-----------|------|
| YOLOv8n (2023)    | [v]    | [v]       | 2023 |
| Proposed          | [v]    | [v]       | 2025 |

---

## 16. Chapter Config (optional overrides)

<!-- Using defaults from CORE-STRUCTURE.md -->

---

## STATUS

Research Architecture:
- [x] Title confirmed
- [x] Problem written
- [x] Gap cited with 3 papers
- [x] Aim written
- [x] RQ1/RQ2/RQ3 defined
- [x] Hypotheses stated
- [x] Method mapping complete
- [ ] Advisor sign-off

Experiment Data:
- [ ] Dataset stats filled
- [ ] Experiment config filled
- [ ] Primary results filled
- [ ] Ablation/validation table filled
- [ ] Comparison table filled

CHAPTER 4 BLOCKED until all experiment data items are checked.
