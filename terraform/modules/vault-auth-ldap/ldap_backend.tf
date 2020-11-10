resource "vault_ldap_auth_backend" "ldap" {
  path = var.ldap_path

  url        = var.url
  discoverdn = true
  userdn     = "dc=test,dc=local" # FIXME: Parameterize
  userattr   = "uid"
  groupdn    = "dc=test,dc=local" # FIXME: Parameterize
}
