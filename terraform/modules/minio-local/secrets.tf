resource "kubernetes_secret" "minio" {
  metadata {
    namespace = var.namespace
    name      = "minio"
  }

  data = {
    accesskey = var.access_key
    secretkey = var.secret_key
  }
}
