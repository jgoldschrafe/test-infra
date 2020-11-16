variable "namespace" {
  description = "Namespace for NFS Client Provisioner resources"
  type        = string
  default     = "nfs-client-provisioner"
}

variable "chart_version" {
  description = "Helm chart version to install"
  type        = string
  default     = "0.1.4"
}

variable "nfs_server" {
  description = "NFS server to provision under"
  type        = string
}

variable "nfs_path" {
  description = "NFS path to provision under"
  type        = string
}

variable "storage_class_name" {
  description = "Storage class name to associate to NFS server/path"
  type        = string
  default     = "nfs"
}

variable "extra_values" {
  description = "Extra values for the Helm chart"
  type        = list(string)
  default     = []
}
