#
# K/V secrets engine for Vault
#

resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  description = "Key/value secrets"
}
