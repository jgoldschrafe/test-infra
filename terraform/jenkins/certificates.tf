resource "kubernetes_manifest" "jenkins_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "jenkins-tls"
      namespace = "jenkins"
    }
    spec = {
      secretName = "jenkins-tls"
      commonName = "jenkins.test.local"
      dnsNames = [
        "jenkins.test.local"
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }

  depends_on = [kubernetes_namespace.jenkins]
}
