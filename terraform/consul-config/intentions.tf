#
# Default Consul intentions
#

resource "consul_intention" "default_deny" {
  source_name      = "*"
  destination_name = "*"
  action           = "deny"
}
