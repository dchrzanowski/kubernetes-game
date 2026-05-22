#!/usr/bin/env bash
# Level 2 passes when webapp-svc has at least one ready endpoint

NS="level-2"
ENDPOINTS=$(kubectl get endpoints webapp-svc -n "$NS" \
  --no-headers 2>/dev/null | awk '{print $2}')

# Endpoints column is "<none>" when no pods are matched
[[ -n "$ENDPOINTS" && "$ENDPOINTS" != "<none>" ]]
