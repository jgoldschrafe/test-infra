#
# Helm release for Rook Ceph operator
#

resource "helm_release" "rook-ceph" {
  namespace = "rook-ceph"
  name      = "rook-ceph"

  repository = "https://charts.rook.io/release"
  chart      = "rook-ceph"
  version    = "v1.4.0"

  values = [
    "${file("values.yaml")}"
  ]
}
