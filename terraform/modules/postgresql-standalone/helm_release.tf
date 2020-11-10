resource "helm_release" "postgresql" {
  namespace = var.namespace
  name      = "postgresql"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "9.1.4"

  values = concat(
    [
      file("${path.module}/values.yaml"),
    ],
    var.values,
)
}
