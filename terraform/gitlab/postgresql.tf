#
# PostgreSQL resources for GitLab
#

data "kubernetes_secret" "postgresql" {
  metadata {
    namespace = data.terraform_remote_state.postgresql.outputs.namespace
    name      = "postgresql"
  }
}

resource "random_password" "gitlab" {
  length  = 16
  special = true
}

resource "kubernetes_secret" "gitlab_postgresql" {
  metadata {
    namespace = "gitlab"
    name      = "gitlab-postgresql"
  }

  data = {
    password = random_password.gitlab.result
  }
}

resource "postgresql_role" "gitlab" {
  name      = "gitlab"
  password  = random_password.gitlab.result
  login     = true
  superuser = true
}

resource "postgresql_database" "gitlab" {
  name  = "gitlab"
  owner = postgresql_role.gitlab.name
}
