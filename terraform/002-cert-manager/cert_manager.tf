module "cert-manager-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "cert-manager"
}

module "cert-manager" {
  source = "../modules/cert-manager"

  namespace      = module.cert-manager-namespace.name
  default_issuer = "default-issuer"
  vault_url      = "http://vault.vault:8200"
}

module "cert-manager-default-issuer" {
  source = "../modules/cert-manager-vault-issuer"

  namespace = "cert-manager"
  name      = "default-issuer"

  depends_on = [
    module.cert-manager,
  ]
}
