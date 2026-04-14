---
name: restore
description: Activate with /restore to roll back any file to a previous snapshot state — always saves a safety snapshot of the current state before overwriting, then copies the selected snapshot back to the source path.
version: 1.0.0
command: /restore
allowed-tools: Read,Write,Glob,Bash
---

# /restore Workflow

Rollback any file to a previously saved snapshot.

---

## Step 0 — Prerequisites

CHECK 1: `.snapshots/SNAPSHOT-INDEX.md` exists and has entries?
  FAIL -> STOP: "No snapshots exist yet. Use /snapshot to create one first."

CHECK 2: Target specified (timestamp, label, or filename)?
  FAIL -> ASK: "Which snapshot to restore? Provide timestamp, label, or filename.
  Type /history [file] to see available snapshots."

---

## Step 1 — Find Snapshot

1. Read `.snapshots/SNAPSHOT-INDEX.md`
2. Match by timestamp (exact or closest), label (partial match), or filename
3. If multiple matches -> display table and ASK user to select by number
4. If zero matches -> STOP: "No snapshot matches '[query]'. Run /history to see options."

---

## Step 2 — Safety Snapshot (NON-NEGOTIABLE)

Before overwriting, save current state:
1. Read current content of the target source file
2. Create safety snapshot with label `pre-restore`
3. Append safety snapshot row to SNAPSHOT-INDEX.md

This ensures no state is ever permanently lost.

---

## Step 3 — Restore

1. Read selected snapshot file from `.snapshots/`
2. Write content to original source path (overwrite)
3. Append restore event to SNAPSHOT-INDEX.md with trigger `/restore`

---

## Step 4 — Confirm

Output:
```
RESTORED
Source:         [original file path]
Restored from:  .snapshots/[snapshot-filename]
Snapshot date:  [timestamp]
Safety backup:  .snapshots/[safety-snapshot-filename]
```

---

## Fallback Behavior

Source file no longer exists -> Create it with snapshot content; warn user.
Snapshot file corrupted/empty -> STOP: "Snapshot file is empty. Cannot restore."
Ambiguous natural language (e.g., "yesterday morning") -> Resolve to closest timestamp, confirm with user before proceeding.
