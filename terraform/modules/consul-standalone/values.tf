variable "namespace" {
  description = "Kubernetes namespace for Consul resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "0.26.0"
}

variable "domain" {
  description = "Consul domain"
  type        = string
  default     = "consul"
}

variable "datacenter" {
  description = "Consul datacenter"
  type        = string
  default     = "dc1"
}

variable "dns_ip" {
  description = "IP address of DNS service"
  type        = string
  default     = "10.99.247.81"
}
