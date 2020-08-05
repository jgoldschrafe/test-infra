#
# Alertmanager
#

resource "kubernetes_manifest" "alertmanager_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "alertmanager-data"
      namespace = "prometheus"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "alertmanager-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/alertmanager-data"
      }
    }
  }
}

#
# Prometheus
#

resource "kubernetes_manifest" "prometheus_data_volume" {
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

#
# Pushgateway
#

resource "kubernetes_manifest" "pushgateway_data_volume" {
  provider = kubernetes-alpha

  manifest = {
    kind = "PersistentVolume"
    apiVersion = "v1"
    metadata = {
      name = "pushgateway-data"
      namespace = "prometheus"
      labels = {
        type = "local"
      }
    }
    spec = {
      storageClassName = "pushgateway-data"
      capacity = {
        storage = "10Gi"
      }
      accessModes = ["ReadWriteOnce"]
      hostPath = {
        path = "/Users/jeff/Kubernetes/Volumes/pushmanager-data"
      }
    }
  }
}
