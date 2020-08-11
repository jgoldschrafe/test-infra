resource "kubernetes_manifest" "gitlab_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "gitlab-tls"
      namespace = "gitlab"
    }
    spec = {
      secretName = "gitlab-tls"
      commonName = "gitlab.test.local"
      dnsNames = [
        "gitlab.test.local"
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
