variable "name" {
  description = "Name of issuer"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for cert-manager resources"
  type        = string
}

variable "vault_pki_path" {
  description = "Path to the PKI mount point"
  type        = string
  default     = "pki"
}

variable "vault_kubernetes_path" {
  description = "Kubernetes path"
  type        = string
  default     = "kubernetes"
}

variable "vault_url" {
  description = "URL to Vault service, as accessible from cert-manager"
  type        = string
  default     = "http://vault.vault:8200" # FIXME: plz encrypt
}
