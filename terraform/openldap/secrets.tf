#
# Generated secrets
#

resource "random_password" "admin" {
  length  = 16
  special = true
}

resource "random_password" "config" {
  length  = 16
  special = true
}

resource "kubernetes_secret" "openldap" {
  metadata {
    namespace = kubernetes_namespace.openldap.metadata[0].name
    name      = "openldap"
  }

  data = {
    LDAP_ADMIN_PASSWORD = random_password.admin.result
    LDAP_CONFIG_PASSWORD = random_password.config.result
  }
}
