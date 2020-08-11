#
# Remote state definitions
#

data "terraform_remote_state" "gitlab_storage" {
  backend = "local"

  config = {
    path = "../gitlab-storage/terraform.tfstate"
  }
}
