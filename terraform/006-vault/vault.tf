module "vault-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "vault"
}

module "consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "openldap:1389"
}

module "vault" {
  source = "../modules/vault-standalone"

  certificate = {
    signing_ca = data.terraform_remote_state.pki.outputs.bootstrap_ca

    subject = {
      common_name  = "vault.test.local"
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

  extra_values = [
    jsonencode({
      server = {
        annotations = module.consul-sidecar.values.podAnnotations
      }
    }),
  ]
}
