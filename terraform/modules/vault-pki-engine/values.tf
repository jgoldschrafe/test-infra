variable "signing_ca" {
  description = "Data for signing the new CA certificate"
  type = object({
    key_algorithm   = string
    private_key_pem = string
    cert_pem        = string
    cert_chain      = string
  })
}

variable "ca" {
  description = "Certficate authority settings"
  type = object({
    subject = object({
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
