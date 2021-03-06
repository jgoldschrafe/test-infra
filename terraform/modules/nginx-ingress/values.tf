variable "chart_version" {
  description = "Helm chart version for nginx-ingress"
  type        = string
  default     = "0.6.0"
}

variable "namespace" {
  description = "Kubernetes namespace for nginx-ingress resources"
  type        = string
}

variable "values" {
  description = "Extra values for the Helm chart"
  type        = map
  default     = {}
}
