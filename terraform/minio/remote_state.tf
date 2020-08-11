#
# Remote state definitions
#

data "terraform_remote_state" "minio_storage" {
  backend = "local"

  config = {
    path = "../minio-storage/terraform.tfstate"
  }
}
