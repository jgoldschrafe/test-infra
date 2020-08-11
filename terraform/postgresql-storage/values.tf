output "namespace" {
  value = kubernetes_namespace.postgresql.metadata[0].name
}

output "data_volume_storage_class" {
  value = "postgresql-data"
}
