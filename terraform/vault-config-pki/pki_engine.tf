#
# PKI secrets engine for Vault
#

locals {
  pem_bundle = join("\n", [
    tls_locally_signed_cert.intermediate_ca.cert_pem,
    tls_private_key.intermediate_ca.private_key_pem,
  ])
}

resource "vault_mount" "pki" {
  path        = "pki"
  type        = "pki"
  description = "Test Infrastructure Intermediate CA"

  options = {
    max_lease_ttl = "8760h"
  }
}

resource "vault_pki_secret_backend_config_ca" "pki" {
  backend    = vault_mount.pki.path
  pem_bundle = local.pem_bundle
}
