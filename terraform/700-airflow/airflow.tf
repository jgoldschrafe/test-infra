locals {
  default_issuer_ref = {
    name  = data.consul_key_prefix.default-issuer.subkeys.name
    kind  = data.consul_key_prefix.default-issuer.subkeys.kind
    group = data.consul_key_prefix.default-issuer.subkeys.group
  }
}

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
      issuer_ref = local.default_issuer_ref
    }
  }

  web = {
    host     = "airflow.test.local"
    base_url = "https://airflow.test.local"
    certificate = {
      issuer_ref = local.default_issuer_ref
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
        # FIXME: Consul disabled until a good solution is found for batch jobs with sidecars
        # host              = "localhost"
        host              = "postgresql.postgresql"
        port              = 5432
        database          = "airflow"
        user              = "airflow"
        passwordSecret    = "airflow-postgresql"
        passwordSecretKey = "password"
      }
    }),

    # Kubernetes executor configuration
    jsonencode({
      dags = {
        persistence = {
          enabled       = true
          existingClaim = kubernetes_persistent_volume_claim.airflow.metadata[0].name
        }
      }

      airflow = {
        config = {
          AIRFLOW__KUBERNETES__NAMESPACE                          = module.airflow-namespace.name
          AIRFLOW__KUBERNETES__DAGS_VOLUME_CLAIM                  = kubernetes_persistent_volume_claim.airflow.metadata[0].name
          AIRFLOW__KUBERNETES__LOGS_VOLUME_CLAIM                  = kubernetes_persistent_volume_claim.airflow-logs.metadata[0].name
          AIRFLOW__KUBERNETES__WORKER_CONTAINER_REPOSITORY        = "airflow-test"
          AIRFLOW__KUBERNETES__WORKER_CONTAINER_TAG               = "latest"
          AIRFLOW__KUBERNETES__WORKER_CONTAINER_IMAGE_PULL_POLICY = "Never"
          AIRFLOW__KUBERNETES__WORKER_SERVICE_ACCOUNT_NAME        = "airflow"
        }
      }

      # Fixed worker pods not necessary with KubernetesExecutor
      workers = {
        enabled = false
      }
    }),
  ]
}
