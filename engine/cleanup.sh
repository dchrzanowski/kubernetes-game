#!/usr/bin/env bash
# cleanup.sh — delete all level namespaces

for i in 1 2 3 4; do
  kubectl delete namespace "level-${i}" --ignore-not-found=true
done
