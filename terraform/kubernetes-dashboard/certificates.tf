resource "kubernetes_manifest" "kubernetes_dashboard_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "kubernetes-dashboard-tls"
      namespace = "kubernetes-dashboard"
    }
    spec = {
      secretName = "kubernetes-dashboard-tls"
      commonName = "kubernetes-dashboard.test.local"
      dnsNames = [
        "kubernetes-dashboard.test.local",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
