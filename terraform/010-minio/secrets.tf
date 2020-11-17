resource "random_password" "access_key" {
  length  = 16
  special = true
}

resource "random_password" "secret_key" {
  length  = 16
  special = true
}

resource "vault_generic_secret" "minio" {
  path = "secret/minio"
  data_json = jsonencode({
    access_key = random_password.access_key.result
    secret_key = random_password.secret_key.result
  })
}
