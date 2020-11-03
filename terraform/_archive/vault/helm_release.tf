#
# Helm release for Vault server
#

resource "helm_release" "vault" {
  namespace = "vault"
  name      = "vault"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.6.0"

  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [
    kubernetes_secret.vault,
  ]
}
