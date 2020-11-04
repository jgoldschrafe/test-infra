module "airflow-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "airflow"
}

module "airflow" {
  source = "../modules/airflow-local"

  namespace = module.airflow-namespace.name

  flower = {
    host = "airflow-flower.test.local"
    certificate = {
      issuer_ref = {
        name  = "default-issuer"
        kind  = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }

  web = {
    host = "airflow.test.local"
    base_url = "https://airflow.test.local:30443"
    certificate = {
      issuer_ref = {
        name  = "default-issuer"
        kind  = "ClusterIssuer"
        group = "cert-manager.io"
      }
    }
  }

  values = jsonencode({
    airflow = {
      config = {
        AIRFLOW__WEBSERVER__PROXY_FIX_X_FOR = "2"
        AIRFLOW__WEBSERVER__PROXY_FIX_X_PROTO = "2"
        AIRFLOW__WEBSERVER__PROXY_FIX_X_PORT = "2"
      }
    }
  })
}
