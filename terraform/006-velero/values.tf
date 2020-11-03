variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "velero_namespace" {
  description = "Kubernetes namespace for Velero resources"
  type        = string
  default     = "velero"
}
