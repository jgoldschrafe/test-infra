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

output "nginx_ingress_namespace" {
  description = "Kubernetes namespace for nginx-ingress resources"
  value       = module.nginx-ingress-namespace.name
}

output "vault_namespace" {
  description = "Kubernetes namespace for Vault resources"
  value       = module.vault-namespace.name
}
