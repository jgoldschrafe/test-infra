resource "consul_intention" "allow-ingress-service-vault" {
  source_name      = "ingress-gateway"
  destination_name = "vault"
  action           = "allow"
}
