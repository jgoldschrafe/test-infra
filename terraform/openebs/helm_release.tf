#
# Helm release for openebs
#

resource "helm_release" "openebs" {
  namespace = kubernetes_namespace.openebs.metadata[0].name
  name      = "openebs"

  repository = "https://openebs.github.io/charts"
  chart      = "openebs"
  version    = "1.12.3"

  values = [
    "${file("values.yaml")}"
  ]
}
