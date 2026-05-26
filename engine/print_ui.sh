#!/usr/bin/env bash
# print_ui.sh — terminal UI helpers

RED='\033[0;31m'
DARK_RED='\033[2;31m'
YELLOW='\033[0;33m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'

print_banner() {
  echo -e "${RED}${BOLD}"
  echo "  ██████╗ ███████╗ █████╗ ██████╗  ██████╗██╗     ██╗   ██╗███████╗████████╗███████╗██████╗ "
  echo "  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██║     ██║   ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗"
  echo "  ██║  ██║█████╗  ███████║██║  ██║██║     ██║     ██║   ██║███████╗   ██║   █████╗  ██████╔╝"
  echo "  ██║  ██║██╔══╝  ██╔══██║██║  ██║██║     ██║     ██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗"
  echo "  ██████╔╝███████╗██║  ██║██████╔╝╚██████╗███████╗╚██████╔╝███████║   ██║   ███████╗██║  ██║"
  echo "  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
  echo -e "${DIM}${RED}                    a forensic investigation${RESET}"
  echo ""
}

print_briefing() {
  local level="$1" file="$2"
  echo -e "${DARK_RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo -e "${BOLD}  CASE ${level}${RESET}"
  echo -e "${DARK_RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo ""
  cat "$file"
  echo ""
  echo -e "${DARK_RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo ""
}

print_win() {
  echo -e "${YELLOW}${BOLD}  ✓ Case $1 closed. Evidence secured.${RESET}\n"
}

print_hint() {
  echo -e "${DIM}  $(cat "$1")${RESET}"
}

print_game_over() {
  echo -e "${RED}${BOLD}"
  echo "  ╔══════════════════════════════════════════╗"
  echo "  ║  CLUSTER STABLE. ALL CASES CLOSED.       ║"
  echo "  ║                                          ║"
  echo "  ║  The engineers were never found.         ║"
  echo "  ╚══════════════════════════════════════════╝"
  echo -e "${RESET}"
}

print_error() {
  echo -e "${RED}  ✗ $1${RESET}"
}
