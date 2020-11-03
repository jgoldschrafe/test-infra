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
