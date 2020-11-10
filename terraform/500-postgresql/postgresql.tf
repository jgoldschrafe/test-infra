module "postgresql-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "postgresql"
}

module "postgresql-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "openldap:389"
}

module "postgresql" {
  source = "../modules/postgresql-standalone"

  namespace = "postgresql"

  extra_values = [
    jsonencode({
      master = module.postgresql-consul-sidecar.values,

      pgHbaConfiguration = <<EOF
local all all trust
host all all localhost trust
host all all 0.0.0.0/0 md5
host all all 0.0.0.0/0 ldap ldapurl="ldap://localhost/dc=test,dc=local?uid?sub"
EOF
    }),
  ]

  postgres_password = random_password.postgres.result
}
