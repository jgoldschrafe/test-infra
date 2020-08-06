#
# Alertmanager
#

resource "kubernetes_manifest" "alertmanager_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "alertmanager-tls"
      namespace = "prometheus"
    }
    spec = {
      secretName = "alertmanager-tls"
      commonName = "alertmanager.test.local"
      dnsNames = [
        "alertmanager.test.local",
      ]
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}

#
# Prometheus
#

resource "kubernetes_manifest" "prometheus_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "prometheus-tls"
      namespace = "prometheus"
    }
    spec = {
      secretName = "prometheus-tls"
      commonName = "prometheus.test.local"
      dnsNames = [
        "prometheus.test.local",
      ]
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}

#
# Pushgateway
#

resource "kubernetes_manifest" "pushgateway_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "pushgateway-tls"
      namespace = "prometheus"
    }
    spec = {
      secretName = "pushgateway-tls"
      commonName = "pushgateway.test.local"
      dnsNames = [
        "pushgateway.test.local"
      ]
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
