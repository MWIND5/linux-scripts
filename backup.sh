#!/usr/bin/env bash
set -euo pipefail

SRC="${1:?usage: backup.sh <src> <dst>}"
DST="${2:?}"
KEEP=7
TS=$(date +%Y%m%d_%H%M%S)
ARCHIVE="${DST}/backup_${TS}.tar.gz"

mkdir -p "$DST"
tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$(basename "$SRC")" 2>/dev/null
SIZE=$(du -h "$ARCHIVE" | cut -f1)
echo "created: $ARCHIVE ($SIZE)"

ls -1t "${DST}"/backup_*.tar.gz | tail -n +$((KEEP+1)) | xargs -r rm