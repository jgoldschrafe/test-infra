module "ldap-auth" {
  source = "../modules/vault-auth-ldap"

  url = "ldap://localhost:1389"
}
