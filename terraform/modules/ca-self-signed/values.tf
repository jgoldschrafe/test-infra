variable "certificate_path" {
  description = "Location to write the generated certificate"
  type        = string
}

variable "private_key_path" {
  description = "Location to write the generated private key"
  type        = string
}

variable "subject" {
  description = "Certificate subject"
  type = object({
    common_name         = string
    organization        = string
    organizational_unit = string
    street_address      = list(string)
    locality            = string
    province            = string
    country             = string
    postal_code         = string
    serial_number       = string
  })
}

output "private_key_pem" {
  sensitive = true
  value = tls_self_signed_cert.ca_cert.private_key_pem
}

output "ca" {
  description = "Certificate data for the CA"
  sensitive = true
  value = {
    key_algorithm = tls_self_signed_cert.ca_cert.key_algorithm
    private_key_pem = tls_private_key.ca_cert.private_key_pem
    cert_pem = tls_self_signed_cert.ca_cert.cert_pem
    cert_chain = tls_self_signed_cert.ca_cert.cert_pem
  }
}
