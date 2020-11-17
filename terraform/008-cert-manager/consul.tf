data "consul_key_prefix" "vault" {
  path_prefix = "vault/"
}

resource "consul_key_prefix" "cert-manager-default-issuer" {
  path_prefix = "cert-manager/issuer/default-issuer/"

  subkeys = {
    name  = "default-issuer"
    kind  = "ClusterIssuer"
    group = "cert-manager.io"
  }
}
