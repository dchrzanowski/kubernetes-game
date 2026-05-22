#!/usr/bin/env bash
# score.sh — record level times and print final summary
# Usage:
#   score.sh start <level>   — record start time
#   score.sh end <level>     — record end time
#   score.sh summary         — print all times

SCORE_DIR="/tmp/clusterquest_scores"
mkdir -p "$SCORE_DIR"

case "$1" in
  start)
    date +%s > "${SCORE_DIR}/level_${2}_start"
    ;;
  end)
    start=$(cat "${SCORE_DIR}/level_${2}_start")
    end=$(date +%s)
    echo $((end - start)) > "${SCORE_DIR}/level_${2}_time"
    ;;
  summary)
    echo ""
    echo -e "\033[1m  ── SCORE SUMMARY ──\033[0m"
    total=0
    for i in 1 2 3 4; do
      f="${SCORE_DIR}/level_${i}_time"
      if [[ -f "$f" ]]; then
        t=$(cat "$f")
        total=$((total + t))
        printf "  Level %d: %dm %ds\n" "$i" $((t/60)) $((t%60))
      fi
    done
    printf "  Total:   %dm %ds\n" $((total/60)) $((total%60))
    echo ""
    ;;
esac
