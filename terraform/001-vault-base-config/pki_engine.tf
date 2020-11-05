module "vault-pki-engine" {
  source = "../modules/vault-pki-engine"

  signing_ca = data.terraform_remote_state.core-infra.outputs.root_ca

  ca = var.vault_ca

  certificate_path = "certs/intermediate-ca.crt"
  private_key_path = "certs/intermediate-ca-key.pem"
}
