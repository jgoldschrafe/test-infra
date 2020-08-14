#
# MinIO
#

data "kubernetes_secret" "minio" {
  metadata {
    namespace = data.terraform_remote_state.minio.outputs.namespace
    name      = "minio"
  }
}

resource "kubernetes_secret" "rails_s3_minio" {
  metadata {
    namespace = kubernetes_namespace.gitlab.metadata[0].name
    name      = "rails-s3-minio"
  }

  data = {
    connection = <<EOT
provider: AWS
region: us-east-1
endpoint: "http://localhost:9000"
aws_access_key_id: ${data.kubernetes_secret.minio.data.accesskey}
aws_secret_access_key: ${data.kubernetes_secret.minio.data.secretkey}
EOT
  }
}

resource "kubernetes_secret" "s3cmd_config" {
  metadata {
    namespace = kubernetes_namespace.gitlab.metadata[0].name
    name      = "s3cmd-config"
  }

  data = {
    config = <<EOT
[default]
access_key = ${data.kubernetes_secret.minio.data.accesskey}
secret_key = ${data.kubernetes_secret.minio.data.secretkey}
bucket_location = us-east-1
EOT
  }
}

#
# LDAP authentication
#

resource "kubernetes_secret" "ldap_bind" {
  metadata {
    namespace = kubernetes_namespace.gitlab.metadata[0].name
    name      = "ldap-bind"
  }

  data = {
    password = "password"
  }
}
