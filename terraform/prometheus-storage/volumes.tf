resource "kubernetes_manifest" "prometheus_storage_class" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "prometheus-data"
      namespace = "prometheus"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "prometheus-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/prometheus-data"
      }
    }
  }
}
