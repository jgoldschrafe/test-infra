data "terraform_remote_state" "minio" {
  backend = "local"

  config = {
    path = "../005-minio/terraform.tfstate"
  }
}
