locals {
  domain_dn = join(",", formatlist("dc=%s", split(".", var.domain)))
}

variable "admin_dn" {
  description = "DN for LDAP admin user"
  type        = string
}

variable "admin_password" {
  description = "Password for LDAP admin user"
  type        = string
  default     = null
}

variable "bind_dn" {
  description = "Distinguished Name (DN) for the LDAP bind user"
  type        = string
}

variable "bind_password" {
  description = "Password for the LDAP bind user"
  type        = string
}

variable "bind_password_crypted" {
  description = "Password for the LDAP bind user, crypted like a userPassword"
  type        = string
}

variable "config_password" {
  description = "Password for LDAP config user"
  type        = string
  default     = null
}

variable "namespace" {
  description = "Kubernetes namespace for OpenLDAP resources"
  type        = string
  default     = "openldap"
}

variable "cluster_domain" {
  description = "Kubernetes cluster domain"
  type        = string
  default     = "cluster.local"
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "1.2.5"
}

variable "domain" {
  description = "LDAP domain"
  type        = string
}

variable "organization" {
  description = "LDAP organization"
  type        = string
  default     = null
}

variable "host" {
  description = "External TLS hostname of the LDAP server"
  type        = string
}

variable "certificate" {
  description = "Properties for the generated TLS certificate"
  type = object({
    issuer_ref = object({
      name  = string
      kind  = string
      group = string
    })
  })
}

variable "extra_values" {
  description = "Extra values for the Helm chart"
  type        = list(string)
  default     = []
}
