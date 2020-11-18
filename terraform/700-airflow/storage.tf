resource "kubernetes_persistent_volume_claim" "airflow" {
  metadata {
    namespace = module.airflow-namespace.name
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

resource "kubernetes_persistent_volume_claim" "airflow-logs" {
  metadata {
    namespace = module.airflow-namespace.name
    name      = "airflow-logs"
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
