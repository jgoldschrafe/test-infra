resource "random_password" "access_key" {
  length  = 16
  special = true
}

resource "random_password" "secret_key" {
  length  = 16
  special = true
}

module "minio-namespace" {
  source = "../modules/kubernetes-namespace"

  name = var.minio_namespace
}

module "minio" {
  source = "../modules/minio-local"

  namespace = module.minio-namespace.name

  access_key = random_password.access_key.result
  secret_key = random_password.secret_key.result
}
