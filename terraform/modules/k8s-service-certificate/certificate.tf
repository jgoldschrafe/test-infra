locals {
  dns_names = concat(
    var.hosts,
    [
      var.service,
      "${var.service}.${var.namespace}",
      "${var.service}.${var.namespace}.svc",
      "${var.service}.${var.namespace}.svc.${local.cluster_domain_components[0]}",
      "${var.service}.${var.namespace}.svc.${local.cluster_domain_components[0]}.${local.cluster_domain_components[1]}",
    ]
  )
}

resource "kubernetes_manifest" "certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "${var.service}-tls"
      namespace = var.namespace
    }
    spec = {
      secretName = "${var.service}-tls"
      commonName = var.common_name
      dnsNames = local.dns_names
      issuerRef = var.issuer_ref
    }
  }
}
