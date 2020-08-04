#
# Helm release for phpLDAPadmin
#

resource "helm_release" "phpldapadmin" {
  namespace = kubernetes_namespace.phpldapadmin.metadata[0].name
  name      = "phpldapadmin"

  repository = "https://cetic.github.io/helm-charts"
  chart      = "phpldapadmin"
  version    = "0.1.4"

  values = [
    "${file("values.yaml")}"
  ]
}
