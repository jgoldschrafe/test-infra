resource "random_password" "postgresql" {
  length  = 16
  special = true
}

resource "vault_generic_secret" "postgresql" {
  path = "kv/discovery_tools/postgresql"
  data_json = jsonencode({
    username = "discovery_tools"
    password = random_password.postgresql.result
  })
}
