# vim:ft=tf

ingress_http_port = 30080
ingress_https_port = 30443

kubernetes_config_context = "docker-desktop"

vault_ca = {
  subject = {
    common_name         = "Test Infrastructure Intermediate CA"
    organization        = "Test Infrastructure"
    organizational_unit = null
    street_address      = null
    locality            = null
    province            = null
    country             = null
    postal_code         = null
    serial_number       = null
  }
}
