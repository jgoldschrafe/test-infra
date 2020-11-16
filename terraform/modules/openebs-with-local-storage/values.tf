variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "2.2.1"
}

variable "namespace" {
  description = "Kubernetes namespace for OpenEBS resources"
  type        = string
}

variable "volume_root_path" {
  description = "Root path for volumes managed by OpenEBS"
  type        = string
}
