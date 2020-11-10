variable "namespace" {
  description = "Kubernetes namespace for Consul resources"
  type        = string
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "v0.25.0"
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

variable "ingress_gateway_http_node_port" {
  description = "HTTP port for ingress gateway"
  type        = number
  default     = null
}

variable "ingress_gateway_https_node_port" {
  description = "HTTPS port for ingress gateway"
  type        = number
  default     = null
}
