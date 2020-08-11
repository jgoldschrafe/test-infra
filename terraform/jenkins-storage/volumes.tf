#
# Data volume
#

resource "kubernetes_manifest" "jenkins_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "jenkins-data"
      namespace = "jenkins"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "jenkins-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/jenkins-data"
      }
    }
  }
}
