#
# Remote state definitions
#

data "terraform_remote_state" "loki_storage" {
  backend = "local"

  config = {
    path = "../loki-storage/terraform.tfstate"
  }
}
