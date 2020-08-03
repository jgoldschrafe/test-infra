#
# Remote state definitions
#

data "terraform_remote_state" "openldap_storage" {
  backend = "local"

  config = {
    path = "../openldap-storage/terraform.tfstate"
  }
}
