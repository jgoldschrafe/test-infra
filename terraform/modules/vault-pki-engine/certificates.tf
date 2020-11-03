resource "tls_private_key" "intermediate_ca" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "intermediate_ca" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.intermediate_ca.private_key_pem

  subject {
    common_name         = var.subject.common_name
    organization        = var.subject.organization
    organizational_unit = var.subject.organizational_unit
    street_address      = var.subject.street_address
    locality            = var.subject.locality
    province            = var.subject.province
    country             = var.subject.country
    postal_code         = var.subject.postal_code
    serial_number       = var.subject.serial_number
  }
}

resource "tls_locally_signed_cert" "intermediate_ca" {
  cert_request_pem   = tls_cert_request.intermediate_ca.cert_request_pem
  ca_key_algorithm   = var.signing_ca.key_algorithm
  ca_private_key_pem = var.signing_ca.private_key_pem
  ca_cert_pem        = var.signing_ca.cert_pem

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "cert_signing",
    "crl_signing",
  ]

  is_ca_certificate     = true
  validity_period_hours = 43800 # 5 years
}

resource "local_file" "intermediate_ca_private_key" {
  filename             = var.private_key_path
  sensitive_content    = tls_private_key.intermediate_ca.private_key_pem
  file_permission      = "0600"
  directory_permission = "0755"
}

resource "local_file" "intermediate_ca_certificate" {
  filename             = var.certificate_path
  sensitive_content    = tls_locally_signed_cert.intermediate_ca.cert_pem
  file_permission      = "0644"
  directory_permission = "0755"
}
