locals {
  cluster_domain_components = split(".", var.cluster_domain)
}

variable "cluster_domain" {
  description = "Kubernetes cluster domain name"
  type        = string
  default     = "cluster.local"
}

variable "namespace" {
  description = "Kubernetes namespace for certificate resource"
  type        = string
}

variable "common_name" {
  description = "Common name for issued certificate"
  type        = string
}

variable "hosts" {
  description = "Hosts for certificate (not including Kubernetes internal hostnames)"
  type        = list(string)
  default     = []
}

variable "service" {
  description = "Kubernetes service name"
  type        = string
}

variable "issuer_ref" {
  description = "issuerRef for cert-manager Certificate resource"
  type        = object({
    name = string
    kind = string
    group = string
  })
}
