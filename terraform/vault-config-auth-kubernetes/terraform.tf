#
# Terraform project meta-configuration
#

provider "local" {
  version = "~> 1.4.0"
}

provider "null" {
  version = "~> 2.1.2"
}

provider "vault" {
  version = "~> 2.12"

  address = "https://vault.test.local"
}
