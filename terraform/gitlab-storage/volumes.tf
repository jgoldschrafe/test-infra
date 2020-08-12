#
# Data volume
#

resource "kubernetes_manifest" "gitlab_gitaly_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "gitlab-gitaly-data"
      namespace = "gitlab"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "gitlab-gitaly-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/gitlab-gitaly-data"
      }
    }
  }
}

resource "kubernetes_manifest" "gitlab_redis_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "gitlab-redis-data"
      namespace = "gitlab"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "gitlab-redis-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/gitlab-redis-data"
      }
    }
  }
}

