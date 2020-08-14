#
# Kubernetes namespace
#

resource "kubernetes_namespace" "openldap" {
  metadata {
    name = "openldap"
  }
}
