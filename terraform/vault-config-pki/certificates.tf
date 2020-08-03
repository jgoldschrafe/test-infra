#
# Intermediate CA for Vault
#

resource "tls_private_key" "intermediate_ca" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "intermediate_ca" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.intermediate_ca.private_key_pem

  subject {
    common_name  = "Test Infrastructure Intermediate CA"
    organization = "Test Infrastructure"
  }
}

resource "tls_locally_signed_cert" "intermediate_ca" {
  cert_request_pem   = tls_cert_request.intermediate_ca.cert_request_pem
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = data.terraform_remote_state.bootstrap_pki.outputs.root_ca_private_key_pem
  ca_cert_pem        = data.terraform_remote_state.bootstrap_pki.outputs.root_ca_cert_pem

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "cert_signing",
    "crl_signing",
  ]

  is_ca_certificate     = true
  validity_period_hours = 43800  # 5 yearas
}

resource "local_file" "intermediate_ca_private_key" {
  filename             = "certificates/intermediate_ca_key.pem"
  sensitive_content    = tls_private_key.intermediate_ca.private_key_pem
  file_permission      = "0600"
  directory_permission = "0755"
}

resource "local_file" "intermediate_ca_certificate" {
  filename             = "certificates/intermediate_ca.crt"
  content              = tls_locally_signed_cert.intermediate_ca.cert_pem
  file_permission      = "0644"
  directory_permission = "0755"
}
