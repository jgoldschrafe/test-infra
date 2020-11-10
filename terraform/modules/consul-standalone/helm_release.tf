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

      ingressGateways = {
        defaults = {
          service = {
            type = (var.ingress_gateway_http_node_port != null || var.ingress_gateway_https_node_port != null) ? "NodePort" : "ClusterIP"

            ports = [
              {
                port = 8080
                nodePort = var.ingress_gateway_http_node_port
              },
              {
                port = 8443
                nodePort = var.ingress_gateway_https_node_port
              }
            ]
          }
        }
      }
    })
  ]
}
