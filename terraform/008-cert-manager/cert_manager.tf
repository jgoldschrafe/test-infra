module "cert-manager-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "cert-manager"
}

module "cert-manager-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "vault:8200"
}

module "cert-manager-webhook-consul-sidecar" {
  source = "../modules/consul-sidecar"

  service           = "cert-manager-webhook"
  service_upstreams = "vault:8200"
}

module "cert-manager" {
  source = "../modules/cert-manager"

  namespace      = module.cert-manager-namespace.name
  default_issuer = "default-issuer"
  vault_url      = "localhost:8200"

  extra_values = [
    jsonencode(module.cert-manager-consul-sidecar.values),
    jsonencode({
      webhook = module.cert-manager-webhook-consul-sidecar.values,
    }),
  ]
}

module "cert-manager-default-issuer" {
  source = "../modules/cert-manager-vault-issuer"

  namespace = module.cert-manager-namespace.name
  name      = "default-issuer"

  depends_on = [
    module.cert-manager,
  ]
}
