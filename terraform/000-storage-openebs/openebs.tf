module "openebs-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "openebs"
}

module "openebs" {
  source = "../modules/openebs-with-local-storage"

  namespace        = module.openebs-namespace.name
  volume_root_path = "/Users/jeff.goldschrafe/Kubernetes/OpenEBS"
}
