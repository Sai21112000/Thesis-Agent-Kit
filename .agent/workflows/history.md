---
name: history
description: Activate with /history to display a chronological list of all snapshots for a specific file — reads SNAPSHOT-INDEX.md and filters by filename, offering restore options for any entry.
version: 1.0.0
command: /history
allowed-tools: Read,Glob
---

# /history Workflow

Browse snapshot history for any file.

---

## Step 0 — Prerequisites

CHECK 1: `.snapshots/SNAPSHOT-INDEX.md` exists?
  FAIL -> STOP: "No snapshot history exists. Use /snapshot to create one first."

CHECK 2: Filename specified?
  FAIL -> Show summary of ALL files with snapshot counts, then ASK which to inspect.

---

## Step 1 — Filter Index

1. Read `.snapshots/SNAPSHOT-INDEX.md`
2. Filter rows matching the requested filename (partial match accepted)
3. Sort chronologically (oldest first)

---

## Step 2 — Display History

Output:
```
HISTORY: [filename] ([N] snapshots)

| #  | Timestamp        | Label          | Trigger         |
|----|------------------|----------------|-----------------|
| 1  | 2026-03-29 14:22 | first-draft    | /write-chapter  |
| 2  | 2026-03-29 16:45 | after-review   | /review-draft   |
| 3  | 2026-03-30 09:11 | advisor-revised| /snapshot        |
```

---

## Step 3 — Offer Actions

"Enter # to restore that version, [D #1 #2] to diff two versions, or [C] to cancel."

If user selects restore -> hand off to /restore workflow.
If user selects diff -> read both snapshot files, display side-by-side comparison.

---

## Fallback Behavior

No snapshots for file -> "No snapshots found for [filename]. Use /snapshot to create one."
Only one snapshot -> Display it; disable diff option.
