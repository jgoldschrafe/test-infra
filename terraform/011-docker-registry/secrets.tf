data "vault_generic_secret" "minio" {
  path = data.consul_key_prefix.minio.subkeys.vault_secret
}
