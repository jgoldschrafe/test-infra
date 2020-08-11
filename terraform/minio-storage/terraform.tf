#
# Terraform project meta-configuration
#

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}

provider "kubernetes" {
  version = "~> 1.11"

  config_context = "docker-desktop"
}
