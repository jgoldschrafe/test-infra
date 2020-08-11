#
# Data volume
#

resource "kubernetes_manifest" "postgresql_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "postgresql-data"
      namespace = "postgresql"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "postgresql-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/postgresql-data"
      }
    }
  }
}
