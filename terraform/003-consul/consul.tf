module "consul-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "consul"
}

module "consul" {
  source = "../modules/consul-standalone"

  namespace = module.consul-namespace.name

  # ingress_gateway_http_node_port  = var.consul_ingress_gateway_http_node_port
  # ingress_gateway_https_node_port = var.consul_ingress_gateway_https_node_port
}
