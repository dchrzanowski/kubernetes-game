#!/usr/bin/env bash
# Level 3 passes when api-server has >= 3 ready replicas

NS="level-3"
READY=$(kubectl get deployment api-server -n "$NS" \
  -o jsonpath='{.status.readyReplicas}' 2>/dev/null)

[[ "${READY:-0}" -ge 3 ]]
