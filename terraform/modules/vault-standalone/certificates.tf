resource "tls_private_key" "vault" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "vault" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.vault.private_key_pem

  subject {
    common_name  = var.certificate.subject.common_name
    organization = var.certificate.subject.organization
  }

  dns_names = var.certificate.dns_names
}

resource "tls_locally_signed_cert" "vault" {
  cert_request_pem   = tls_cert_request.vault.cert_request_pem
  ca_key_algorithm   = var.certificate.signing_ca.key_algorithm
  ca_private_key_pem = var.certificate.signing_ca.private_key_pem
  ca_cert_pem        = var.certificate.signing_ca.cert_pem

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]

  validity_period_hours = 43800 # 5 years
}

locals {
  vault_cert_chain_pem = join("\n", [
    tls_locally_signed_cert.vault.cert_pem,
    var.certificate.signing_ca.cert_chain,
  ])
}

resource "kubernetes_secret" "vault_certificate" {
  metadata {
    namespace = var.namespace
    name      = "vault-tls"
  }

  data = {
    "tls.crt" : local.vault_cert_chain_pem,
    "tls.key" : tls_private_key.vault.private_key_pem,
  }
}
