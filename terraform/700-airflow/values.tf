variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "airflow_dags_storage_class" {
  description = "Storage class for Airflow DAGs shared volume"
  type        = string
}

variable "airflow_dags_repo" {
  description = "Git repository containing Airflow DAGs"
  type        = string
  default     = "airflow"
}

variable "airflow_namespace" {
  description = "Kubernetes namespace for Airflow resources"
  type        = string
  default     = "airflow"
}

variable "airflow_postgresql_vault_secret" {
  description = "Vault secret storing Airflow PostgreSQL credentials"
  type        = string
}

variable "issuer_ref" {
  description = "issuerRef for Certificate resources"
  type        = map
  default = {
    name  = "default-issuer"
    kind  = "ClusterIssuer"
    group = "cert-manager.io"
  }
}
