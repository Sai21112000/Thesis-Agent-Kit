---
name: latex-formatting
description: Activate when formatting thesis content in LaTeX, converting prose to LaTeX, fixing compilation errors, or applying AIT ICT thesis template — provides document structure, figure/table environments, equation syntax, BibTeX templates, and compilation order.
version: 1.0.0
allowed-tools: Read,Write,Bash,Glob
---

# LaTeX Formatting Skill

Formats and validates thesis content in LaTeX conforming to AIT ICT Department standards.

---

## Overview

**Invoke when**: LaTeX formatting, template setup, equation typesetting, BibTeX, or compilation fixes.

---

## Section 1 — Preamble (AIT Thesis)

\documentclass[12pt, a4paper, oneside]{report}
\usepackage[utf8]{inputenc}
\usepackage{times}
\usepackage[margin=1in, left=1.5in]{geometry}
\usepackage{setspace}
\doublespacing
\usepackage[style=apa, backend=biber]{biblatex}
\addbibresource{references.bib}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[colorlinks=true, linkcolor=black, citecolor=black]{hyperref}

---

## Section 2 — Figure Rules

\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.85\textwidth]{figures/arch.pdf}
  \caption{Caption here.}
  \label{fig:arch}
\end{figure}

Rules: Caption BELOW. Width 0.7-0.9\textwidth. PDF or PNG 300DPI.
Every figure referenced in text BEFORE it appears.

---

## Section 3 — Table Rules

\begin{table}[htbp]
  \centering
  \caption{Table caption above.}
  \label{tab:results}
  \begin{tabular}{lccc}
    \toprule
    \textbf{Method} & \textbf{mAP@50} & \textbf{FPS} \\
    \midrule
    YOLOv8n & 82.4 & 142 \\
    \textbf{Proposed} & \textbf{89.4} & \textbf{98} \\
    \bottomrule
  \end{tabular}
\end{table}

Rules: Caption ABOVE table. Use booktabs (toprule/midrule/bottomrule) — never \hline.

---

## Section 4 — Equations

Inline: \(F_1 = 2 \cdot \frac{P \cdot R}{P + R}\)

Display (numbered):
\begin{equation}
  \text{mAP} = \frac{1}{N}\sum_{i=1}^{N} AP_i
  \label{eq:map}
\end{equation}

Reference: Equation~\ref{eq:map}
Rules: number all referenced equations; use \text{} for words in math mode.

---

## Section 5 — BibTeX Templates

@article{wang2023,
  author={Wang, X. and Li, J.},
  title={Oil palm detection using {YOLOv8}},
  journal={Remote Sensing},
  volume={15}, number={4}, pages={112--128},
  year={2023}, doi={10.3390/rs15040112},
}

---

## Section 6 — Compilation Order

pdflatex thesis.tex
biber thesis
pdflatex thesis.tex
pdflatex thesis.tex

## Common Errors

| Error | Fix |
|-------|-----|
| Undefined control sequence | Add missing package |
| Missing $ inserted | Wrap math in \(...\) |
| Citation undefined | Run full compilation sequence |
| Float(s) lost | Add \clearpage between chapters |

---

## Error Handling

If \hline detected:
-> "Replace with booktabs commands."

Unnumbered equation referenced:
-> "Add \label{eq:name} and reference with Equation~\ref{eq:name}."
