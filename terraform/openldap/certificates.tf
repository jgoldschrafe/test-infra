resource "kubernetes_manifest" "openldap_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "openldap-tls"
      namespace = "openldap"
    }
    spec = {
      secretName = "openldap-tls"
      commonName = "ldap.test.local"
      dnsNames = [
        "ldap.test.local"
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
