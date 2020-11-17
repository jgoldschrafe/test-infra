variable "phpldapadmin_namespace" {
  description = "Kubernetes namespace for phpLDAPadmin resources"
  type        = string
  default     = "phpldapadmin"
}

variable "cert_manager_issuer" {
  description = "cert-manager issuer for generated certificates"
  type = object({
    name  = string
    kind  = string
    group = string
  })
}
