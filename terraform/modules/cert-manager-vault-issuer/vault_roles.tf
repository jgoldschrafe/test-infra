resource "vault_pki_secret_backend_role" "issuer" {
  backend = var.vault_pki_path
  name    = var.name

  allow_any_name = true

  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
    "ServerAuth",
  ]

  max_ttl = "252900"
}

resource "vault_policy" "issuer" {
  name = "pki-${var.name}"

  policy = <<EOT
path "${var.vault_pki_path}/*"                 { capabilities = ["read", "list"] }
path "${var.vault_pki_path}/roles/${var.name}" { capabilities = ["create", "update"] }
path "${var.vault_pki_path}/sign/${var.name}"  { capabilities = ["create", "update"] }
path "${var.vault_pki_path}/issue/${var.name}" { capabilities = ["create"] }
EOT
}

resource "vault_kubernetes_auth_backend_role" "issuer" {
  backend = var.vault_kubernetes_path

  role_name                        = var.name
  bound_service_account_names      = [var.name]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.issuer.name]
}
