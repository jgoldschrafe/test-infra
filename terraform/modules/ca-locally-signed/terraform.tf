terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.0.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0.0"
    }
  }
}
