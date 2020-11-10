locals {
  podAnnotations = {
    "consul.hashicorp.com/connect-inject" = var.inject ? "true" : "false"
    "consul.hashicorp.com/connect-service" = var.service
    "consul.hashicorp.com/connect-service-port" = var.service_port != null ? tostring(var.service_port) : null
    "consul.hashicorp.com/connect-service-upstreams" = var.service_upstreams
  }
}

variable "inject" {
  description = "Whether to inject the Consul sidecar"
  type        = bool
  default     = true
}

variable "service" {
  description = "Service to join to the mesh"
  type        = string
  default     = null
}

variable "service_port" {
  description = "Service port to join to the mesh"
  type        = number
  default     = null
}

variable "service_upstreams" {
  description = "List of service upstreams"
  type        = string
  default     = null
}

output "values" {
  description = "Values to inject into Helm charts"
  value = {
    podAnnotations = {
      for key in keys(local.podAnnotations):
      key => local.podAnnotations[key]
      if local.podAnnotations[key] != null
    }
  }
}
