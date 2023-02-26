resource "kubernetes_service_account_v1" "bootstrap" {
  metadata {
    name = var.service_account_name
    namespace = kubernetes_namespace_v1.bootstrap.metadata[0].name
  }
}

