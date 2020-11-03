variable "certificate" {
  description = "Settings for the Vault TLS certificate"
  type = object({
    signing_ca = object({
      key_algorithm   = string
      private_key_pem = string
      cert_pem        = string
      cert_chain      = string
    })

    subject = object({
      common_name  = string
      organization = string
    })

    dns_names = list(string)
  })
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "0.6.0"
}

variable "namespace" {
  description = "Kubernetes namespace for Vault resources"
  type        = string
}

variable "values" {
  description = "Additional values to apply to the Helm chart"
  type        = map
  default     = {}
}
