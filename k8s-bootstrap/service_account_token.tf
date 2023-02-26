resource "kubernetes_secret_v1" "bootstrap_sa_token" {
  metadata {
    namespace = kubernetes_namespace_v1.bootstrap.metadata[0].name
    name = var.service_account_name
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.bootstrap.metadata[0].name
    }
  }

  type = "kubernetes.io/service-account-token"
}

