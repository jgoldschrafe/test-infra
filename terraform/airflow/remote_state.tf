#
# Remote state definitions
#

data "terraform_remote_state" "consul_storage" {
  backend = "local"

  config = {
    path = "../consul-storage/terraform.tfstate"
  }
}
