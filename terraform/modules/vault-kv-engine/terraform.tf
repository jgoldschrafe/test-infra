terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = ">= 2.15.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 1.11"
    }
  }
}
