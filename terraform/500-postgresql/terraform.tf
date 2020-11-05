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

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0"
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
