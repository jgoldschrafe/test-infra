locals {
  # Wacky osixia PYTHON2BASH stuff
  phpldapadmin_ldap_hosts = "#PYTHON2BASH:${replace(replace(jsonencode(var.ldap_hosts), "true", "True"), "false", "False")}"
}

resource "helm_release" "phpldapadmin" {
  namespace = var.namespace
  name      = "phpldapadmin"

  # FIXME: Replace when podAnnotations support added upstream
  # repository = "https://cetic.github.io/helm-charts"
  # chart      = "phpldapadmin"
  # version    = var.chart_version
  chart      = "${path.module}/../../../charts/phpldapadmin"

  values = concat(
    [
      file("${path.module}/values.yaml"),
      jsonencode({
        env = {
          PHPLDAPADMIN_LDAP_HOSTS = local.phpldapadmin_ldap_hosts
        }

        ingress = {
          hosts = [var.host]
        }

        tls = [{
          secretName = "phpldapadmin-tls"
          hosts      = [var.host]
        }]
      })
    ],
    var.extra_values,
  )
}
