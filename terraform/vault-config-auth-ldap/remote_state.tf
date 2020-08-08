data "terraform_remote_state" "vault_config_pki" {
  backend = "local"

  config = {
    path = "../vault-config-pki/terraform.tfstate"
  }
}
