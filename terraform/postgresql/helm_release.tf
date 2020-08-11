#
# Helm release for postgresql server
#

resource "helm_release" "postgresql" {
  namespace = data.terraform_remote_state.postgresql_storage.outputs.namespace
  name      = "postgresql"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "9.1.4"

  values = [
    "${file("values.yaml")}"
  ]
}
