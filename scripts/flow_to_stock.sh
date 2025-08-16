#!/usr/bin/env bash
# flow_to_stock.sh - Flow から Stock へドラフトを確定版として反映するスクリプト
# Usage: flow_to_stock.sh SOURCE_FILE TARGET_FILE
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 SOURCE_FILE TARGET_FILE" >&2
  exit 1
fi

SRC="$1"
DEST="$2"

if [ ! -f "$SRC" ]; then
  echo "Source file not found: $SRC" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"

if [ -f "$DEST" ] && cmp -s "$SRC" "$DEST"; then
  echo "No update needed for $DEST"
else
  cp "$SRC" "$DEST"
  echo "Updated $DEST"
fi

# オリジナルファイルは残したい場合もあるため削除しない
