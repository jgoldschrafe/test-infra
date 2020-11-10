#
# Helm release for Airflow server
#

resource "helm_release" "airflow" {
  namespace = var.namespace
  name      = "airflow"

  repository = "https://charts.helm.sh/stable"
  chart      = "airflow"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml"),

    # Ingress configuration
    jsonencode({
      airflow = {
        config = {
          AIRFLOW__WEBSERVER__BASE_URL          = var.web.base_url
          AIRFLOW__WEBSERVER__ENABLE_PROXY_FIX  = "true"
          AIRFLOW__WEBSERVER__PROXY_FIX_X_FOR   = "1"
          AIRFLOW__WEBSERVER__PROXY_FIX_X_PROTO = "1"
          AIRFLOW__WEBSERVER__PROXY_FIX_X_PORT  = "1"
        }
      }

      ingress = {
        enabled = true

        flower = {
          host = var.flower.host

          annotations = {
            "kubernetes.io/ingress.class" = "nginx"
            "kubernetes.io/tls-acme"      = "false"
          }

          tls = {
            enabled    = true
            secretName = "airflow-flower-tls"
          }
        }

        web = {
          host    = var.web.host
          baseUrl = var.web.base_url

          annotations = {
            "kubernetes.io/ingress.class" = "nginx"
            "kubernetes.io/tls-acme"      = "false"
          }

          tls = {
            enabled    = true
            secretName = "airflow-web-tls"
          }
        }
      }
    }),
    var.values,
  ]
}
