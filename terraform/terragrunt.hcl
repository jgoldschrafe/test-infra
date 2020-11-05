# vim: ft=tf

terraform {
  extra_arguments "vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
    ]

    required_var_files = [
      "${get_parent_terragrunt_dir()}/terraform.tfvars"
    ]
  }
}

generate "terraform" {
  path = "terraform.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
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
