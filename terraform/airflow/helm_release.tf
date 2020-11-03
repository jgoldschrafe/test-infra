#
# Helm release for Airflow server
#

resource "helm_release" "airflow" {
  namespace = "airflow"
  name      = "airflow"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "helm-stable/airflow"
  version    = "7.13.1"

  values = [
    "${file("values.yaml")}"
  ]
}
