---
name: snapshot
description: Activate with /snapshot to manually save a timestamped copy of any project file to .snapshots/ with a custom label — appends one row to SNAPSHOT-INDEX.md for full traceability.
version: 1.0.0
command: /snapshot
allowed-tools: Read,Write,Glob,Bash
---

# /snapshot Workflow

Manual snapshot trigger. Saves a timestamped copy of any file.

---

## Step 0 — Prerequisites

CHECK 1: `.snapshots/` directory exists?
  FAIL -> Create it and initialize SNAPSHOT-INDEX.md

CHECK 2: Source file specified?
  FAIL -> ASK: "Which file to snapshot? Provide path relative to project root."

CHECK 3: Label specified?
  FAIL -> ASK: "Provide a short label (2-5 words, kebab-case). Example: first-draft, after-review"

---

## Step 1 — Generate Snapshot

1. Read source file content
2. Generate timestamp: `date +%Y-%m-%d_%H-%M-%S`
3. Build filename: `{timestamp}__{source-name-without-ext}__{label}.md`
4. Write content to `.snapshots/{filename}`

---

## Step 2 — Update Index

Append one row to `.snapshots/SNAPSHOT-INDEX.md`:

```
| YYYY-MM-DD HH:MM | source-file | label | /snapshot | /restore YYYY-MM-DD_HH-MM-SS |
```

---

## Step 3 — Confirm

Output:
```
SNAPSHOT SAVED
File:     [source path]
Snapshot: .snapshots/[filename]
Label:    [label]
Restore:  /restore [timestamp]
```

---

## Fallback Behavior

Source file empty -> Warn: "File is empty. Snapshot saved but contains no content."
Label contains spaces -> Auto-convert to kebab-case.
