---
name: citation-checker
description: Activate to verify cited references are real, DOI-resolvable, non-retracted, and Q1/Q2-indexed — runs a 5-step CrossRef verification chain per citation and produces VERIFIED, FLAGGED, or FABRICATED verdicts with a summary report.
version: 1.0.0
allowed-tools: Bash,Read
---

# Citation Checker Skill

Anti-hallucination firewall for the bibliography. Deterministic 5-step verification chain per citation.

---

## Overview

**Invoke when**: /check-citations triggered or reference list needs verification.
**Agent type**: Reactive — no planning, deterministic pipeline.

---

## 5-Step Verification Chain

### Step 1 — DOI Resolution

curl -sI "https://doi.org/[DOI]" | grep -i "location:"

PASS: redirects to publisher page
FAIL: 404 or loops to doi.org -> FABRICATED

### Step 2 — CrossRef Metadata

curl -s "https://api.crossref.org/works/[DOI]" | python3 -c "
import json,sys
d=json.load(sys.stdin)['message']
print('Title:', d.get('title',['NOT FOUND'])[0])
print('Authors:', [a.get('family','?') for a in d.get('author',[])])
print('Year:', d.get('published',{}).get('date-parts',[[None]])[0][0])
"

PASS: title+authors+year match
FAIL: DOI exists but wrong paper -> FABRICATED

### Step 3 — Google Scholar Check

Instruct user: Search exact title in quotes.
Zero results -> paper likely does not exist.

### Step 4 — Retraction Check

curl -s "https://api.crossref.org/works/[DOI]" | python3 -c "
import json,sys
d=json.load(sys.stdin)['message']
print('Updates:', d.get('update-to',[]) or 'None')
"

Also: search [author] [year] retraction on retractionwatch.com

### Step 5 — Quality + Recency

Scopus: https://www.scopus.com/sources
WoS: https://mjl.clarivate.com/
Year < (current-5): flag as [OLDER THAN 5 YEARS — justify or replace]
Not indexed: flag as [POTENTIAL PREDATORY JOURNAL]

---

## Output Format

For each citation:

CITATION: Author et al. (Year)
Step 1 — DOI:      PASS/FAIL
Step 2 — CrossRef: PASS/FAIL
Step 3 — Scholar:  PASS/FAIL
Step 4 — Retract:  PASS/WARN
Step 5 — Quality:  PASS/WARN
VERDICT: VERIFIED / FLAGGED / FABRICATED

Summary:
Total: [N] | Verified: [n1] | Flagged: [n2] | Fabricated: [n3]

---

## Error Handling

CrossRef unavailable:
-> "Manual check: open doi.org/[DOI] in browser. Confirm title, authors, year."

No DOIs provided:
-> Run CrossRef title search for all before starting chain.
Log fabricated citations to FABRICATED-CITATIONS.md.
