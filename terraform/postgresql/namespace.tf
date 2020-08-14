#
# Kubernetes namespace
#

resource "kubernetes_namespace" "postgresql" {
  metadata {
    name = "postgresql"
  }
}
