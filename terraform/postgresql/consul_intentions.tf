#
# Consul intentions
#

resource "consul_intention" "postgresql_gitlab_migrations" {
  source_name      = "gitlab-migrations"
  destination_name = "postgresql"
  action           = "allow"
}

resource "consul_intention" "postgresql_gitlab_sidekiq" {
  source_name      = "gitlab-sidekiq"
  destination_name = "postgresql"
  action           = "allow"
}

resource "consul_intention" "postgresql_gitlab_webservice" {
  source_name      = "gitlab-webservice"
  destination_name = "postgresql"
  action           = "allow"
}
