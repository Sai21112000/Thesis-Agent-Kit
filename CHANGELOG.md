# CHANGELOG

## [2.1.0] — 2026-04-15

### Renamed: Thesis Agent Kit
- Pack renamed from "Universal Research Skill Pack" to **Thesis Agent Kit** across all files

### Research Interrogator skill (`/interview`)
- `.agent/skills/research-interrogator.md`: adversarial onboarding, per-section 0-100% scoring, weighted aggregate confidence, 90%+ gate, Pass/Weak/Fail per section
- `.cursorrules`, `.windsurfrules`: `/interview` command
- `.agent/workflows/write-chapter.md`: Step 0 now references `/interview` for empty configs
- `custom-gpt/KNOWLEDGE-BASE.md`: `@research-interrogator` agent + `/interview` command

### Figure generation skill (`/figures`)
- `.agent/skills/figure-generation.md`: code-first vs imagery decision tree, RESULTS/ traceability, light QA, domain loading
- `.cursorrules`, `.windsurfrules`: `/figures` command and on-demand loading note

### README redesign
- Full rewrite with hero banner, badges, emoji structure, architecture diagrams, FAQ, installation options
- `docs/hero-banner.png`: generated project banner

### Skill count: 8 → 9

## [2.0.0] — 2026-03-29

### T7 — Snapshot System
- `.snapshots/SNAPSHOT-INDEX.md`: append-only version ledger
- `.agent/skills/snapshot-manager.md`: snapshot/restore/history/diff rules
- `.agent/workflows/snapshot.md`, `restore.md`, `history.md`
- `scripts/snapshot.sh`: CLI snapshot helper

### T8 — Universal Research Scaffold
- `.agent/CORE-LAWS.md`, `CORE-STRUCTURE.md`, `CORE-QA.md`: domain-agnostic core
- `PROJECT-CONFIG.md`: single config (replaces RQ-SKELETON + WORKSPACE-MAPPER)
- `.agent/skills/research-writer.md`, `research-advisor.md`, `research-reviewer.md`
- `.agent/domains/`: computer-vision (cv+gis), nlp, rl, biomedical, social-science, `_template/`
- `examples/sample-PROJECT-CONFIG.md`
- Workflows updated for PROJECT-CONFIG, CORE-* files, domain loading, snapshot triggers
- Removed v1.0 skills and legacy prompts (see git history if needed)

## [1.0.0] — 2026-03-29

### T1 — Foundation
- thesis-writing.md: 6 Laws, 5-chapter rules, T-C-E-L
- thesis-advisor.md: BDI orchestrator, 5 lifecycle stages
- Agent-Instruction-SkillPack.md: QA Constitution
- prompts/RQ-SKELETON.md: research architecture template
- prompts/WORKSPACE-MAPPER.md: anti-hallucination data grounding
- examples/sample-RQ-SKELETON.md: oil palm detection example
- .cursorrules, .windsurfrules: IDE auto-load

### T2 — Domain Skills
- thesis-cv.md: YOLO, SAM, detection, segmentation, mAP metrics
- thesis-gis.md: UAV, GSD, remote sensing, CRS
- thesis-rl.md: policy optimization, reward design, seed evaluation
- thesis-nlp.md: transformers, macro F1, BLEU, ROUGE

### T3 — Support Skills
- literature-review.md: PRISMA, thematic synthesis, gap formula
- latex-formatting.md: AIT template, booktabs, biber
- citation-checker.md: 5-step CrossRef chain

### T4 — Workflows
- write-chapter.md: /write-chapter orchestrator
- review-draft.md: /review-draft adversarial critique
- check-citations.md: /check-citations firewall

### T5 — Documentation
- README.md, FIRST-TIMERS-GUIDE.md, CHANGELOG.md, LICENSE
- custom-gpt/KNOWLEDGE-BASE.md: ChatGPT/Claude web KB
- scripts/verify-citations.sh: CLI DOI helper

## [Planned — 1.1.0]
- defense-prep.md: viva preparation + examiner simulation
- abstract-writer.md: 250-word structured abstract skill
- MCP tool integration for automated CrossRef calls
