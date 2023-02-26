output "service_account_token" {
  value = kubernetes_secret_v1.bootstrap_sa_token.data.token
  sensitive = true
}

output "kubeconfig" {
  value = templatefile("${path.module}/kubeconfig.tpl", {
    K8S_API_URL = var.k8s_api_url
    TOKEN = kubernetes_secret_v1.bootstrap_sa_token.data.token
  })
  sensitive = true
}
