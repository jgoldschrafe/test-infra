resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  description = "Key/value secrets"
}
