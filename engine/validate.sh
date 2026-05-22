#!/usr/bin/env bash
# validate.sh — poll a level's own validate.sh until it passes or times out
# Usage: validate.sh <level_number>

LEVEL="$1"
LEVEL_VALIDATE="$(dirname "$0")/../levels/level-${LEVEL}/validate.sh"
POLL_INTERVAL=5
TIMEOUT=300  # 5 minutes max per level
elapsed=0

while true; do
  if bash "$LEVEL_VALIDATE"; then
    exit 0
  fi
  sleep "$POLL_INTERVAL"
  elapsed=$((elapsed + POLL_INTERVAL))
  if [[ $elapsed -ge $TIMEOUT ]]; then
    echo "Timed out waiting for level ${LEVEL} to complete."
    exit 1
  fi
done
