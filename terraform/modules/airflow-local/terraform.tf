terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 1.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.3"
    }

    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = ">= 0.2.1"
    }
  }
}
