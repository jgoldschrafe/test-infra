#
# Data volume
#

resource "kubernetes_manifest" "grafana_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "grafana-data"
      namespace = "grafana"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "grafana-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/grafana-data"
      }
    }
  }
}
