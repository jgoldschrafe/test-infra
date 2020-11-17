data "terraform_remote_state" "pki" {
  backend = "local"

  config = {
    path = "../005-pki/terraform.tfstate"
  }
}
