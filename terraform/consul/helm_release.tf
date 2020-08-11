#
# Helm release for Consul server
#

resource "helm_release" "consul" {
  namespace = "consul"
  name      = "consul"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = "v0.24.1"

  values = [
    "${file("values.yaml")}"
  ]
}
