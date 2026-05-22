#!/usr/bin/env bash
# load_level.sh — create namespace and apply manifests for a level
# Usage: load_level.sh <level_number>

set -e
LEVEL="$1"
NS="level-${LEVEL}"
MANIFESTS_DIR="$(dirname "$0")/../levels/level-${LEVEL}/manifests"

kubectl create namespace "$NS" --dry-run=client -o yaml | kubectl apply -f -

if [[ "$LEVEL" == "4" ]]; then
  # Seed a good revision first so rollout undo has a target
  kubectl apply -f "${MANIFESTS_DIR}/deployment-good.yaml" -n "$NS"
  kubectl rollout status deployment/backend -n "$NS" --timeout=60s
  # Now apply the bad release
  kubectl apply -f "${MANIFESTS_DIR}/deployment.yaml" -n "$NS"
else
  kubectl apply -f "$MANIFESTS_DIR" -n "$NS"
fi
