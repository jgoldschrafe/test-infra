resource "consul_intention" "consul-ingress-postgresql" {
  source_name      = "consul-ingress"
  destination_name = "postgresql"
  action           = "allow"
}
