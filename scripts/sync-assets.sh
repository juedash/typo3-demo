#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

PL_STYLEGUIDE="$ROOT/apps/patternlab/public/styleguide"
TYPO3_ASSETS="$ROOT/apps/typo3/public/assets"

mkdir -p "$TYPO3_ASSETS"

for dir in css js fonts; do
  if [ -d "$PL_STYLEGUIDE/$dir" ]; then
    rsync -av --delete "$PL_STYLEGUIDE/$dir/" "$TYPO3_ASSETS/$dir/"
    echo "✅ Synced $dir"
  else
    echo "ℹ️ Skipped $dir (not found)"
  fi
done

