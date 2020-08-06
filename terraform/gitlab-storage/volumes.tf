#
# Data volume
#

resource "kubernetes_manifest" "gitlab_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "gitlab-data"
      namespace = "gitlab"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "gitlab-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/gitlab-data"
      }
    }
  }
}
