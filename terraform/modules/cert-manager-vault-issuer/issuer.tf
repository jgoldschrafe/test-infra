resource "kubernetes_manifest" "cert_manager_default_issuer" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind       = "ClusterIssuer"
    metadata = {
      name = var.name
    }
    spec = {
      vault = {
        server = var.vault_url
        path   = "${var.vault_pki_path}/sign/${var.name}"
        auth = {
          kubernetes = {
            mountPath = "/v1/auth/kubernetes"
            role      = vault_pki_secret_backend_role.issuer.name
            secretRef = {
              name = kubernetes_service_account.issuer.default_secret_name
              key  = "token"
            }
          }
        }
      }
    }
  }
}

