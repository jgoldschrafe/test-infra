module "vault-pki-engine" {
  source = "../modules/vault-pki-engine"

  signing_ca = data.terraform_remote_state.pki.outputs.root_ca

  ca = {
    subject = {
      common_name         = "Test Infrastructure Intermediate CA"
      organization        = "Test Infrastructure"
      organizational_unit = null
      street_address      = null
      locality            = null
      province            = null
      country             = null
      postal_code         = null
      serial_number       = null
    }
  }

  certificate_path       = "certs/intermediate-ca.crt"
  certificate_chain_path = "certs/intermediate-ca-chain.pem"
  private_key_path       = "certs/intermediate-ca-key.pem"
}
