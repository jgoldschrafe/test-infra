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

resource "vault_generic_secret" "admin" {
  path = "secret/openldap/admin"
  data_json = jsonencode({
    dn       = local.admin_dn
    password = random_password.admin.result
  })
}

resource "vault_generic_secret" "bind" {
  path = "secret/openldap/bind"
  data_json = jsonencode({
    dn       = local.bind_dn
    password = random_password.bind.result
  })
}

resource "vault_generic_secret" "config" {
  path = "secret/openldap/config"
  data_json = jsonencode({
    dn       = local.config_dn
    password = random_password.config.result
  })
}

module "openldap-bind-password-crypted" {
  source = "matti/resource/shell"

  command = "/usr/sbin/slappasswd -s ${random_password.bind.result} | tr -d '\n'"
}
