#
# Terraform project meta-configuration
#

provider "helm" {
  version = "~> 1.2"
}

provider "kubernetes" {
  version = "~> 1.11"

  config_context = "docker-desktop"
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}
