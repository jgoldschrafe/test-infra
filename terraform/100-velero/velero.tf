module "velero-namespace" {
  source = "../modules/kubernetes-namespace"

  name = var.velero_namespace
}

module "velero" {
  source = "../modules/velero"

  namespace = var.velero_namespace

  values = jsonencode({
    configuration = {
      backupStorageLocation = {
        bucket = "velero"
        config = {
          s3Url = "https://minio.minio.svc.cluster.local"
        }
      }
    }
    credentials = {
      extraEnvVars = {
        AWS_ACCESS_KEY_ID = data.terraform_remote_state.minio.outputs.minio_access_key
        AWS_SECRET_ACCESS_KEY = data.terraform_remote_state.minio.outputs.minio_secret_key
      }
    }
    schedules = {
      nightly = {
        schedule = "0 0 * * *"
        template = {
          ttl = "240h"
        }
      }
    }
  })
}
