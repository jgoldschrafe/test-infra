variable "namespace" {
  description = "Kubernetes namespace for MinIO resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "6.0.4"
}

variable "access_key" {
  description = "The access key for the MinIO instance"
  type        = string
}

variable "secret_key" {
  description = "The secret key for the MinIO instance"
  type        = string
}

variable "buckets" {
  description = "List of buckets for the Helm chart"
  type        = list(map(any))
  default     = []
}
