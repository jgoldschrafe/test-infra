#
# Kubernetes namespace
#

resource "kubernetes_namespace" "loki" {
  metadata {
    name = "loki"
  }
}
