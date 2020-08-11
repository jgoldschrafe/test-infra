output "namespace" {
  value = kubernetes_namespace.jenkins.metadata[0].name
}

output "data_volume_storage_class" {
  value = "jenkins-data"
}
