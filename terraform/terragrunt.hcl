# vim: ft=tf

inputs = {
  consul_dns_ip = "10.99.247.81"

  ingress_http_port  = 30080
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

  cert_manager_issuer = {
    kind  = "ClusterIssuer"
    name  = "default-issuer"
    group = "cert-manager.io"
  }

  consul_ingress_gateway_http_node_port  = 31080
  consul_ingress_gateway_https_node_port = 31443

  openldap_admin_vault_secret  = "kv/openldap/admin"
  openldap_bind_vault_secret   = "kv/openldap/bind"
  openldap_config_vault_secret = "kv/openldap/config"
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
  address         = "https://vault.test.local:30443"
  skip_tls_verify = true
}    
EOF
}
