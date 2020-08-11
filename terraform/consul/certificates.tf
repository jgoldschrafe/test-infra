#
# cert-manager Certificate resources
#

resource "kubernetes_manifest" "consul_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "consul-tls"
      namespace = "consul"
    }
    spec = {
      secretName = "consul-tls"
      commonName = "consul.test.local"
      dnsNames = [
        "consul.test.local",
        "consul",
        "consul.consul",
        "consul.consul.svc",
        "consul.consul.svc.cluster",
        "consul.consul.svc.cluster.local",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
