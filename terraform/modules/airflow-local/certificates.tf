locals {
  flower_dns_names = [
    var.flower.host,
    "airflow-flower",
    "airflow-flower.${var.namespace}",
    "airflow-flower.${var.namespace}.svc",
    "airflow-flower.${var.namespace}.svc.${local.cluster_domain_components[0]}",
    "airflow-flower.${var.namespace}.svc.${local.cluster_domain_components[0]}.${local.cluster_domain_components[1]}",
  ]

  web_dns_names = [
    var.web.host,
    "airflow-web",
    "airflow-web.${var.namespace}",
    "airflow-web.${var.namespace}.svc",
    "airflow-web.${var.namespace}.svc.${local.cluster_domain_components[0]}",
    "airflow-web.${var.namespace}.svc.${local.cluster_domain_components[0]}.${local.cluster_domain_components[1]}",
  ]
}

resource "kubernetes_manifest" "airflow_flower_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "airflow-flower-tls"
      namespace = var.namespace
    }
    spec = {
      secretName = "airflow-flower-tls"
      commonName = var.flower.host
      dnsNames = local.flower_dns_names
      issuerRef = var.flower.certificate.issuer_ref
    }
  }
}

resource "kubernetes_manifest" "airflow_web_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "airflow-web-tls"
      namespace = var.namespace
    }
    spec = {
      secretName = "airflow-web-tls"
      commonName = var.web.host
      dnsNames = local.web_dns_names
      issuerRef = var.web.certificate.issuer_ref
    }
  }
}
