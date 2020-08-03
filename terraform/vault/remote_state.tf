#
# Remote state definitions
#

data "terraform_remote_state" "bootstrap_pki" {
  backend = "local"

  config = {
    path = "../bootstrap-pki/terraform.tfstate"
  }
}

data "terraform_remote_state" "vault_storage" {
  backend = "local"

  config = {
    path = "../vault-storage/terraform.tfstate"
  }
}
