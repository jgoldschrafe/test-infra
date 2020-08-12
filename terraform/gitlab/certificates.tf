#
# cert-manager certificates
#

resource "kubernetes_manifest" "gitlab_tls_certificate" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "gitlab-tls"
      namespace = "gitlab"
    }
    spec = {
      secretName = "gitlab-tls"
      commonName = "gitlab.test.local"
      dnsNames = [
        "gitlab.test.local",
        "gitlab-webservice.gitlab.svc.cluster.local",
        "gitlab-webservice.gitlab.svc.cluster",
        "gitlab-webservice.gitlab.svc",
        "gitlab-webservice.gitlab",
        "gitlab-webservice",
        "registry.test.local",
        "gitlab-registry.gitlab.svc.cluster.local",
        "gitlab-registry.gitlab.svc.cluster",
        "gitlab-registry.gitlab.svc",
        "gitlab-registry.gitlab",
        "gitlab-registry",
      ],
      issuerRef = {
        name = "default-issuer"
        kind = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }
}
