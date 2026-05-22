#!/usr/bin/env bash
# Level 4 passes when:
# 1. The current pod template is NOT the bad image (player has fixed it)
# 2. All desired replicas are ready

NS="level-4"
BAD_IMAGE="nginx:this-tag-does-not-exist"

CURRENT_IMAGE=$(kubectl get deployment backend -n "$NS" \
  -o jsonpath='{.spec.template.spec.containers[0].image}' 2>/dev/null)

READY=$(kubectl get deployment backend -n "$NS" \
  -o jsonpath='{.status.readyReplicas}' 2>/dev/null)

DESIRED=$(kubectl get deployment backend -n "$NS" \
  -o jsonpath='{.spec.replicas}' 2>/dev/null)

# Fail if the bad image is still in the spec
[[ "$CURRENT_IMAGE" == "$BAD_IMAGE" ]] && exit 1

# Pass when all replicas are ready
[[ "${READY:-0}" -ge 1 && "${READY}" == "${DESIRED}" ]]
