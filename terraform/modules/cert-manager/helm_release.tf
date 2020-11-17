resource "helm_release" "cert_manager" {
  namespace = var.namespace
  name      = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.chart_version

  values = concat(
    [
      file("${path.module}/values.yaml"),
      jsonencode({
        ingressShim = {
          defaultIssuerName = "default-issuer"
        }
      }),
    ],
    var.extra_values,
  )
}
