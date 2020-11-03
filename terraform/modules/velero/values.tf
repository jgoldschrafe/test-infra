variable "namespace" {
  description = "Kubernetes namespace for MinIO resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "2.13.6"
}

variable "values" {
  description = "Extra values for the Helm chart"
  type        = string
  default     = ""
}
