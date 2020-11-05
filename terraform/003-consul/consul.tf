module "consul-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "consul"
}

module "consul" {
  source = "../modules/consul-standalone"

  namespace = module.consul-namespace.name
}
