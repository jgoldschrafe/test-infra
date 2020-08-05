output "prometheus_namespace" {
  value = kubernetes_namespace.prometheus.metadata[0].name
}

# FIXME: Replace with resource property reference when properly supported by
# kubernetes-alpha provider
output "alertmanager_volume_storage_class" {
  value = "alertmanager-data"
}

# FIXME: Replace with resource property reference when properly supported by
# kubernetes-alpha provider
output "prometheus_volume_storage_class" {
  value = "prometheus-data"
}

# FIXME: Replace with resource property reference when properly supported by
# kubernetes-alpha provider
output "pushgateway_volume_storage_class" {
  value = "pushgateway-data"
}
