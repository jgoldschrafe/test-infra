#
# Consul intention
#

resource "consul_intention" "loki_grafana" {
  source_name      = "grafana"
  destination_name = "loki"
  action           = "allow"
}
