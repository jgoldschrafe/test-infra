#
# Certificate resources
#

resource "kubernetes_manifest" "phabricator_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "phabricator-tls"
      namespace = "phabricator"
    }
    spec = {
      secretName = "phabricator-tls"
      commonName = "phabricator.test.local"
      dnsNames = [
        "phabricator.test.local"
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }

  depends_on = [kubernetes_namespace.phabricator]
}
