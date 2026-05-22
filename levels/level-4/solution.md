# Level 4 Solution — "Broken Release"

## Problem
The `backend` deployment was updated to image `nginx:this-tag-does-not-exist`.
Kubernetes cannot pull the image, so pods stay in `ImagePullBackOff`.

## How to diagnose
```bash
kubectl get pods -n level-4                          # ImagePullBackOff
kubectl describe pod <pod-name> -n level-4           # Failed to pull image
kubectl rollout history deployment/backend -n level-4
```

## Fix — Option 1: rollback
```bash
kubectl rollout undo deployment/backend -n level-4
```

## Fix — Option 2: set a known good image
```bash
kubectl set image deployment/backend backend=nginx:latest -n level-4
```

## What you learned
- How to identify an ImagePullBackOff failure
- How to use rollout history to understand what changed
- How to roll back a deployment to a previous revision
