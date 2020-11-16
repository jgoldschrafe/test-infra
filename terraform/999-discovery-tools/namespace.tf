resource "kubernetes_namespace" "discovery-tools" {
  metadata {
    name = "discovery-tools"
  }
}
