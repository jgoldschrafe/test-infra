resource "random_password" "admin" {
  length  = 16
  special = true
}

resource "random_password" "bind" {
  length  = 16
  special = false
}

resource "random_password" "config" {
  length  = 16
  special = true
}

resource "vault_generic_secret" "openldap_admin" {
  path = var.openldap_admin_vault_secret
  data_json = jsonencode({
    password = random_password.admin.result
  })
}

resource "vault_generic_secret" "openldap_bind" {
  path = var.openldap_bind_vault_secret
  data_json = jsonencode({
    password = random_password.bind.result
  })
}

resource "vault_generic_secret" "openldap_config" {
  path = var.openldap_config_vault_secret
  data_json = jsonencode({
    password = random_password.config.result
  })
}

module "openldap-bind-password-crypted" {
  source = "matti/resource/shell"

  command = "/usr/sbin/slappasswd -s ${random_password.bind.result} | tr -d '\n'"
}
