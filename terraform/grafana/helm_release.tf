#
# Helm release for Grafana server
#

resource "helm_release" "grafana" {
  namespace = "grafana"
  name      = "grafana"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "grafana"
  version    = "5.5.5"

  values = [
    "${file("values.yaml")}"
  ]
}
