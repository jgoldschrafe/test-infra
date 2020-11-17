resource "helm_release" "minio" {
  namespace = var.namespace
  name      = "minio"

  repository = "https://helm.min.io/"
  chart      = "minio"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode({
      existingSecret = "minio"
      buckets        = var.buckets
      accesskey      = var.access_key
      secretkey      = var.secret_key
    }),
  ]

  depends_on = [
    kubernetes_secret.minio,
  ]
}
