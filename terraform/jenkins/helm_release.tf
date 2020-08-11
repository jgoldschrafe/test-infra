#
# Helm release for Jenkins
#

resource "helm_release" "jenkins" {
  namespace = data.terraform_remote_state.jenkins_storage.outputs.namespace
  name      = "jenkins"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "jenkins"
  version    = "2.5.0"

  values = [
    "${file("values.yaml")}"
  ]
}
