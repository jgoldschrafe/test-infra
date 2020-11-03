resource "kubernetes_namespace" "namespace" {
  metadata {
    generate_name = var.name == null ? true : null
    name          = var.name
  }
}
