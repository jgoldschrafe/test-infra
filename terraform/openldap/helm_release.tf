#
# Helm release for Vault server
#

resource "helm_release" "openldap" {
  namespace = data.terraform_remote_state.openldap_storage.outputs.openldap_namespace
  name      = "openldap"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "openldap"
  version    = "1.2.4"

  values = [
    "${file("values.yaml")}"
  ]
}
