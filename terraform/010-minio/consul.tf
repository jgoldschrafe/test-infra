resource "consul_intention" "allow-docker-registry-minio" {
  source_name      = "docker-registry"
  destination_name = "minio"
  action           = "allow"
}

resource "consul_key_prefix" "minio" {
  path_prefix = "minio/"
  subkeys = {
    namespace    = module.minio-namespace.name
    vault_secret = vault_generic_secret.minio.path
  }
}
