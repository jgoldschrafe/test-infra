data "terraform_remote_state" "core-infra" {
  backend = "local"

  config = {
    path = "../000-core-infra/terraform.tfstate"
  }
}
