#
# Helm release
#

resource "helm_release" "gitlab" {
  namespace = data.terraform_remote_state.gitlab_storage.outputs.namespace
  name      = "gitlab"

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "gitlab"
  version    = "2.5.0"

  values = [
    "${file("values.yaml")}"
  ]
}
