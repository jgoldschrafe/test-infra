data "terraform_remote_state" "bootstrap_pki" {
  backend = "local"

  config = {
    path = "../bootstrap-pki/terraform.tfstate"
  }
}
