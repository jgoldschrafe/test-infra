resource "vault_pki_secret_backend_role" "issuer" {
  backend = var.pki_path
  name    = var.issuer_name

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
  name = "pki-${var.issuer_name}"

  policy = <<EOT
path "${var.pki_path}/*"                        { capabilities = ["read", "list"] }
path "${var.pki_path}/roles/${var.issuer_name}" { capabilities = ["create", "update"] }
path "${var.pki_path}/sign/${var.issuer_name}"  { capabilities = ["create", "update"] }
path "${var.pki_path}/issue/${var.issuer_name}" { capabilities = ["create"] }
EOT
}

resource "vault_kubernetes_auth_backend_role" "issuer" {
  backend = var.kubernetes_path

  role_name                        = var.issuer_name
  bound_service_account_names      = [var.issuer_name]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.issuer.name]
}
