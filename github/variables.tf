variable "github_repository_name" {
  type = string
  description = "The name of your GitHub Repository. Ex: kimfy/k8s-bootstrap"
}

variable "github_repository_environment" {
  type = string
  description = "Environment name to upload to"
}

variable "kubeconfig_path" {
  type = string
  description = "Path to kubeconfig relative to the root module. This file can not reside outside of the github module."
}
