#
# Remote state definitions
#

data "terraform_remote_state" "postgresql_storage" {
  backend = "local"

  config = {
    path = "../postgresql-storage/terraform.tfstate"
  }
}
