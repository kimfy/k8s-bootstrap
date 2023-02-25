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
  description = "Absolute path to kubeconfig file."
  default = "dev"
}
