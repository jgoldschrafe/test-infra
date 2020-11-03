module "nginx-ingress-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "nginx-ingress"
}

module "nginx-ingress" {
  source = "../modules/nginx-ingress"

  namespace = module.nginx-ingress-namespace.name
}
