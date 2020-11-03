terraform {
  required_providers {
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

provider "helm" {
  kubernetes {
    config_context = var.kubernetes_config_context
  }
}

provider "kubernetes" {
  config_context = var.kubernetes_config_context
}

provider "vault" {
  address = var.vault_address
}
