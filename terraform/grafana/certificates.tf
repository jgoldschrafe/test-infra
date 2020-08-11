#
# cert-manager Certificate resources
#

resource "kubernetes_manifest" "grafana_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "grafana-tls"
      namespace = "grafana"
    }
    spec = {
      secretName = "grafana-tls"
      commonName = "grafana.test.local"
      dnsNames = [
        "grafana.test.local",
        "grafana",
        "grafana.grafana",
        "grafana.grafana.svc",
        "grafana.grafana.svc.cluster",
        "grafana.grafana.svc.cluster.local",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
