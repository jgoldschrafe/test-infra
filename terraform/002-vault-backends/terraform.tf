terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.0.0"
    }

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
