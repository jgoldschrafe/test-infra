variable "consul_namespace" {
  description = "Kubernetes namespace for Consul resources"
  type        = string
  default     = "consul"
}

variable "consul_ingress_gateway_http_node_port" {
  description = "HTTP node port for Consul ingress gateway"
  type        = number
  default     = null
}

variable "consul_ingress_gateway_https_node_port" {
  description = "HTTPS node port for Consul ingress gateway"
  type        = number
  default     = null
}
