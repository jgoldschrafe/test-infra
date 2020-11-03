terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.15.0"
    }
  }
}

provider "vault" {
  address         = var.vault_address
  skip_tls_verify = var.vault_skip_tls_verify
}
