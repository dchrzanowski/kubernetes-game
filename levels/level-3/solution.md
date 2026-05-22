# Level 3 Solution — "Scaling for Traffic"

## Problem
The `api-server` deployment has only 1 replica, insufficient for the traffic spike.

## Fix
```bash
kubectl scale deployment api-server --replicas=3 -n level-3
```

Watch the new pods come up:
```bash
kubectl get pods -n level-3 -w
```

## What you learned
- How to scale a deployment imperatively
- How Kubernetes creates new pods to meet the desired replica count
- How to observe pod creation in real time with `-w`
