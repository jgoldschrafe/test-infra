output "intermediate_ca_cert_pem" {
  value = tls_locally_signed_cert.intermediate_ca.cert_pem
}

output "vault_mount_pki_path" {
  value = vault_mount.pki.path
}
