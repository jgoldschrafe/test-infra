resource "consul_intention" "allow-ingress-service-vault" {
  source_name      = "ingress-gateway"
  destination_name = "vault"
  action           = "allow"
}

resource "consul_key_prefix" "vault" {
  path_prefix = "vault/"

  subkeys = {
    namespace    = module.vault-namespace.name
    internal_url = "http://vault.${module.vault-namespace.name}:8200"
  }
}
