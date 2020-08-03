output "openldap_namespace" {
  value = kubernetes_namespace.openldap.metadata[0].name
}
