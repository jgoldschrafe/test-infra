resource "random_password" "admin" {
  length = 16
  special = true
}

resource "random_password" "config" {
  length = 16
  special = true
}

resource "kubernetes_secret" "openldap" {
  metadata {
    namespace = var.namespace
    name      = "openldap"
  }

  data = {
    LDAP_ADMIN_PASSWORD = coalesce(
      var.admin_password,
      random_password.admin.result,
    )
    LDAP_CONFIG_PASSWORD = coalesce(
      var.config_password,
      random_password.config.result,
    )
  }
}
