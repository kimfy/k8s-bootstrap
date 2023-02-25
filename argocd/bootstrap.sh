#!/bin/bash
#
## In this guide we will be installing ArgoCD using kubectl and GitHub Actions.
## Deploy ArgoCD to a fresh Kubernetes cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Deploy the first application
SECRET=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d)
argocd login "localhost:8080" --insecure
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default
argocd sync guestbook
