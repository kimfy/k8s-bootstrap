resource "kubernetes_cluster_role_binding_v1" "bootstrap_sa_cluster_admin" {
  metadata {
    name = var.service_account_name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account_v1.bootstrap.metadata[0].name
    namespace = kubernetes_namespace_v1.bootstrap.metadata[0].name
  }
}
