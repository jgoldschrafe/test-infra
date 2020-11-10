resource "kubernetes_persistent_volume_claim" "openldap" {
  metadata {
    namespace = var.namespace
    name      = "openldap"
  }

  spec {
    storage_class_name = "openebs-hostpath"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }

  wait_until_bound = false
}
