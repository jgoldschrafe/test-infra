output "namespace" {
  value = kubernetes_namespace.gitlab.metadata[0].name
}

output "data_volume_storage_class" {
  value = "gitlab-data"
}
