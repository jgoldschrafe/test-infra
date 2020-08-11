#
# Data volume
#

resource "kubernetes_manifest" "minio_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "minio-data"
      namespace = "minio"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "minio-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/minio-data"
      }
    }
  }
}
