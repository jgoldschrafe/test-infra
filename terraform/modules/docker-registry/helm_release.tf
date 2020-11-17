resource "helm_release" "docker-registry" {
  namespace = var.namespace
  name      = "docker-registry"

  repository = "https://helm.twun.io"
  chart      = "docker-registry"
  version    = var.chart_version

  values = concat(
    [
      jsonencode({
        ingress = {
          enabled = true
          path    = "/"
          hosts   = [var.host]
  
          tls = [
            {
              secretName = "docker-registry-tls"
              hosts = [var.host]
            }
          ]
        }
      }),
    ],
    var.extra_values,
  )
}
