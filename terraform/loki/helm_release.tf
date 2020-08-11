#
# Helm release for Loki server
#

resource "helm_release" "loki" {
  namespace = "loki"
  name      = "loki"

  repository = "https://grafana.github.io/loki/charts"
  chart      = "loki-stack"
  version    = "0.38.3"

  values = [
    "${file("values.yaml")}"
  ]
}

#
# Helm release for ingress resource
#

resource "helm_release" "loki_ingress" {
  namespace = "loki"
  name      = "loki-ingress"

  chart = "../../charts/loki-ingress"

  values = [
    "${file("values.yaml")}"
  ]
}
