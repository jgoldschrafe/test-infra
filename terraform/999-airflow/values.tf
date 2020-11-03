variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "airflow_namespace" {
  description = "Kubernetes namespace for Airflow resources"
  type        = string
  default     = "airflow"
}
