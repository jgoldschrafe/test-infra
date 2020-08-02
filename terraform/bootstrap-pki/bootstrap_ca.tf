#
# Bootstrap certificate authority used for generating the original certificates
# to configure the Vault PKI and other base-layer infrastructure.
#

resource "tls_private_key" "bootstrap_ca" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "bootstrap_ca" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.bootstrap_ca.private_key_pem

  subject {
    common_name  = "Test Infrastructure Bootstrap CA"
    organization = "Test Infrastructure"
  }
}

resource "tls_locally_signed_cert" "bootstrap_ca" {
  cert_request_pem   = tls_cert_request.bootstrap_ca.cert_request_pem
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = tls_private_key.root_ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root_ca.cert_pem

  allowed_uses = [
    "key_encipherment",
    "digital_signatiure",
    "server_auth",
    "cert_signing",
    "crl_signing",
  ]

  is_ca_certificate     = true
  validity_period_hours = 43800  # 5 years
}

resource "local_file" "bootstrap_ca_private_key" {
  filename             = "certificates/bootstrap_ca_key.pem"
  sensitive_content    = tls_private_key.bootstrap_ca.private_key_pem
  file_permission      = "0600"
  directory_permission = "0755"
}

resource "local_file" "bootstrap_ca_certificate" {
  filename             = "certificates/bootstrap_ca.crt"
  content              = tls_locally_signed_cert.bootstrap_ca.cert_pem
  file_permission      = "0644"
  directory_permission = "0700"
}