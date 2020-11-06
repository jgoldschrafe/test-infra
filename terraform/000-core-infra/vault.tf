module "vault-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "vault"
}

module "vault-consul-sidecar" {
  source = "../modules/consul-sidecar"
}

module "vault" {
  source = "../modules/vault-standalone"

  certificate = {
    signing_ca = module.bootstrap-ca.ca

    subject = {
      common_name = "vault.test.local"
      organization = "Test Infrastructure"
    }

    dns_names = [
      "vault.test.local",
      "vault",
      "vault.vault",
      "vault.vault.svc",
      "vault.vault.svc.cluster",
      "vault.vault.svc.cluster.local",
    ]
  }

  namespace = module.vault-namespace.name
  values = [
    jsonencode(module.vault-consul-sidecar.values),
  ]

  depends_on = [
    module.ingress-nginx,
  ]
}
