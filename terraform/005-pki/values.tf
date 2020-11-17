output "root_ca" {
  description = "Root CA"
  value       = module.root-ca.ca
}

output "bootstrap_ca" {
  description = "Bootstrap CA"
  value       = module.bootstrap-ca.ca
}
