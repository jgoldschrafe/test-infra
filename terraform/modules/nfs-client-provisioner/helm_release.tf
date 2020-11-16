resource "helm_release" "nfs-client-provisioner" {
  namespace = var.namespace
  name      = "nfs-client-provisioner"

  # repository = "https://charts.rimusz.net"
  # chart      = "nfs-client-provisioner"
  chart      = "../../charts/nfs-client-provisioner"
  version    = var.chart_version

  values = concat(
    [
      jsonencode({
        nfs = {
          path   = var.nfs_path
          server = var.nfs_server
        }

        storageClass = {
          name = var.storage_class_name
        }
      }),
    ],
    var.extra_values,
  )
}
