#
# Helm release for OpenLDAP server
#

resource "helm_release" "openldap" {
  namespace = data.terraform_remote_state.openldap_storage.outputs.openldap_namespace
  name      = "openldap"

  chart      = "../../charts/openldap"
  version    = "1.2.4"

  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [kubernetes_manifest.openldap_tls_certificate]
}
