terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 1.3.2"
    }

    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = ">= 0.2.1"
    }
  }
}
