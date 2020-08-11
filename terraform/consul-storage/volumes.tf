resource "kubernetes_manifest" "consul_storage_class" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "consul-data"
      namespace = "consul"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "consul-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/consul-data"
      }
    }
  }
}
