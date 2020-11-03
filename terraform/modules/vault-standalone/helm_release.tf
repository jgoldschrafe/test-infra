locals {
  values_yaml = yamldecode(file("${path.module}/values.yaml"))
}

resource "helm_release" "vault" {
  namespace = var.namespace
  name      = "vault"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = var.chart_version

  values = [
    yamlencode(merge(local.values_yaml, {
      server = merge(local.values_yaml.server, {
        ingress = merge(local.values_yaml.server.ingress, {
          hosts = [
            for host in var.certificate.dns_names :
            {
              host  = host
              paths = []
            }
          ]
          tls = [merge(local.values_yaml.server.ingress.tls[0], {
            hosts = var.certificate.dns_names,
          })]
        })
      })
    }))
  ]
}
