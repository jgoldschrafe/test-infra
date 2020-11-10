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

variable "postgresql_postgres_vault_secret" {
  description = "Vault secret to store generated PostgreSQL password"
  type        = string
}
