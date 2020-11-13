#
# FIXME: Replace all of this garbage with a custom data provider
#

module "kubernetes-host" {
  source = "matti/resource/shell"

  command = "kubectl --context=${var.kubernetes_config_context} exec -n vault vault-0 -- sh -c 'echo -n https://$${KUBERNETES_PORT_443_TCP_ADDR}:443'"
}

module "kubernetes-ca-certificate" {
  source = "matti/resource/shell"

    command = "kubectl --context=${var.kubernetes_config_context} exec -n vault vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
}

module "service-token" {
  source = "matti/resource/shell"

    command = "kubectl --context=${var.kubernetes_config_context} exec -n vault vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token"
}

#
# Kubernetes auth configuration for Vault
#

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend = vault_auth_backend.kubernetes.path

  kubernetes_host    = module.kubernetes-host.stdout
  kubernetes_ca_cert = module.kubernetes-ca-certificate.stdout
  token_reviewer_jwt = module.service-token.stdout
}

