resource "helm_release" "ingress-nginx" {
  namespace = var.namespace
  name      = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode(var.values),
  ]
}
