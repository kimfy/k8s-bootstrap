resource "kubernetes_namespace_v1" "bootstrap" {
  metadata {
    name = var.namespace_name
  }
}
