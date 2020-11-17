locals {
  admin_dn  = "cn=admin,dc=test,dc=local"
  bind_dn   = "cn=bind,dc=test,dc=local"
  config_dn = "cn=config"
}

module "openldap-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "openldap"
}

module "openldap-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_port = 389
}

module "openldap" {
  source = "../modules/openldap-standalone"

  namespace = module.openldap-namespace.name

  host         = "ldap.test.local"
  domain       = "test.local"
  organization = "Test Infrastructure"

  # FIXME: Parameterize
  admin_dn              = local.admin_dn
  admin_password        = random_password.admin.result
  bind_dn               = local.bind_dn
  bind_password         = random_password.bind.result
  bind_password_crypted = module.openldap-bind-password-crypted.stdout
  config_password       = random_password.config.result

  certificate = {
    issuer_ref = {
      name  = data.consul_key_prefix.default-issuer.subkeys.name
      kind  = data.consul_key_prefix.default-issuer.subkeys.kind
      group = data.consul_key_prefix.default-issuer.subkeys.group
    }
  }

  extra_values = [
    jsonencode(module.openldap-consul-sidecar.values),
  ]
}
