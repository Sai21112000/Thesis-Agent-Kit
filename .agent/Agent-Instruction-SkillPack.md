# Agent-Instruction-SkillPack.md — QA Constitution
# Every skill file must pass this checklist (T6 Audit).

## 1. Frontmatter (MANDATORY)
name: kebab-case, matches filename
description: ONE sentence, action verb, 10-30 words
version: 1.0.0
allowed-tools: comma-separated, least-privilege

## 2. Required Structure (in order)
1. H1 title (matches name field)
2. Purpose paragraph
3. ## Overview (what/when/what NOT to use)
4. ## Prerequisites
5. ## Instructions (imperative-verb steps)
6. ## Output Format
7. ## Error Handling (MANDATORY, non-trivial)

## 3. Instruction Language
- Steps: imperative — "Read...", "Analyze...", "Flag..."
- NEVER: "You should...", "It is recommended..."
- Atomic steps: one action per step
- No first-person in instruction prose

## 4. Domain Modules (`.agent/domains/[domain]/`) — QA Requirements
Each domain module lives under `.agent/domains/<name>/` as one or more `domain-*.md` files.
- Frontmatter MUST include: `name`, `domain` (folder name), `description`, `version`, `allowed-tools`
- Minimum 5 substantive sections (terminology, metrics, checklists, tables, or refs)
- Terminology bank with 10+ entries
- Evaluation metrics with formulas (or explicit qualitative criteria)
- 5+ canonical references (verified)
- Forbidden phrases table
- Error Handling section with domain-specific BLOCK/FLAG rules
- New domains: copy `.agent/domains/_template/domain-template.md` and fill all `[FILL]` placeholders

## 5. Domain Skills (legacy label — same as Section 4)
For historical T2 audits, same checklist as Section 4 applies to migrated domain files.

## 6. Support Skills (T3) Requirements
- literature-review: PRISMA flow logic
- latex-formatting: AIT template rules
- citation-checker: 5-step chain

## 7. Workflow Files (T4) Requirements
- command: /workflow-name defined
- Step-by-step execution logic
- Success criteria defined
- Fallback behavior defined
- Skills referenced

## 8. T6 Audit Checklist
Frontmatter: name/description/version/allowed-tools
Structure: H1/Overview/Prerequisites/Error Handling
Laws: no first-person, no "you should", imperative verbs
Domain: 5+sections, 10+terms, formulas, refs
Workflow: command/steps/success/fallback/skill-refs
