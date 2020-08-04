resource "kubernetes_manifest" "phpldapadmin_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "phpldapadmin-tls"
      namespace = "phpldapadmin"
    }
    spec = {
      secretName = "phpldapadmin-tls"
      commonName = "phpldapadmin.test.local"
      dnsNames = [
        "phpldapadmin.test.local"
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
