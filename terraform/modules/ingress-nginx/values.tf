variable "chart_version" {
  description = "Helm chart version for ingress-nginx"
  type        = string
  default     = "3.8.0"
}

variable "namespace" {
  description = "Kubernetes namespace for ingress-nginx resources"
  type        = string
}

variable "values" {
  description = "Extra values for the Helm chart"
  type        = map
  default     = {}
}
