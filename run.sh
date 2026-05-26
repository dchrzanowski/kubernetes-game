#!/usr/bin/env bash
# run.sh — ClusterQuest entry point

set -e
GAME_DIR="$(cd "$(dirname "$0")" && pwd)"
ENGINE="${GAME_DIR}/engine"

source "${ENGINE}/print_ui.sh"

trap "${ENGINE}/cleanup.sh" EXIT

print_banner
echo "  Checking prerequisites..."
if ! command -v kubectl &>/dev/null; then
  print_error "kubectl not found. Please install it first."
  exit 1
fi
if ! kubectl cluster-info &>/dev/null; then
  print_error "No cluster reachable. Start Minikube: minikube start"
  exit 1
fi
echo ""
echo -e "${YELLOW}${BOLD}  ⚠  IMPORTANT: Open a second terminal to run kubectl commands.${RESET}"
echo -e "${YELLOW}     This terminal will show mission briefings and detect when you${RESET}"
echo -e "${YELLOW}     complete each level. Do NOT type kubectl here.${RESET}"
echo ""
echo "  Press ENTER to begin..."
read -r
echo "  Loading required images into Minikube..."
IMAGES=("nginx:latest" "busybox:latest")
for img in "${IMAGES[@]}"; do
  echo -n "    $img ... "
  if ! docker image inspect "$img" &>/dev/null; then
    echo -n "pulling on host ... "
    if ! docker pull "$img" &>/dev/null; then
      print_error "Failed to pull $img on host. Check your internet connection."
      exit 1
    fi
  fi
  if minikube image load "$img" &>/dev/null; then
    echo -e "${GREEN}OK${RESET}"
  else
    print_error "Failed to load $img into Minikube."
    exit 1
  fi
done
echo "  Images ready."
echo ""
sleep 1

run_level() {
  local level="$1"

  print_briefing "$level" "${GAME_DIR}/levels/level-${level}/briefing.txt"

  bash "${ENGINE}/load_level.sh" "$level"

  # Start hint timer in background
  (
    sleep 120
    echo -e "\033[1;33m\n  💡 HINT: $(cat "${GAME_DIR}/levels/level-${level}/hint.txt")\n\033[0m"
  ) &
  HINT_PID=$!

  bash "${ENGINE}/score.sh" start "$level"
  bash "${ENGINE}/validate.sh" "$level"
  bash "${ENGINE}/score.sh" end "$level"

  kill "$HINT_PID" 2>/dev/null || true
  wait "$HINT_PID" 2>/dev/null || true

  print_win "$level"
  sleep 1
}

for level in 1 2 3 4; do
  run_level "$level"
done

print_game_over
bash "${ENGINE}/score.sh" summary
