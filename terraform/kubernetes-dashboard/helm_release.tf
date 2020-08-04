#
# Helm release for Kubernetes Dashboard
#

resource "helm_release" "kubernetes_dashboard" {
  namespace = kubernetes_namespace.kubernetes_dashboard.metadata[0].name
  name      = "kubernetes-dashboard"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  version    = "2.3.0"

  values = [
    "${file("values.yaml")}"
  ]
}
