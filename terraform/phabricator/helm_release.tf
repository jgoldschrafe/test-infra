#
# Helm release for phabricator
#

resource "helm_release" "phabricator" {
  namespace = kubernetes_namespace.phabricator.metadata[0].name
  name      = "phabricator"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "phabricator"
  version    = "9.1.14"

  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [kubernetes_namespace.phabricator]
}
