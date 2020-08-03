resource "kubernetes_service_account" "default_issuer" {
  metadata {
    namespace = "cert-manager"
    name      = "default-issuer"
  }
}

resource "kubernetes_manifest" "cert_manager_default_issuer" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "ClusterIssuer"
    metadata = {
      name = "default-issuer"
    }
    spec = {
      vault = {
        server = "http://vault.vault:8200"
        path = "pki/sign/default-issuer"
        auth = {
          kubernetes = {
            mountPath = "/v1/auth/kubernetes"
            role = "default-issuer"
            secretRef = {
              name = kubernetes_service_account.default_issuer.default_secret_name
              key = "token"
            }
          }
        }
      }
    }
  }
}
