# kubernetes-sandbox

This project aims to let you use a mix of GitOps and GitHub Agents to set up your Kubernetes clusters. All you need to provide is a `kubeconfig`, access to the cluster from GitHub Agents, a PAT to GitHub.

You will need to have access to the cluster before you start.

## Pre-requisites

You need a Kubernetes cluster which is accessible by GitHub agents. I have used Cloudflare Tunnels for this.

### Tools

1. kubectl
2. git
3. terraform
4. pre-commit (optional)

## Deploy

1. Fork the repository
2. Clone the repository locally
3. Run `./bootstrap.sh`


## TODO

- [ ] Bootstrap GitHub
- [ ] ArgoCD
- [ ] HashiCorp Vault, Consul and Boundary

## Environment variables and secrets

The project must be set up with the following environment secrets and variables.

| Name | Description | Referenced by |
| ---- | ----------- | ------------- |
| KUBE_CONFIG | Kubeconfig | ${{ secrets.KUBE_CONFIG }} |
