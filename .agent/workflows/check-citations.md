---
name: check-citations
description: Activate with /check-citations to verify a reference list through the 5-step CrossRef verification chain — produces verdict cards per citation, flags fabricated DOIs and retracted papers, and delivers a summary with required actions.
version: 2.0.0
command: /check-citations
allowed-tools: Bash,Read
---

# /check-citations Workflow

Citation firewall orchestrator. Runs citation-checker skill per reference.

---

## Step 1 — Parse Input

Extract: authors, year, title, DOI, journal per citation.

If DOI missing, search CrossRef by title:
curl -s "https://api.crossref.org/works?query=[TITLE]&rows=3"

---

## Step 2 — Run 5-Step Chain

Invoke citation-checker skill for each citation (Steps 1-5).

---

## Step 3 — Summary Report

Total: [N] | Verified: [n1] | Flagged: [n2] | Fabricated: [n3]
Action: Remove [n3] fabricated. Resolve [n2] flagged.
Submission blocked until 0 fabricated remain.

---

## Step 4 — Fabricated Protocol

For each FABRICATED:
1. "This citation does not exist. Remove it."
2. "Describe the claim — I will find a verified replacement."
3. Log to FABRICATED-CITATIONS.md

---

## Fallback Behavior

CrossRef down -> manual verification instructions per citation.
No DOIs -> run title search for all before chain.
