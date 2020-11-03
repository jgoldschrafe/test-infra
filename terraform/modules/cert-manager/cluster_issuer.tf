resource "kubernetes_service_account" "default_issuer" {
  metadata {
    namespace = var.namespace
    name      = var.default_issuer
  }
}

resource "kubernetes_manifest" "cert_manager_default_issuer" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind       = "ClusterIssuer"
    metadata = {
      name = var.default_issuer
    }
    spec = {
      vault = {
        server = var.vault_url
        path   = "${var.vault_pki_path}/sign/${var.default_issuer}"
        auth = {
          kubernetes = {
            mountPath = "/v1/auth/kubernetes"
            role      = "default-issuer"
            secretRef = {
              name = kubernetes_service_account.default_issuer.default_secret_name
              key  = "token"
            }
          }
        }
      }
    }
  }
}
