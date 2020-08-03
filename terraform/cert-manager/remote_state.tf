#
# Terraform remote state
#

data "terraform_remote_state" "vault_config_auth_kubernetes" {
  backend = "local"

  config = {
    path = "../vault-config-auth-kubernetes/terraform.tfstate"
  }
}

data "terraform_remote_state" "vault_config_pki" {
  backend = "local"

  config = {
    path = "../vault-config-pki/terraform.tfstate"
  }
}
