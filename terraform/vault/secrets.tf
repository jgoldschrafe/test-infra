#
# Kubernetes secrets consumed by Vault
#

locals {
  vault_cert_chain_pem = join("\n", [
    tls_locally_signed_cert.vault.cert_pem,
    data.terraform_remote_state.bootstrap_pki.outputs.bootstrap_ca_cert_pem,
    data.terraform_remote_state.bootstrap_pki.outputs.root_ca_cert_pem,
  ])
}

resource "kubernetes_secret" "root_ca" {
  metadata {
    namespace = data.terraform_remote_state.vault_storage.outputs.vault_namespace
    name      = "root-ca-certificate"
  }

  data = {
    "tls.crt": data.terraform_remote_state.bootstrap_pki.outputs.root_ca_cert_pem,
    "tls.key": data.terraform_remote_state.bootstrap_pki.outputs.root_ca_private_key_pem,
  }

  type = "kubernetes.io/tls"
}

resource "kubernetes_secret" "bootstrap_ca" {
  metadata {
    namespace = data.terraform_remote_state.vault_storage.outputs.vault_namespace
    name      = "bootstrap-ca-certificate"
  }

  data = {
    "tls.crt": data.terraform_remote_state.bootstrap_pki.outputs.bootstrap_ca_cert_pem,
    "tls.key": data.terraform_remote_state.bootstrap_pki.outputs.bootstrap_ca_private_key_pem,
  }

  type = "kubernetes.io/tls"
}

resource "kubernetes_secret" "vault" {
  metadata {
    namespace = data.terraform_remote_state.vault_storage.outputs.vault_namespace
    name      = "vault-certificate"
  }

  data = {
    "tls.crt": local.vault_cert_chain_pem,
    "tls.key": tls_private_key.vault.private_key_pem,
  }
}
