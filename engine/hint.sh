#!/usr/bin/env bash
# hint.sh — show a hint after 60 seconds in the background
# Usage: hint.sh <level_number>
# Prints the PID so the caller can kill it on level completion.

LEVEL="$1"
HINT_FILE="$(dirname "$0")/../levels/level-${LEVEL}/hint.txt"

(
  sleep 60
  echo ""
  echo -e "\033[1;33m  💡 HINT: $(cat "$HINT_FILE")\033[0m"
  echo ""
) &

echo $!  # return background PID to caller
