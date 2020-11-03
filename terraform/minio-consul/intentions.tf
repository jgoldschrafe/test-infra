#
# Consul intentions for Minio
#

resource "consul_intention" "minio_gitlab" {
  source_name      = "gitlab"
  destination_name = "minio"
  action           = "allow"
}
