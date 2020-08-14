#
# Kubernetes namespace
#

resource "kubernetes_namespace" "phabricator" {
  metadata {
    name = "phabricator"
  }
}
