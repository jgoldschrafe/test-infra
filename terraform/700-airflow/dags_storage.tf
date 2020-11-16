resource "kubernetes_persistent_volume_claim" "airflow" {
  metadata {
    namespace = var.airflow_namespace
    name      = "airflow"
  }

  spec {
    storage_class_name = "nfs-local"
    access_modes       = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
