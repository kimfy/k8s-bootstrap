variable "namespace_name" {
  type = string
  description = "The name of the namespace to create for bootstrap resources"
  default = "bootstrap"
}

variable "service_account_name" {
  type = string
  description = "The name of the service account used to bootstrap"
  default = "bootstrap"
}

variable "k8s_api_url" {
  type = string
  description = "The URL to the Kubernetes API"
  default = "https://strandgaten.iversen.dev" 
}

