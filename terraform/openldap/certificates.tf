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
        "ldap.test.local",
        "openldap.openldap.svc.cluster.local",
        "openldap.openldap.svc.cluster",
        "openldap.openldap.svc",
        "openldap.openldap",
        "openldap",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
