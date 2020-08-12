#
# Helm release
#

#resource "helm_release" "gitlab" {
#  namespace = data.terraform_remote_state.gitlab_storage.outputs.namespace
#  name      = "gitlab"
#
#  repository = "https://charts.gitlab.io"
#  chart      = "gitlab"
#  version    = "4.2.4"
#
#  values = [
#    "${file("values.yaml")}"
#  ]
#
#  depends_on = [
#    postgresql_role.gitlab,
#    postgresql_database.gitlab,
#  ]
#}
