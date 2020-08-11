#
# Remote state definitions
#

data "terraform_remote_state" "rook_ceph_storage" {
  backend = "local"

  config = {
    path = "../rook-ceph-storage/terraform.tfstate"
  }
}
