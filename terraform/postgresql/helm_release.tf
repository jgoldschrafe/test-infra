#
# Helm release for postgresql server
#

resource "helm_release" "postgresql" {
  namespace = kubernetes_namespace.postgresql.metadata[0].name
  name      = "postgresql"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "9.1.4"

  values = [
    "${file("values.yaml")}"
  ]
}
