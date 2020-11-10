resource "random_password" "postgres" {
  length  = 16
  special = true
}

resource "vault_generic_secret" "postgresql_postgres" {
  path = var.postgresql_postgres_vault_secret
  data_json = jsonencode({
    password = random_password.postgres.result
  })
}
