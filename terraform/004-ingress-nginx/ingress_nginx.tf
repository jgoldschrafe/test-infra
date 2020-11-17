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
    }
  }
}

resource "consul_key_prefix" "ingress-nginx" {
  path_prefix = "ingress-nginx/"

  subkeys = {
    namespace = module.ingress-nginx-namespace.name
  }
}
