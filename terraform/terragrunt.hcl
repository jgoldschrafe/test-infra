# vim: ft=tf

inputs = {
  consul_dns_ip = "10.99.247.81"

  kubernetes_config_context = "docker-desktop"
  
  cert_manager_consul_key = "cert-manager"
  cert_manager_issuer = {
    kind  = "ClusterIssuer"
    name  = "default-issuer"
    group = "cert-manager.io"
  }

  nfs_client_provisioner_server = "host.docker.internal"
  nfs_client_provisioner_path   = "${get_env("HOME")}/Kubernetes/NFS"

  airflow_dags_repo          = "https://github.com/jgoldschrafe/airflow-test-dags"
  airflow_dags_storage_class = "nfs-local"

  airflow_postgresql_vault_secret  = "kv/airflow/postgresql"
  minio_vault_secret               = "kv/minio"
  openldap_admin_vault_secret      = "kv/openldap/admin"
  openldap_bind_vault_secret       = "kv/openldap/bind"
  openldap_config_vault_secret     = "kv/openldap/config"
  postgresql_postgres_vault_secret = "kv/postgresql/postgres"
}

generate "terraform" {
  path = "terraform.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  required_providers {
    consul = {
      source = "hashicorp/consul"
      version = "~> 2.10.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13.3"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0.0"
    }

    vault = {
      source = "hashicorp/vault"
      version = "~> 2.15.0"
    }
  }
}

provider "consul" {
  # FIXME
  address    = "127.0.0.1:8500"
  datacenter = "dc1"
}

provider "helm" {
  kubernetes {
    config_context = "docker-desktop"
  }
}

provider "kubernetes" {
  config_context = "docker-desktop"
}

provider "kubernetes-alpha" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

provider "vault" {
  address         = "https://vault.test.local"
  skip_tls_verify = true
}    
EOF
}
