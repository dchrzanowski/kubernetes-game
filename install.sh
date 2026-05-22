#!/usr/bin/env bash
# ClusterQuest installer
# Usage: curl -sSL https://raw.githubusercontent.com/dchrzanowski/kubernetes-game/refs/heads/master/install.sh | bash

set -e

REPO="dchrzanowski/kubernetes-game"
GAME_DIR="${PWD}/clusterquest"

for cmd in git kubectl minikube docker; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: '$cmd' is required but not installed." >&2
    exit 1
  fi
done

git clone "https://github.com/${REPO}.git" "$GAME_DIR"
chmod +x "${GAME_DIR}/run.sh"
chmod +x "${GAME_DIR}/engine/"*.sh
chmod +x "${GAME_DIR}/levels/"*/validate.sh

cd kubernetes-game

echo ""
echo "Done! Start the game with:"
echo "  ./run.sh"
