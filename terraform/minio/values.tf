output "namespace" {
  value = kubernetes_namespace.minio.metadata[0].name
}
