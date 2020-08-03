#
# Helm release for cert-manager
#

resource "helm_release" "cert_manager" {
  namespace = kubernetes_namespace.cert_manager.metadata[0].name
  name      = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v0.16.0"

  values = [
    "${file("values.yaml")}",
  ]
}
