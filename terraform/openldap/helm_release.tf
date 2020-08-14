#
# Helm release for OpenLDAP server
#

resource "helm_release" "openldap" {
  namespace = kubernetes_namespace.openldap.metadata[0].name
  name      = "openldap"

  chart      = "../../charts/openldap"
  version    = "1.2.4"

  values = [
    "${file("values.yaml")}"
  ]

  depends_on = [kubernetes_manifest.openldap_tls_certificate]
}
