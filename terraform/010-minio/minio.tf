module "minio-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "minio"
}

module "minio" {
  source = "../modules/minio-local"

  namespace = module.minio-namespace.name

  access_key = random_password.access_key.result
  secret_key = random_password.secret_key.result

  buckets = [
    {
      name   = "docker-registry"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-artifacts"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-backup"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-lfs"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-packages"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-registry"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-tmp"
      policy = "none"
      purge  = false
    },
    {
      name   = "gitlab-uploads"
      policy = "none"
      purge  = false
    },
    {
      name   = "velero"
      policy = "none"
      purge  = false
    },
  ]
}
