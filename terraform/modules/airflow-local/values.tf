locals {
  cluster_domain_components = split(".", var.cluster_domain)
}

variable "flower" {
  description = "Flower configuration"
  type = object({
    host = string
    certificate = object({
      issuer_ref = object({
        name  = string
        kind  = string
        group = string
      })
    })
  })
}

variable "web" {
  description = "Web server configuration"
  type = object({
    base_url = string
    host     = string
    certificate = object({
      issuer_ref = object({
        name  = string
        kind  = string
        group = string
      })
    })
  })
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "7.14.0"
}

variable "cluster_domain" {
  description = "Kubernetes cluster domain name"
  type        = string
  default     = "cluster.local"
}

variable "namespace" {
  description = "Kubernetes namespace for Airflow resources"
  type        = string
}

variable "extra_values" {
  description = "Extra values for the Helm chart"
  type        = list(string)
  default     = []
}
