resource "kubernetes_manifest" "openldap_storage_class" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "openldap-data"
      namespace = "openldap"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "openldap-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/openldap-data"
      }
    }
  }
}
