#
# Helm release for minio server
#

resource "helm_release" "minio" {
  namespace = kubernetes_namespace.minio.metadata[0].name
  name      = "minio"

  repository = "https://helm.min.io/"
  chart      = "minio"
  version    = "6.0.4"

  values = [
    "${file("values.yaml")}"
  ]
}
