module "cert-manager-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "cert-manager"
}

module "cert-manager" {
  source = "../modules/cert-manager"

  namespace      = module.cert-manager-namespace.name
  default_issuer = "default-issuer"
  vault_url      = data.consul_key_prefix.vault.subkeys.internal_url
}

module "cert-manager-default-issuer" {
  source = "../modules/cert-manager-vault-issuer"

  namespace = module.cert-manager-namespace.name
  name      = "default-issuer"

  depends_on = [
    module.cert-manager,
  ]
}
