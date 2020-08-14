#
# Terraform project meta-configuration
#

provider "consul" {
  version = "~> 2.9"

  address    = "localhost:18500" # FIXME
  datacenter = "dc1"
}
