data "consul_key_prefix" "default-issuer" {
  path_prefix = "cert-manager/issuer/default-issuer/"
}

resource "consul_intention" "allow-phpldapadmin-openldap" {
  source_name      = "phpldapadmin"
  destination_name = "openldap"
  action           = "allow"
}

resource "consul_intention" "allow-postgresql-openldap" {
  source_name      = "postgresql"
  destination_name = "openldap"
  action           = "allow"
}

resource "consul_intention" "allow-vault-openldap" {
  source_name      = "vault"
  destination_name = "openldap"
  action           = "allow"
}

resource "consul_key_prefix" "openldap" {
  path_prefix = "openldap/"

  subkeys = {
    namespace           = module.openldap-namespace.name
    vault_admin_secret  = vault_generic_secret.admin.path
    vault_bind_secret   = vault_generic_secret.bind.path
    vault_config_secret = vault_generic_secret.config.path
  }
}
