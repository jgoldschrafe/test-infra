variable "namespace" {
  description = "Kubernetes namespace for PostgreSQL resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "9.1.4"
}

variable "postgres_password" {
  description = "Password for the postgres user account"
  type        = string
  default     = null
}

variable "extra_values" {
  description = "Extra values for Helm chart"
  type        = list(string)
  default     = []
}
