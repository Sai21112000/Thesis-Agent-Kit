---
name: domain-nlp
domain: nlp
description: Activate when writing or reviewing sections involving NLP, transformers, language model fine-tuning, or text evaluation — injects NLP terminology, task-appropriate metrics (macro F1, BLEU, ROUGE, BERTScore), and benchmark standards for Q1 NLP venues.
version: 2.0.0
allowed-tools: Read,Glob
---

# Domain: Natural Language Processing

Domain expertise for NLP research sections. Targets: ACL, EMNLP, NAACL, TACL, Computational Linguistics.

---

## Overview

**Invoke when**: writing about language models, text classification, generation, or NLP evaluation.
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Section 1 — Terminology Bank

| Term | Definition |
|------|-----------|
| Token | Smallest text unit after tokenization |
| Embedding | Dense vector representation of a token |
| Attention | A = softmax(QK^T/sqrt(d_k))V |
| Self-Attention | Each token attends to all tokens in same sequence |
| Fine-tuning | Continuing pre-training on task-specific labeled data |
| Zero-shot | Task without task-specific examples |
| Few-shot | K examples (K<10) in context |
| Perplexity | Exponentiated cross-entropy — fluency metric; lower=better |
| LoRA | Low-Rank Adaptation — parameter-efficient fine-tuning |
| PEFT | Parameter-Efficient Fine-Tuning family |
| RAG | Retrieval-Augmented Generation |
| BPE | Byte-Pair Encoding tokenization |

---

## Section 2 — Task-Appropriate Metrics

Text Classification:
  Macro F1 (imbalanced datasets — required over Accuracy)
  Weighted F1, Accuracy (balanced only)

NER: Entity-level F1 (exact span match), per-type breakdown

MT: BLEU, chrF, COMET (preferred at Q1)

Summarization: ROUGE-1, ROUGE-2, ROUGE-L, BERTScore

Generation: Perplexity, Human eval with inter-annotator agreement (Cohen's kappa)

---

## Section 3 — Chapter 3 Checklist

- [ ] Dataset name, version, citation
- [ ] Task definition
- [ ] Train/dev/test counts
- [ ] Label distribution
- [ ] Language(s)
- [ ] Tokenizer name + vocabulary size
- [ ] Max sequence length
- [ ] Pre-trained model: name, version, HuggingFace ID
- [ ] Hyperparameters: LR, batch, epochs, warmup steps

---

## Section 4 — Canonical References

- Vaswani, A., et al. (2017). Attention is all you need. NeurIPS.
- Devlin, J., et al. (2019). BERT. NAACL-HLT.
- Brown, T., et al. (2020). GPT-3. NeurIPS.
- Hu, E.J., et al. (2022). LoRA. ICLR.

---

## Section 5 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "model understands text" | "achieves [metric] on [benchmark]" |
| "state-of-the-art" | "surpasses [model] by X points on [benchmark]" |
| "We use BERT" | "BERT-base-uncased (Devlin et al., 2019) was employed as encoder" |

---

## Error Handling

Metric mismatches task:
-> Flag: "[METRIC MISMATCH — use [correct metric] for [task]]"

Model not cited:
-> Flag: "[MODEL NOT CITED — specify name, version, HuggingFace ID or DOI]"
