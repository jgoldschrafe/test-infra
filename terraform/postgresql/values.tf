output "namespace" {
  value = kubernetes_namespace.postgresql.metadata[0].name
}
