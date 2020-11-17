locals {
  cluster_domain_components = split(".", var.cluster_domain)
}

variable "namespace" {
  description = "Kubernetes namespace for Docker Registry resources"
  type        = string
}

variable "cluster_domain" {
  description = "Kubernetes cluster domain name"
  type        = string
  default     = "cluster.local"
}

variable "host" {
  description = "Hostname for registry"
  type        = string
}

variable "certificate" {
  description = "Properties for generated TLS certificate"
  type = object({
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
  default     = "1.9.6"
}

variable "extra_values" {
  description = "Extra values for the Helm chart"
  type        = list(string)
  default     = []
}
