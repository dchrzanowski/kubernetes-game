#!/usr/bin/env bash
# print_ui.sh — terminal UI helpers

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

print_banner() {
  echo -e "${CYAN}${BOLD}"
  echo "   ██████╗██╗     ██╗   ██╗███████╗████████╗███████╗██████╗ "
  echo "  ██╔════╝██║     ██║   ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗"
  echo "  ██║     ██║     ██║   ██║███████╗   ██║   █████╗  ██████╔╝"
  echo "  ██║     ██║     ██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗"
  echo "  ╚██████╗███████╗╚██████╔╝███████║   ██║   ███████╗██║  ██║"
  echo "   ╚═════╝╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
  echo -e "               ${YELLOW}Q U E S T${RESET}"
  echo ""
}

print_briefing() {
  local level="$1" file="$2"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo -e "${BOLD}  LEVEL ${level}${RESET}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo ""
  cat "$file"
  echo ""
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo ""
}

print_win() {
  echo -e "${GREEN}${BOLD}  ✓ Level $1 complete!${RESET}\n"
}

print_hint() {
  echo -e "${YELLOW}  💡 HINT: $(cat "$1")${RESET}"
}

print_game_over() {
  echo -e "${GREEN}${BOLD}"
  echo "  ╔══════════════════════════════════╗"
  echo "  ║  CLUSTER RESTORED. MISSION       ║"
  echo "  ║  COMPLETE. WELL DONE, SRE.       ║"
  echo "  ╚══════════════════════════════════╝"
  echo -e "${RESET}"
}

print_error() {
  echo -e "${RED}  ✗ $1${RESET}"
}
