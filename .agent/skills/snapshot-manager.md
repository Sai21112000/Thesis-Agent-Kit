---
name: snapshot-manager
description: Activate to save, restore, and browse timestamped file snapshots — provides append-only version history without Git, enabling rollback to any previous state of any project file.
version: 1.0.0
allowed-tools: Read,Write,Glob,Bash
---

# Snapshot Manager Skill

Append-only, human-readable version history for every project file. Lighter than Git — no diffs, no branches — but full "time travel" to any previous state.

---

## Overview

**Invoke when**: saving a snapshot, restoring a previous version, browsing file history, or comparing two versions.
**Do not invoke for**: drafting (research-writer), critique (research-reviewer), citations (citation-checker).

---

## Prerequisites

1. `.snapshots/` directory exists at project root
2. `.snapshots/SNAPSHOT-INDEX.md` exists with header row

---

## Section 1 — Trigger Events

A snapshot is created **before AND after**:
- Any `/write-chapter` session (saves the chapter file)
- Any `/review-draft` session that produces revisions
- Any PROJECT-CONFIG.md modification
- Any manual `/snapshot` command
- Any `/restore` command (safety: snapshot current state before overwriting)

---

## Section 2 — Filename Convention

```
YYYY-MM-DD_HH-MM-SS__[filename-without-ext]__[label].md
```

Rules:
- Timestamp: UTC or local, zero-padded, 24-hour clock
- Filename: source filename without extension, hyphens replace spaces
- Label: kebab-case, 2-5 words describing the state
- Extension: always `.md` regardless of source type

Examples:
- `2026-03-29_14-22-31__chapter1__first-draft.md`
- `2026-03-29_16-45-00__PROJECT-CONFIG__advisor-revised.md`
- `2026-03-30_09-11-15__chapter2__after-review.md`

---

## Section 3 — Snapshot Creation Protocol

Step 1 — Determine source file path and label
Step 2 — Generate timestamp: `date +%Y-%m-%d_%H-%M-%S`
Step 3 — Build snapshot filename from convention
Step 4 — Copy source file content to `.snapshots/[snapshot-filename]`
Step 5 — Append one row to `.snapshots/SNAPSHOT-INDEX.md`:

```
| YYYY-MM-DD HH:MM | source-file.md | label | trigger-command | /restore YYYY-MM-DD_HH-MM-SS |
```

Step 6 — Confirm: "Snapshot saved: [filename] -> .snapshots/[snapshot-filename]"

---

## Section 4 — Restore Protocol

Step 1 — Read `.snapshots/SNAPSHOT-INDEX.md`
Step 2 — Match by timestamp, label, or filename (fuzzy: "yesterday morning" resolves to closest match)
Step 3 — **Safety snapshot**: save current state of the target file before overwriting (label: `pre-restore`)
Step 4 — Copy snapshot content back to original source path
Step 5 — Append restore event to SNAPSHOT-INDEX.md
Step 6 — Confirm: "Restored [source] from [snapshot-timestamp]. Previous state saved as [safety-snapshot]."

---

## Section 5 — History Query Protocol

Step 1 — Read `.snapshots/SNAPSHOT-INDEX.md`
Step 2 — Filter rows matching the requested filename
Step 3 — Display chronological table:

```
HISTORY: [filename]
| # | Timestamp | Label | Trigger |
|---|-----------|-------|---------|
| 1 | ...       | ...   | ...     |
```

Step 4 — Offer: "Enter # to restore, or [C] to cancel."

---

## Section 6 — Diff Protocol

Step 1 — Read two snapshot files by timestamp or label
Step 2 — Display side-by-side comparison (added/removed/changed lines)
Step 3 — Summarize: "[N] lines added, [M] lines removed, [K] lines changed."

---

## Output Format

All snapshot operations produce structured confirmation:
- Action performed (SNAPSHOT / RESTORE / HISTORY / DIFF)
- Source file path
- Snapshot filename or comparison targets
- Row appended to SNAPSHOT-INDEX.md (for write operations)

---

## Error Handling

`.snapshots/` directory missing:
-> Create it: `mkdir -p .snapshots`
-> Create SNAPSHOT-INDEX.md with header row

Source file does not exist:
-> STOP: "Source file [path] not found. Verify path and retry."

No snapshots found for file:
-> "No snapshots exist for [filename]. Use /snapshot to create the first one."

Ambiguous restore target:
-> Display matching rows and ask user to select by number.
