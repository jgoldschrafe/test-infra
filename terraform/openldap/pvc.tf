resource "kubernetes_persistent_volume_claim" "openldap" {
  metadata {
    name      = "openldap"
    namespace = kubernetes_namespace.openldap.metadata[0].name
  }

  spec {
    storage_class_name = "openebs-hostpath"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
  }

  wait_until_bound = false
}
