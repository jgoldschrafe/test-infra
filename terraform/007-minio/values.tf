variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "minio_namespace" {
  description = "Kubernetes namespace for MinIO resources"
  type        = string
  default     = "minio"
}

output "minio_namespace" {
  description = "Kubernetes namespace for MinIO resources"
  value       = var.minio_namespace
}

output "minio_access_key" {
  description = "MinIO access key"
  sensitive   = true
  value       = random_password.access_key.result
}

output "minio_secret_key" {
  description = "MinIO secret key"
  sensitive   = true
  value       = random_password.secret_key.result
}
