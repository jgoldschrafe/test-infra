variable "kubernetes_config_context" {
  description = "Kubernetes config context"
  type        = string
}

variable "vault_ca" {
  description = "Vault CA configuration properties"
  type        = object({
    subject = object({
      common_name         = string
      organization        = string
      organizational_unit = string
      street_address      = list(string)
      locality            = string
      province            = string
      country             = string
      postal_code         = string
      serial_number       = string
    })
  })
}
