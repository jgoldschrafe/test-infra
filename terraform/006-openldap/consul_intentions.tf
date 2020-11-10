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
