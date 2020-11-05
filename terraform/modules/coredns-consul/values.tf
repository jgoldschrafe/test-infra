variable "cluster_domain" {
  description = "Cluster domain name"
  type        = string
  default     = "cluster.local"
}

variable "consul_dns_ip" {
  description = "Cluster IP of the Consul DNS service"
  type        = string
  default     = "10.99.247.81"
}
