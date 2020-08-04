#
# Kubernetes namespace
#

resource "kubernetes_namespace" "phpldapadmin" {
  metadata {
    name = "phpldapadmin"
  }
}
