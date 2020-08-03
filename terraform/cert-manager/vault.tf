#
# Vault configuration to support cert-manager issuer
#

resource "vault_pki_secret_backend_role" "pki_default_issuer" {
  backend = data.terraform_remote_state.vault_config_pki.outputs.vault_mount_pki_path
  name    = "default-issuer"

  allowed_domains = [
    "cluster.svc",
    "test.local",
  ]

  allow_localhost    = true
  allow_subdomains   = true
  allow_glob_domains = true
  max_ttl            = "259200"

  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
    "ServerAuth",
  ]
}

resource "vault_policy" "pki_default_issuer" {
  name = "pki-default-issuer"

  policy = <<EOT
path "pki/*"               { capabilities = ["read", "list"] }
path "pki/roles/default"   { capabilities = ["create", "update"] }
path "pki/sign/default"    { capabilities = ["create", "update"] }
path "pki/issue/default"   { capabilities = ["create"] }
EOT
}

resource "vault_kubernetes_auth_backend_role" "default_issuer" {
  backend = data.terraform_remote_state.vault_config_auth_kubernetes.outputs.vault_auth_backend_kubernetes_path

  role_name                        = "default-issuer"
  bound_service_account_names      = ["default-issuer"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600
  token_policies                   = ["pki-default-issuer"]
}
