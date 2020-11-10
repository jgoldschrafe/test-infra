variable "namespace" {
  description = "Kubernetes namespace for phpLDAPadmin resources"
  type        = string
  default     = "phpldapadmin"
}

variable "cluster_domain" {
  description = "Kubernetes cluster domain"
  type        = string
  default     = "cluster.local"
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "0.1.4"
}

variable "host" {
  description = "Hostname of phpLDAPadmin service"
  type        = string
}

variable "certificate" {
  description = "Certificate properties"
  type = object({
    issuer_ref = object({
      name  = string
      kind  = string
      group = string
    })
  })
}

variable "ldap_hosts" {
  description = "LDAP hosts"
  type        = list
}

variable "extra_values" {
  description = "Extra values for Helm chart"
  type        = list(string)
  default     = []
}
