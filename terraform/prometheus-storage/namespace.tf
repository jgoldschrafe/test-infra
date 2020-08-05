#
# Kubernetes namespace
#

resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"
  }
}
