variable "certificate" {
  description = "Properties of the cluster-generated certificate"
  type = object({
    common_name = string
    dns_names   = list(string)
    issuer_ref = object({
      name  = string
      kind  = string
      group = string
    })
  })
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "7.13.1"
}

variable "namespace" {
  description = "Kubernetes namespace for Airflow resources"
  type        = string
}
