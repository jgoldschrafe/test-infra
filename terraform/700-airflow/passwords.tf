resource "random_password" "airflow-postgresql" {
  length  = 16
  special = true
}

resource "vault_generic_secret" "airflow-postgresql" {
  path = "secret/airflow/postgresql"
  data_json = jsonencode({
    username = "airflow"
    password = random_password.airflow-postgresql.result
  })
}

resource "kubernetes_secret" "airflow-postgresql" {
  metadata {
    namespace = module.airflow-namespace.name
    name      = "airflow-postgresql"
  }

  data = {
    username = "airflow"
    password = random_password.airflow-postgresql.result
  }
}
