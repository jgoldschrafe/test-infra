resource "vault_mount" "kv" {
  path        = var.path
  type        = "kv"
  description = "Key/value secrets"
}
