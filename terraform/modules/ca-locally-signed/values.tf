variable "signing_ca" {
  description = "Data for signing the new CA certificate"
  type = object({
    key_algorithm = string
    private_key_pem = string
    cert_pem = string
    cert_chain = string
  })
}

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

output "ca" {
  description = "Certificate data for the CA"
  value = {
    key_algorithm = tls_private_key.ca_cert.algorithm
    private_key_pem = tls_private_key.ca_cert.private_key_pem
    cert_pem = tls_locally_signed_cert.ca_cert.cert_pem
    cert_chain = join("\n", [
      tls_locally_signed_cert.ca_cert.cert_pem,
      var.signing_ca.cert_chain,
    ])
  }
}
