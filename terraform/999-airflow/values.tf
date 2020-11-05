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

variable "issuer_ref" {
  description = "issuerRef for Certificate resources"
  type        = map
  default = {
    name  = "default-issuer"
    kind  = "ClusterIssuer"
    group = "cert-manager.io"
  }
}
