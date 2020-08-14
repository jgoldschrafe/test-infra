#
# Kubernetes namespace
#

resource "kubernetes_namespace" "openebs" {
  metadata {
    name = "openebs"
  }
}
