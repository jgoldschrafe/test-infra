module "postgresql-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "postgresql"
}

module "postgresql" {
  source = "../modules/postgresql-standalone"

  namespace = "postgresql"
}
