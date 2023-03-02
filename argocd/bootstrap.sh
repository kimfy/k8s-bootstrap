#!/bin/bash
#
## In this guide we will be installing ArgoCD using kubectl and GitHub Actions.
## Deploy ArgoCD to a fresh Kubernetes cluster
kubectl create namespace argocd
#kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.2/manifests/install.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

SECRET=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d)

kubectl apply -f app-of-apps.yaml
