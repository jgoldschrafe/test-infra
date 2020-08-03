#
# Helm release for Jenkins
#

resource "helm_release" "jenkins" {
  namespace = kubernetes_namespace.jenkins.metadata[0].name
  name      = "jenkins"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "jenkins"
  version    = "2.5.0"

  values = [
    "${file("values.yaml")}"
  ]
}
