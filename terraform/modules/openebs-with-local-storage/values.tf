variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "1.12.3"
}

variable "namespace" {
  description = "Kubernetes namespace for OpenEBS resources"
  type        = string
}

variable "volume_root_path" {
  description = "Root path for volumes managed by OpenEBS"
  type        = string
}
