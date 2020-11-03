variable "pki_path" {
  description = "Path to the PKI mount point"
  type = string
  default = "pki"
}

variable "issuer_name" {
  description = "Name of issuer"
  type = string
  default = "default-issuer"
}

variable "kubernetes_path" {
  description = "Kubernetes path"
  type = string
  default = "kubernetes"
}
