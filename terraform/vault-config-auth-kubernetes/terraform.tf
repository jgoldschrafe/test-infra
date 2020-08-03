#
# Terraform project meta-configuration
#

provider "vault" {
  version = "~> 2.12"

  address = "https://vault.test.local"
}
