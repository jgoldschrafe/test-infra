module "docker-registry-tls-certificate" {
  source = "../k8s-service-certificate"

  namespace      = var.namespace
  cluster_domain = var.cluster_domain
  service        = "docker-registry"

  common_name = var.host
  hosts       = [var.host]
  issuer_ref  = var.certificate.issuer_ref
}
