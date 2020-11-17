data "consul_key_prefix" "default-issuer" {
  path_prefix = "cert-manager/issuer/default-issuer/"
}

data "consul_key_prefix" "minio" {
  path_prefix = "minio/"
}

resource "consul_key_prefix" "docker-registry" {
  path_prefix = "docker-registry/"
  subkeys = {
    namespace = module.docker-registry-namespace.name
  }
}
