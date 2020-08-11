#
# Consul intention
#

resource "consul_intention" "postgresql_gitlab" {
  source_name      = "gitlab"
  destination_name = "postgresql"
  action           = "allow"
}
