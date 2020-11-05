module "airflow_flower_tls_certificate" {
  source = "../k8s-service-certificate"

  namespace      = var.namespace
  cluster_domain = var.cluster_domain
  service     = "airflow-flower"

  common_name = var.flower.host
  hosts       = [var.flower.host]
  issuer_ref  = var.flower.certificate.issuer_ref
}

module "airflow_web_tls_certificate" {
  source = "../k8s-service-certificate"

  namespace      = var.namespace
  cluster_domain = var.cluster_domain
  service     = "airflow-web"

  common_name = var.web.host
  hosts       = [var.web.host]
  issuer_ref  = var.web.certificate.issuer_ref
}
