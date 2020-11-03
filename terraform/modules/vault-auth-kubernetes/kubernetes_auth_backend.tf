#
# FIXME: Replace all of this provisioner garbage with a custom data provider
#

resource "null_resource" "kubernetes_host" {
  provisioner "local-exec" {
    command = "kubectl --context=docker-desktop exec -n vault vault-0 -- sh -c 'echo -n https://$${KUBERNETES_PORT_443_TCP_ADDR}:443' > ${var.tmpdir}/kubernetes_host"
  }
}

data "local_file" "kubernetes_host" {
  filename = "${var.tmpdir}/kubernetes_host"

  depends_on = [null_resource.kubernetes_host]
}

resource "null_resource" "kubernetes_ca_certificate" {
  provisioner "local-exec" {
    command = "kubectl --context=docker-desktop exec -n vault vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt > ${var.tmpdir}/kubernetes_ca.crt"
  }
}

data "local_file" "kubernetes_ca_certificate" {
  filename = "${var.tmpdir}/kubernetes_ca.crt"

  depends_on = [null_resource.kubernetes_ca_certificate]
}

resource "null_resource" "service_token" {
  provisioner "local-exec" {
    command = "kubectl --context=docker-desktop exec -n vault vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token > ${var.tmpdir}/service-token"
  }
}

data "local_file" "service_token" {
  filename = "${var.tmpdir}/service-token"

  depends_on = [null_resource.service_token]
}

#
# Kubernetes auth configuration for Vault
#

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend = vault_auth_backend.kubernetes.path

  kubernetes_host    = data.local_file.kubernetes_host.content
  kubernetes_ca_cert = data.local_file.kubernetes_ca_certificate.content
  token_reviewer_jwt = data.local_file.service_token.content
}

