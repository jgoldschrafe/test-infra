resource "helm_release" "vault" {
  namespace = var.namespace
  name      = "vault"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = var.chart_version

  values = concat(
    [
      file("${path.module}/values.yaml"),
      jsonencode({
        server = {
          ingress = {
            hosts = [
              for host in var.certificate.dns_names:
              {
                host  = host
                paths = []
              }
            ]
            tls = [
              {
                secretName = "vault-tls"
                hosts = var.certificate.dns_names
              }
            ]
          }
        }
      })
    ],
    var.extra_values,
  )
}
