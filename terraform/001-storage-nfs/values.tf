variable "nfs_client_provisioner_namespace" {
  description = "Kubernetes namespace for NFS client provisioner resources"
  type        = string
  default     = "nfs-client-provisioner"
}

variable "nfs_client_provisioner_server" {
  description = "NFS client provisioner server"
  type        = string
}

variable "nfs_client_provisioner_path" {
  description = "NFS client provisioner path"
  type        = string
}
