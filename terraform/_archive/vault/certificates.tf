#
# Certificates for Vault web server
#

resource "tls_private_key" "vault" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "vault" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.vault.private_key_pem

  subject {
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

resource "tls_locally_signed_cert" "vault" {
  cert_request_pem   = tls_cert_request.vault.cert_request_pem
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = data.terraform_remote_state.bootstrap_pki.outputs.bootstrap_ca_private_key_pem
  ca_cert_pem        = data.terraform_remote_state.bootstrap_pki.outputs.bootstrap_ca_cert_pem

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]

  validity_period_hours = 43800  # 5 years
}
