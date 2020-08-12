#
# Terraform project meta-configuration
#

provider "helm" {
  version = "~> 1.2"

  kubernetes {
    config_context = "docker-desktop"
  }
}

provider "kubernetes" {
  version = "~> 1.11"

  config_context = "docker-desktop"
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}

# Currently requires K8s port forward or Consul proxy
provider "postgresql" {
  version = "~> 1.7"

  host     = "localhost"
  port     = 5432
  sslmode  = "disable"
  username = "postgres"
  password = data.kubernetes_secret.postgresql.data.postgresql-password
}

provider "random" {
  version = "~> 2.3"
}
