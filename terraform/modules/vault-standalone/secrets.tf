locals {
  vault_cert_chain_pem = join("\n", [
    tls_locally_signed_cert.vault.cert_pem,
    var.certificate.signing_ca.cert_chain,
  ])
}

resource "kubernetes_secret" "vault_certificate" {
  metadata {
    namespace = var.namespace
    name      = "vault-certificate"
  }

  data = {
    "tls.crt" : local.vault_cert_chain_pem,
    "tls.key" : tls_private_key.vault.private_key_pem,
  }
}
