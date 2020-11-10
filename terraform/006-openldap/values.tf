variable "openldap_namespace" {
  description = "Kubernetes namespace for OpenLDAP resources"
  type        = string
  default     = "openldap"
}

variable "cert_manager_issuer" {
  description = "cert-manager issuer for generated certificates"
  type = object({
    name  = string
    kind  = string
    group = string
  })
}

variable "openldap_admin_vault_secret" {
  description = "Vault secret storing admin credentials"
  type        = string
  default     = "openldap/admin"
}

variable "openldap_bind_vault_secret" {
  description = "Vault secret storing bind credentials"
  type        = string
  default     = "openldap/bind"
}

variable "openldap_config_vault_secret" {
  description = "Vault secret storing config credentials"
  type        = string
  default     = "openldap/config"
}
