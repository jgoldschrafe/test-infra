module "root-ca" {
  source = "../modules/ca-self-signed"

  subject = {
    common_name  = "Test Infrastructure Root CA"
    organization = "Test Infrastructure"

    organizational_unit = null
    street_address      = null
    locality            = null
    province            = null
    country             = null
    postal_code         = null
    serial_number       = null
  }

  certificate_path = "certs/root-ca.crt"
  private_key_path = "certs/root-ca-key.pem"
}

module "bootstrap-ca" {
  source = "../modules/ca-locally-signed"

  signing_ca = jsondecode(jsonencode(module.root-ca.ca))

  subject = {
    common_name  = "Test Infrastructure Bootstrap CA"
    organization = "Test Infrastructure"

    organizational_unit = null
    street_address      = null
    locality            = null
    province            = null
    country             = null
    postal_code         = null
    serial_number       = null
  }

  certificate_path = "certs/bootstrap-ca.crt"
  private_key_path = "certs/bootstrap-ca-key.pem"
}
