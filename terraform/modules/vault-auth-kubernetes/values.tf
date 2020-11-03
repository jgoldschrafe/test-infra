variable "kubernetes_config_context" {
  description = "Config context to provide to the hashicorp/kubernetes provider"
  type        = string
  default     = "docker-desktop"
}

variable "tmpdir" {
  description = "Path to temporary directory to store Kubernetes state files"
  default     = "./tmp"
}
