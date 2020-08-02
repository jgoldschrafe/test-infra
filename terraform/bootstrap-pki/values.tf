output "root_ca_private_key_pem" {
  value = tls_private_key.root_ca.private_key_pem
}

output "root_ca_cert_pem" {
  value = tls_self_signed_cert.root_ca.cert_pem
}

output "bootstrap_ca_private_key_pem" {
  value = tls_private_key.bootstrap_ca.private_key_pem
}

output "bootstrap_ca_cert_pem" {
  value = tls_locally_signed_cert.bootstrap_ca.cert_pem
}
