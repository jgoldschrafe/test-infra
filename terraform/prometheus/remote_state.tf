#
# Remote state definitions
#

data "terraform_remote_state" "prometheus_storage" {
  backend = "local"

  config = {
    path = "../prometheus-storage/terraform.tfstate"
  }
}
