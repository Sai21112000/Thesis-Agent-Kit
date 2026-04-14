#!/bin/bash
# snapshot.sh — CLI Snapshot Tool
# Usage: bash scripts/snapshot.sh <source-file> <label>
# Creates a timestamped copy in .snapshots/ and appends to SNAPSHOT-INDEX.md

SOURCE=$1
LABEL=$2

if [ -z "$SOURCE" ] || [ -z "$LABEL" ]; then
  echo "Usage: bash scripts/snapshot.sh <source-file> <label>"
  echo "Example: bash scripts/snapshot.sh PROJECT-CONFIG.md initial-draft"
  exit 1
fi

if [ ! -f "$SOURCE" ]; then
  echo "ERROR: File '$SOURCE' not found."
  exit 1
fi

SNAP_DIR=".snapshots"
INDEX="$SNAP_DIR/SNAPSHOT-INDEX.md"

mkdir -p "$SNAP_DIR"

if [ ! -f "$INDEX" ]; then
  cat > "$INDEX" << 'HEADER'
# SNAPSHOT-INDEX — Version History Ledger
# Append-only log. Each snapshot adds one row.

| Timestamp | Source File | Label | Trigger | Restore Command |
|-----------|------------|-------|---------|-----------------|
HEADER
fi

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
DISPLAY_TS=$(date +"%Y-%m-%d %H:%M")
BASENAME=$(basename "$SOURCE" | sed 's/\.[^.]*$//')
SNAP_FILE="${TIMESTAMP}__${BASENAME}__${LABEL}.md"

cp "$SOURCE" "$SNAP_DIR/$SNAP_FILE"

echo "| $DISPLAY_TS | $SOURCE | $LABEL | /snapshot (CLI) | /restore $TIMESTAMP |" >> "$INDEX"

echo ""
echo "SNAPSHOT SAVED"
echo "File:     $SOURCE"
echo "Snapshot: $SNAP_DIR/$SNAP_FILE"
echo "Label:    $LABEL"
echo "Restore:  /restore $TIMESTAMP"
