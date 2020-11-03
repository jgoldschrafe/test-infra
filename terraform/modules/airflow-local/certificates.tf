resource "kubernetes_manifest" "airflow_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "airflow-tls"
      namespace = var.namespace
    }
    spec = {
      secretName = "airflow-tls"
      commonName = var.certificate.common_name
      dnsNames = var.certificate.dns_names
      issuerRef = var.certificate.issuer_ref
    }
  }
}
