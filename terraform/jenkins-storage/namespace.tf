#
# Kubernetes namespace
#

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"
  }
}
