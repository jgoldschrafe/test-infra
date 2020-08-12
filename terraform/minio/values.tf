output "namespace" {
  value = data.terraform_remote_state.minio_storage.outputs.namespace
}
