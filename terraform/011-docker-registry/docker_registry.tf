module "docker-registry-namespace" {
  source = "../modules/kubernetes-namespace"

  name = "docker-registry"
}

module "consul-sidecar" {
  source = "../modules/consul-sidecar"

  service_upstreams = "minio:8080"
}

module "docker-registry" {
  source = "../modules/docker-registry"

  namespace   = module.docker-registry-namespace.name
  host        = "docker.test.local"

  certificate = {
    issuer_ref = {
      name  = data.consul_key_prefix.default-issuer.subkeys.name
      kind  = data.consul_key_prefix.default-issuer.subkeys.kind
      group = data.consul_key_prefix.default-issuer.subkeys.group
    }
  }

  extra_values = [
    jsonencode(module.consul-sidecar.values),
    jsonencode({
      s3 = {
        regionEndpoint = "localhost:8080"
        bucket         = "docker-registry"
      }

      secrets = {
        s3 = {
          accessKey = data.vault_generic_secret.minio.data.access_key
          secretKey = data.vault_generic_secret.minio.data.secret_key
        }
      }
    })
  ]
}
