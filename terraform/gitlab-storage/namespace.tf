#
# Kubernetes namespace
#

resource "kubernetes_namespace" "gitlab" {
  metadata {
    name = "gitlab"
  }
}
