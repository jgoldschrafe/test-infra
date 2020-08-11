#
# cert-manager Certificate resources
#

resource "kubernetes_manifest" "loki_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "loki-tls"
      namespace = "loki"
    }
    spec = {
      secretName = "loki-tls"
      commonName = "loki.test.local"
      dnsNames = [
        "loki.test.local",
        "loki",
        "loki.loki",
        "loki.loki.svc",
        "loki.loki.svc.cluster",
        "loki.loki.svc.cluster.local",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
