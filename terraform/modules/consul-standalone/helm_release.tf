resource "helm_release" "consul" {
  namespace = var.namespace
  name      = "consul"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode({
      global = {
        domain     = var.domain
        datacenter = var.datacenter
      }

      dns = {
        clusterIP = var.dns_ip
      }
    })
  ]
}
