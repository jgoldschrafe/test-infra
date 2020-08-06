#
# Helm release for Prometheus
#

resource "helm_release" "prometheus" {
  namespace = data.terraform_remote_state.prometheus_storage.outputs.prometheus_namespace
  name      = "prometheus"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "prometheus"
  version    = "11.11.1"

  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [kubernetes_manifest.prometheus_tls_certificate]
}
