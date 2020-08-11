#
# Terraform project meta-configuration
#

provider "helm" {
  version = "~> 1.2"
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}
