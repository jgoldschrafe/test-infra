variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "postgresql_namespace" {
  description = "Kubernetes namespace for PostgreSQL resources"
  type        = string
  default     = "postgresql"
}
