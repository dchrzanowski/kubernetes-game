#!/usr/bin/env bash
# Level 1 passes when the frontend deployment has at least 1 ready replica

NS="level-1"
READY=$(kubectl get deployment frontend -n "$NS" \
  -o jsonpath='{.status.readyReplicas}' 2>/dev/null)

[[ "${READY:-0}" -ge 1 ]]
