# Level 2 Solution — "The Website Is Down"

## Problem
The `webapp-svc` Service has selector `app: web-app`, but the pods have label `app: webapp`.
The mismatch means the Service has no endpoints and routes no traffic.

## How to diagnose
```bash
kubectl get endpoints webapp-svc -n level-2        # shows <none>
kubectl describe svc webapp-svc -n level-2         # Selector: app=web-app
kubectl get pods --show-labels -n level-2          # Labels: app=webapp
```

## Fix
```bash
kubectl patch svc webapp-svc -n level-2 \
  -p '{"spec":{"selector":{"app":"webapp"}}}'
```

Or edit directly:
```bash
kubectl edit svc webapp-svc -n level-2
# Change: app: web-app  →  app: webapp
```

## What you learned
- How Services use label selectors to route traffic to pods
- How to diagnose missing endpoints
- How to patch a live resource
