module "ingress-nginx-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "ingress-nginx"
}

module "ingress-nginx" {
  source = "../modules/ingress-nginx"

  namespace = module.ingress-nginx-namespace.name

  values = {
    controller = {
      config = {
        compute-full-forwarded-for = "true"
      }

      service = {
        type = "NodePort"
        nodePorts = {
          http = var.ingress_http_port
          https = var.ingress_https_port
        }
      }
    }
  }
}
