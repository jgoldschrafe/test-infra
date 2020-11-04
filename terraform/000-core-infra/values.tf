variable "ingress_http_port" {
  description = "HTTP port for ingress"
  type        = number
  default     = 30080
}

variable "ingress_https_port" {
  description = "HTTPS port for ingress"
  type        = number
  default     = 30443
}

variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "vault_address" {
  description = "Address of HashiCorp Vault server"
  type        = string
  default     = "https://vault.test.local:30443"
}

output "root_ca" {
  description = "Root CA"
  value       = module.root-ca.ca
}

output "bootstrap_ca" {
  description = "Bootstrap CA"
  value       = module.bootstrap-ca.ca
}

output "ingress_nginx_namespace" {
  description = "Kubernetes namespace for ingress-nginx resources"
  value       = module.ingress-nginx-namespace.name
}

output "vault_namespace" {
  description = "Kubernetes namespace for Vault resources"
  value       = module.vault-namespace.name
}
