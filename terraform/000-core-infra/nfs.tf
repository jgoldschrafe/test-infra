module "nfs-client-provisioner-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "nfs-client-provisioner"
}

module "nfs-client-provisioner" {
  source = "../modules/nfs-client-provisioner"

  namespace = module.nfs-client-provisioner-namespace.name

  nfs_server         = var.nfs_client_provisioner_server
  nfs_path           = var.nfs_client_provisioner_path
  storage_class_name = "nfs-local"
}
