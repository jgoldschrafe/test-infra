resource "helm_release" "nginx-ingress" {
  namespace = var.namespace
  name      = "nginx-ingress"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),
    jsonencode({
      controller = {
        service = {
          type = "NodePort"
          httpPort = {
            nodePort = 30080
          }
          httpsPort = {
            nodePort = 30443
          }
        }
      }
  
      prometheus = {
        create = true
      }
    }),
  ]
}
