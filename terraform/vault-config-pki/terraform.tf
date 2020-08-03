#
# Terraform project meta-configuration
#

provider "local" {
  version = "~> 1.4"
}

provider "tls" {
  version = "~> 2.2"
}

provider "vault" {
  version = "~> 2.12"

  address = "https://vault.test.local"
}
