terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.18.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options
}


