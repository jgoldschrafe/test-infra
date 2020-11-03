#
# Helm release for Airflow server
#

resource "helm_release" "airflow" {
  namespace = var.namespace
  name      = "airflow"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "airflow"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
  ]
}
