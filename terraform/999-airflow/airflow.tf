module "airflow-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "airflow"
}

module "airflow" {
  source = "../modules/airflow-local"

  namespace = module.airflow-namespace.name
  certificate = {
    common_name = "airflow.test.local"
    dns_names = [
      "airflow.test.local",
      "airflow",
      "airflow.airflow",
      "airflow.airflow.svc",
      "airflow.airflow.svc.cluster",
      "airflow.airflow.svc.cluster.local",
    ]
    issuer_ref = {
      name  = "default-issuer"
      kind  = "ClusterIssuer"
      group = "cert-manager.io"
    }
  }

  depends_on = [
    module.airflow-namespace,
  ]
}
