variable "name" {
  description = "The Kubernetes namespace for MinIO resources. If empty, generate one."
  default     = null
}

output "name" {
  description = "The Kubernetes namespace for MinIO resources"
  value       = kubernetes_namespace.namespace.metadata[0].name
}
