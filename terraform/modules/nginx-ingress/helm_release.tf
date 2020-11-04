resource "helm_release" "nginx-ingress" {
  namespace = var.namespace
  name      = "nginx-ingress"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode(var.values),
  ]
}
