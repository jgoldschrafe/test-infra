variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "1.0.4"
}

variable "namespace" {
  description = "Kubernetes namespace for cert-manager resources"
  type        = string
}

variable "default_issuer" {
  description = "Default issuer to use for issuing certificates"
  type        = string
  default     = "default-issuer"
}

variable "vault_pki_path" {
  description = "Path of Vault PKI backend"
  type        = string
  default     = "pki"
}

variable "vault_url" {
  description = "URL to Vault, as reachable from an Issuer"
  type        = string
}

variable "extra_values" {
  description = "Extra values for the Helm chart"
  type        = list(string)
  default     = []
}
