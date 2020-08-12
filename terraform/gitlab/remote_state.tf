#
# Remote state definitions
#

data "terraform_remote_state" "gitlab_storage" {
  backend = "local"

  config = {
    path = "../gitlab-storage/terraform.tfstate"
  }
}

data "terraform_remote_state" "minio" {
  backend = "local"

  config = {
    path = "../minio/terraform.tfstate"
  }
}

data "terraform_remote_state" "postgresql" {
  backend = "local"

  config = {
    path = "../postgresql/terraform.tfstate"
  }
}

