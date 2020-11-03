#
# cert-manager Certificate resources
#

resource "kubernetes_manifest" "airflow_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "airflow-tls"
      namespace = "airflow"
    }
    spec = {
      secretName = "airflow-tls"
      commonName = "airflow.test.local"
      dnsNames = [
        "airflow.test.local",
        "airflow",
        "airflow.airflow",
        "airflow.airflow.svc",
        "airflow.airflow.svc.cluster",
        "airflow.airflow.svc.cluster.local",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
