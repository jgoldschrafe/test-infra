resource "helm_release" "openebs" {
  namespace = var.namespace
  name      = "openebs"

  repository = "https://openebs.github.io/charts"
  chart      = "openebs"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode({
      localprovisioner = {
        basePath = var.volume_root_path
      }
    }),
  ]
}
