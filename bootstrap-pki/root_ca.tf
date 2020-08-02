resource "tls_private_key" "root_ca" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "tls_self_signed_cert" "root_ca" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.root_ca.private_key_pem

  subject {
    common_name  = "Test Infrastructure Root CA"
    organization = "Test Infrastructure"
  }

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "cert_signing",
    "crl_signing",
  ]

  is_ca_certificate     = true
  validity_period_hours = 43800  # 5 years
}

resource "local_file" "root_ca_private_key" {
  filename             = "certificates/root_ca_key.pem"
  sensitive_content    = tls_private_key.root_ca.private_key_pem
  file_permission      = "0600"
  directory_permission = "0755"
}

resource "local_file" "root_ca_certificate" {
  filename             = "certificates/root_ca.crt"
  content              = tls_self_signed_cert.root_ca.cert_pem
  file_permission      = "0644"
  directory_permission = "0755"
}