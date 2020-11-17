module "phpldapadmin-namespace" {
  source = "../modules/kubernetes-namespace"

  name = var.phpldapadmin_namespace
}

module "phpldapadmin-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "openldap:389"
}

module "phpldapadmin" {
  source = "../modules/phpldapadmin"

  host = "phpldapadmin.test.local"

  certificate = {
    issuer_ref = var.cert_manager_issuer
  }

  # Inject Consul sidecar into pod configuration
  extra_values = [
    jsonencode(module.phpldapadmin-consul-sidecar.values),
  ]

  # Connect to OpenLDAP via injected Consul sidecar
  ldap_hosts = [{
    localhost = [
      {
        login = [
          # FIXME: Parameterize
          { bind_id = "cn=admin,dc=test,dc=local" }
        ],
      }
    ]
  }]
}
