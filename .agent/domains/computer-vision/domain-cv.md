---
name: domain-cv
domain: computer-vision
description: Activate when writing or reviewing sections involving object detection, instance segmentation, or deep learning evaluation — injects CV terminology, required metrics (mAP@50, mAP@50-95, FPS), ablation templates, and SOTA comparison formats for IEEE TGRS, Remote Sensing, ISPRS, CVPR.
version: 2.0.0
allowed-tools: Read,Glob
---

# Domain: Computer Vision

Domain knowledge for all CV research sections. Ensures precise terminology, correct metric reporting, and Q1-standard methodology structure.

---

## Overview

**Invoke when**: writing Methods, Results, or Discussion involving neural networks, detection, or segmentation.
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Prerequisites

- Read PROJECT-CONFIG.md for CV tasks in RQs
- Read PROJECT-CONFIG.md Sections 11-15 before writing any metric values

---

## Section 1 — Terminology Bank

| Term | Precise Definition |
|------|-------------------|
| Bounding Box | Axis-aligned rectangle [x_center, y_center, w, h] YOLO format |
| Anchor-Free | Detection without pre-defined anchors (YOLOv8+, FCOS, CenterNet) |
| IoU | Intersection over Union — box overlap metric |
| mAP@50 | Mean Average Precision at IoU=0.50 across all classes |
| mAP@50-95 | Mean of mAP at IoU 0.50-0.95 (COCO primary metric) — required at Q1 |
| Precision | TP / (TP + FP) |
| Recall | TP / (TP + FN) |
| F1-Score | 2*P*R / (P+R) — harmonic mean |
| NMS | Non-Maximum Suppression — removes duplicate detections |
| FPS | Frames Per Second — inference speed (state GPU, batch, resolution) |
| SAM | Segment Anything Model (Kirillov et al., 2023) — promptable segmentation |
| Mask IoU | IoU between predicted and ground truth segmentation masks |
| Backbone | Feature extraction network |
| Neck | Feature aggregation (FPN, PANet, BiFPN) |
| Head | Prediction layer: classification + regression |
| YOLOv8 | Anchor-free, CSPDarknet backbone (Jocher et al., 2023) |
| YOLOv11 | C3k2 block architecture (Jocher et al., 2024) |
| GSD | Ground Sample Distance — cm/px spatial resolution |
| Transfer Learning | Initialize with pre-trained weights (e.g., COCO) |

---

## Section 2 — Required Evaluation Metrics

PRIMARY (all must be reported):
  mAP@50, mAP@50-95, Precision, Recall, F1-Score

SECONDARY (for speed/efficiency claims):
  FPS (state GPU, batch size, resolution), Model size (MB), Params (M), GFLOPs

Metric formulas:
  P = TP / (TP + FP)
  R = TP / (TP + FN)
  F1 = 2*P*R / (P+R)
  IoU = |B_pred ∩ B_gt| / |B_pred ∪ B_gt|
  mAP = (1/N) * sum(AP_i)

---

## Section 3 — Chapter 3 Checklist

- [ ] Dataset: source, acquisition, date, total images, exact split
- [ ] Class distribution with counts per class
- [ ] Image resolution and GSD
- [ ] Data augmentation: list transforms and parameters
- [ ] Model architecture with citation per component
- [ ] Pre-training source (COCO-pretrained)
- [ ] Training hardware (GPU model + VRAM)
- [ ] Batch size, LR, optimizer, scheduler, epochs
- [ ] Confidence threshold for evaluation
- [ ] IoU threshold for NMS
- [ ] Ablation study design
- [ ] Baseline model with citation

---

## Section 4 — Ablation Table Template

Table X.X — Ablation Study on [Dataset]

| Configuration          | mAP@50 | mAP@50-95 | Params(M) | FPS |
|-----------------------|--------|-----------|-----------|-----|
| Baseline (YOLOv8n)    |        |           |           |     |
| + Domain fine-tuning  |        |           |           |     |
| + Data augmentation   |        |           |           |     |
| + SAM integration     |        |           |           |     |
| Full Proposed System  |        |           |           |     |

Rule: each row removes exactly ONE component vs. full system.
Every claimed contribution needs a corresponding ablation row.

---

## Section 5 — SOTA Comparison Template

Table X.X — Comparison with State-of-the-Art

| Method (Citation)     | Dataset | mAP@50 | mAP@50-95 | FPS | Year |
|----------------------|---------|--------|-----------|-----|------|
| YOLOv8n (2023)       | COCO    | —      | —         | —   | 2023 |
| Proposed             | [Yours] | XX.X   | XX.X      | XX  | 2025 |

Only compare methods on same dataset and resolution. Bold best per column.

---

## Section 6 — Canonical References

- Jocher, G., et al. (2023). Ultralytics YOLOv8. https://doi.org/10.5281/zenodo.7347926
- Kirillov, A., et al. (2023). Segment Anything. ICCV. https://doi.org/10.1109/ICCV51070.2023.00371
- Lin, T.-Y., et al. (2017). Feature pyramid networks. CVPR. https://doi.org/10.1109/CVPR.2017.106
- Lin, T.-Y., et al. (2014). Microsoft COCO. ECCV. https://doi.org/10.1007/978-3-319-10602-1_48

---

## Section 7 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "The model is accurate" | "mAP@50 = X% on [dataset]" |
| "Our method is fast" | "Inference: X FPS on [GPU] at [resolution]" |
| "accuracy" for detection | Use mAP@50 |
| "We use YOLO" | "YOLOv11n (Jocher et al., 2024) was employed as..." |
| "good results" | "outperforms [baseline] by X% mAP@50 (Table X)" |

---

## Error Handling

Results data empty in PROJECT-CONFIG.md:
-> Insert [READ FROM RESULTS/] — do NOT estimate values.

Ablation absent from Chapter 4:
-> BLOCK: "Add ablation design to PROJECT-CONFIG before drafting Chapter 4."
