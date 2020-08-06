#
# Data volume
#

resource "kubernetes_manifest" "loki_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "loki-data"
      namespace = "loki"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "loki-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/loki-data"
      }
    }
  }
}
