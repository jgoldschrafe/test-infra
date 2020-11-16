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

variable "nfs_client_provisioner_server" {
  description = "NFS client provisioner server"
  type        = string
}

variable "nfs_client_provisioner_path" {
  description = "NFS client provisioner path"
  type        = string
}

output "root_ca" {
  description = "Root CA"
  value       = module.root-ca.ca
}

output "bootstrap_ca" {
  description = "Bootstrap CA"
  value       = module.bootstrap-ca.ca
}

output "vault_namespace" {
  description = "Kubernetes namespace for Vault resources"
  value       = module.vault-namespace.name
}
