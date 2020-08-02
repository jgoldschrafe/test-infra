resource "helm_release" "nginx_ingress" {
  namespace = kubernetes_namespace.nginx_ingress.metadata[0].name
  name      = "nginx-ingress"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.6.0"

  values = [
    "${file("values.yaml")}"
  ]
}
