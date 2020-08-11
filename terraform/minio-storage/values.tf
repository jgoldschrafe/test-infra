output "namespace" {
  value = kubernetes_namespace.minio.metadata[0].name
}

output "data_volume_storage_class" {
  value = "minio-data"
}
