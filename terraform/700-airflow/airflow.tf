module "airflow-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "airflow"
}

module "consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "postgresql:5432"
}

module "airflow" {
  source = "../modules/airflow-local"

  namespace = module.airflow-namespace.name

  flower = {
    host = "airflow-flower.test.local"
    certificate = {
      issuer_ref = var.issuer_ref
    }
  }

  web = {
    host     = "airflow.test.local"
    base_url = "https://airflow.test.local"
    certificate = {
      issuer_ref = var.issuer_ref
    }
  }

  extra_values = [
    # Proxy fix
    jsonencode({
      airflow = {
        config = {
          AIRFLOW__WEBSERVER__PROXY_FIX_X_FOR   = "2"
          AIRFLOW__WEBSERVER__PROXY_FIX_X_PROTO = "2"
          AIRFLOW__WEBSERVER__PROXY_FIX_X_PORT  = "2"
        }
      }
    }),

    # Consul sidecar
    jsonencode({
      airflow = module.consul-sidecar.values
    }),

    # External database
    jsonencode({
      postgresql = {
        enabled = false
      }

      externalDatabase = {
        type              = "postgres"
        host              = "localhost"
        port              = 5432
        database          = "airflow"
        user              = "airflow"
        passwordSecret    = "airflow-postgresql"
        passwordSecretKey = "password"
      }
    }),

    # Git repo sync
    # jsonencode({
    #   dags = {
    #     git = {
    #       url = var.airflow_dags_repo
    #       ref = "main"
    #       gitSync = {
    #         enabled = true
    #       }
    #     }
    #   }
    # }),

    # Shared directory for DAGs
    jsonencode({
      dags = {
        persistence = {
          enabled       = true
          existingClaim = kubernetes_persistent_volume_claim.airflow.metadata[0].name
        }
      }
    }),
  ]
}
