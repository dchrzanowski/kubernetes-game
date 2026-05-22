# Level 1 Solution — "Where Are My Pods?"

## Problem
The `frontend` deployment is missing the `DATABASE_URL` environment variable.
The container exits immediately with `ERROR: DATABASE_URL missing`, causing CrashLoopBackOff.

## How to diagnose
```bash
kubectl get pods -n level-1
kubectl logs <pod-name> -n level-1
```

## Fix
```bash
kubectl set env deployment/frontend DATABASE_URL=postgres://db:5432/app -n level-1
```

Or edit the deployment directly:
```bash
kubectl edit deployment frontend -n level-1
# Add under spec.template.spec.containers[0].env:
# - name: DATABASE_URL
#   value: "postgres://db:5432/app"
```

## What you learned
- How to read pod logs to diagnose failures
- How to add environment variables to a running deployment
