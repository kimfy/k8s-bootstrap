#!/bin/bash

# === variables
# = Kubernetes cluster bootstrap
K8S_BOOTSTRAP_CONFIG_PATH="~/.kube/config"
K8S_API_URL="https://kimsdextop.iversen.dev"
NS="bootstrap"
SECRET="bootstrap"

# === ArgoCD Bootstrapping
#kubectl apply -f argocd/app-of-apps.yaml

# = GitHub
export GITHUB_TOKEN=""
github_repository_name="kimfy/k8s-bootstrap"
github_repository_environment="prod"
kubeconfig_path="kubeconfig"

# This file bootstraps your environment.
# It does the following:
# 1. Create a Service Account in Kubernetes with the role `cluster-admin`.
# 2. Uploads a Kubeconfig for the service Account

#SERVICE_ACCOUNT=bootstrapper
#SECRET_NAME=$SERVICE_ACCOUNT
#NS=bootstrap
# Create a service principal
#kubectl apply -f k8s-bootstrap/bootstrap.yaml
# Extract the Bearer token from the Secret and decode
# Input this into a ConfigMap

#KUBE_CONFIG_PATH=$K8S_BOOTSTRAP_CONFIG_PATH \
#terraform -chdir=k8s-bootstrap destroy

KUBE_CONFIG_PATH=$K8S_BOOTSTRAP_CONFIG_PATH \
terraform -chdir=k8s-bootstrap init

KUBE_CONFIG_PATH=$K8S_BOOTSTRAP_CONFIG_PATH \
TF_VAR_k8s_api_url=$K8S_API_URL \
terraform -chdir=k8s-bootstrap plan -out plan.tfplan \

KUBE_CONFIG_PATH=$K8S_BOOTSTRAP_CONFIG_PATH \
terraform -chdir=k8s-bootstrap apply  plan.tfplan

TOKEN=$(kubectl get secret $SECRET_NAME -n ${NS} -o json | jq -Mr '.data.token' | base64 -d)

terraform -chdir=k8s-bootstrap output -raw kubeconfig > github/kubeconfig
cat github/kubeconfig

# === End k8s-bootstrap

# Kubernetes bootstrap: Create service principal | Terraform this as well?
# k8s-bootstrap/bootstrap.sh

# For GitHub; just run Terraform and let the variables be manually entered by the user.
# Ask user to open URL if GITHUB_TOKEN does not exist

if [ -z "$GITHUB_TOKEN" ]
then
  echo "Environment variable GITHUB_TOKEN not set. Create one at https://github.com/settings/tokens and paste it here"
  read input
  export GITHUB_TOKEN="$input"
fi

echo $GITHUB_TOKEN

rm github/plan.tfplan > /dev/null 2>&1

GITHUB_TOKEN=$GITHUB_TOKEN terraform -chdir=github/ init
TF_VAR_github_repository_name=$github_repository_name \
TF_VAR_github_repository_environment=$github_repository_environment \
TF_VAR_kubeconfig_path=$kubeconfig_path \
GITHUB_TOKEN=$GITHUB_TOKEN terraform -chdir=github/ plan -out plan.tfplan
GITHUB_TOKEN=$GITHUB_TOKEN terraform -chdir=github/ apply plan.tfplan
#
# Option 2: Bootstrap cluster with ArgoCD
# Your cluster does not have to be available on the public internet/tunnel.

