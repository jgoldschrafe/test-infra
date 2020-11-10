module "phpldapadmin-namespace" {
  source = "../modules/kubernetes-namespace"

  name = var.phpldapadmin_namespace
}

module "phpldapadmin-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "openldap:1389"
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
        server = [
          { port = 1389 },
        ]
      },
      {
        login = [
          # FIXME: Parameterize
          { bind_id = "cn=admin,dc=test,dc=local" }
        ],
      }
    ]
  }]
}
