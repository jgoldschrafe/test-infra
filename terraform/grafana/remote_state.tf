#
# Remote state definitions
#

data "terraform_remote_state" "grafana_storage" {
  backend = "local"

  config = {
    path = "../grafana-storage/terraform.tfstate"
  }
}
