resource "kubernetes_manifest" "vault_storage_class" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "vault-data"
      namespace = "vault"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "vault-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/vault-data"
      }
    }
  }
}
