resource "vault_ldap_auth_backend" "ldap" {
  path         = "ldap"
  # FIXME: LDAPS, LDAP+StartTLS broken
  url          = "ldap://openldap.openldap.svc.cluster.local"
  certificate  = data.terraform_remote_state.vault_config_pki.outputs.intermediate_ca_cert_pem
  # TODO: Move to insecure_tls = false when you have a good method of managing
  # certificate trusts in the Vault pod
  insecure_tls = true

  #binddn      = "cn=readonly,dc=test,dc=local"
  #bindpass    = "password"
  discoverdn  = true
  #userdn      = "ou=Users,dc=test,dc=local"
  userdn      = "dc=test,dc=local"
  userattr    = "uid"
  #upndomain   = "TEST.LOCAL"
  #groupdn     = "ou=Groups,dc=test,dc=local"
  groupdn     = "dc=test,dc=local"
  #groupfilter = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
}
