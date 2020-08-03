#
# Kubernetes auth configuration for Vault
#

# TODO: Automate the collection of this information from the cluster

locals {
  kubernetes_host    = "https://10.96.0.1:443"
  kubernetes_ca_cert = "${file("files/kubernetes_ca.crt")}"
  token_reviewer_jwt = "${file("files/service-token")}"
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "lubernetes" {
  backend = vault_auth_backend.kubernetes.path

  kubernetes_host    = local.kubernetes_host
  kubernetes_ca_cert = local.kubernetes_ca_cert
  token_reviewer_jwt = local.token_reviewer_jwt
}
