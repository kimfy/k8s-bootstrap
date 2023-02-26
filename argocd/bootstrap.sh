#!/bin/bash
#
## In this guide we will be installing ArgoCD using kubectl and GitHub Actions.
## Deploy ArgoCD to a fresh Kubernetes cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete port-forward svc/argocd-server

SECRET=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d)
argocd login local --insecure --username admin --password $SECRET --port-forward --port-forward-namespace argocd
argocd appset create apps.yaml --port-forward --port-forward-namespace argocd

