#
# Remote state definitions
#

data "terraform_remote_state" "jenkins_storage" {
  backend = "local"

  config = {
    path = "../jenkins-storage/terraform.tfstate"
  }
}
