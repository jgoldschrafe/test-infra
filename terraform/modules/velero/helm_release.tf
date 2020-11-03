resource "helm_release" "velero" {
  namespace = var.namespace
  name      = "velero"

  repository = "https://vmware-tanzu.github.io/helm-charts/"
  chart      = "velero"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    var.values,
  ]
}
