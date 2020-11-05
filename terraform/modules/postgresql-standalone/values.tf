variable "namespace" {
  description = "Kubernetes namespace for PostgreSQL resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "9.1.4"
}

variable "values" {
  description = "Extra values for Helm chart"
  type        = string
  default     = ""
}
