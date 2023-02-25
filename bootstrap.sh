#!/bin/bash

# This file bootstraps your environment.
# It does the following:
# 1. Create a Service Account in Kubernetes with the role `cluster-admin`.
# 2. Uploads a Kubeconfig for the service Account
#
#

# Kubernetes bootstrap: Create service principal | Terraform this as well?
# k8s-bootstrap/bootstrap.sh

# For GitHub; just run Terraform and let the variables be manually entered by the user.
# Ask user to open URL if GITHUB_TOKEN does not exist

if [ $GITHUB_TOKEN == '']
then
  echo "Environment variable GITHUB_TOKEN not set. Create one at https://github.com/settings/tokens and paste it here"
  read input
  export GITHUB_TOKEN="$input"
fi

echo $GITHUB_TOKEN

terraform -chdir=github/ init
terraform -chdir=github/ plan -out plan.tfplan
#
# Option 2: Bootstrap cluster with ArgoCD
# Your cluster does not have to be available on the public internet/tunnel.

