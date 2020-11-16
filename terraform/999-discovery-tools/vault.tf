resource "kubernetes_service_account" "discovery-tools" {
  metadata {
    namespace = kubernetes_namespace.discovery-tools.metadata[0].name
    name      = "discovery-tools"
  }
}

resource "vault_policy" "discovery-tools" {
  name = "discovery-tools"

  policy = <<EOT
path "kv/discovery_tools/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

resource "vault_kubernetes_auth_backend_role" "discovery-tools" {
  backend = "kubernetes"

  role_name                        = "discovery-tools"
  bound_service_account_names      = [kubernetes_service_account.discovery-tools.metadata[0].name]
  bound_service_account_namespaces = [kubernetes_namespace.discovery-tools.metadata[0].name]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.discovery-tools.name]
}
