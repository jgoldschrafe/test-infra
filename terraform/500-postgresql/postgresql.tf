module "postgresql-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "postgresql"
}

module "postgresql-consul-sidecar" {
  source = "../modules/consul-sidecar"
}

module "postgresql" {
  source = "../modules/postgresql-standalone"

  namespace = "postgresql"

  values = [
    jsonencode(module.postgresql-consul-sidecar.values),
  ]
}
