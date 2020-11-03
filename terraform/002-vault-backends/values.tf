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

variable "vault_skip_tls_verify" {
  description = "Whether to disable TLS verification of the Vault server (recommended at this stage)"
  type        = bool
  default     = true
}
