#
# Terraform project meta-configuration
#

provider "kubernetes" {
  version = "~> 1.11"

  config_context = "docker-desktop"
}
