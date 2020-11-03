module "vault-pki-engine" {
  source = "../modules/vault-pki-engine"

  signing_ca = data.terraform_remote_state.core-infra.outputs.root_ca

  subject = {
    common_name  = "Test Infrastructure Intermediate CA"
    organization = "Test Infrastructure"

    organizational_unit = null
    street_address      = null
    locality            = null
    province            = null
    country             = null
    postal_code         = null
    serial_number       = null
  }

  certificate_path = "certs/intermediate-ca.crt"
  private_key_path = "certs/intermediate-ca-key.pem"
}
