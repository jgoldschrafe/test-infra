module "kubernetes-auth" {
  source = "../modules/vault-auth-kubernetes"

  kubernetes_config_context = var.kubernetes_config_context
}
