#
# Kubernetes namespace for cert-manager
#

resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}
