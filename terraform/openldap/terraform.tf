provider "helm" {
  version = "~> 1.2"

  kubernetes {
    config_context = "docker-desktop"
  }
}

provider "kubernetes" {
  version = "~> 1.11"

  config_context = "docker-desktop"
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}

provider "random" {
  version = "~> 2.3"
}
