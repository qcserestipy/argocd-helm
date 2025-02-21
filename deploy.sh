#!/bin/bash

helm install argo-cd argo/argo-cd  \
  --namespace argocd \
  --create-namespace \
  --set dex.enabled=false \
  --set notifications.enabled=false \
  --set configs.rbac.create=false  \
  --debug 
kubectl apply -f kustomize/tls/repo-secret.yaml
sleep 60 
helm template root-app/ | kubectl apply -f -
