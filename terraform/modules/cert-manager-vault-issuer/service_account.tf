resource "kubernetes_service_account" "issuer" {
  metadata {
    namespace = var.namespace
    name      = var.name
  }
}
