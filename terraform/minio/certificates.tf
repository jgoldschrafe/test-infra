#
# cert-manager Certificate resources
#

resource "kubernetes_manifest" "minio_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "minio-tls"
      namespace = "minio"
    }
    spec = {
      secretName = "minio-tls"
      commonName = "minio.test.local"
      dnsNames = [
        "minio.test.local",
        "minio",
        "minio.minio",
        "minio.minio.svc",
        "minio.minio.svc.cluster",
        "minio.minio.svc.cluster.local",
      ],
      issuerRef = {
        name = "default-issuer" # FIXME: hardcoded
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }

  depends_on = [kubernetes_namespace.minio]
}
