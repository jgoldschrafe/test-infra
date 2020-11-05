resource "kubernetes_manifest" "coredns_resolver" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "v1"
    kind = "ConfigMap"
    metadata = {
      labels = {
        "addonmanager.kubernetes.io/mode": "EnsureExists",
      }
      name = "coredns"
      namespace = "kube-system"
    }
    data = {
      Corefile = <<EOT
        .:53 {
            errors
            health {
               lameduck 5s
            }
            ready
            kubernetes ${var.cluster_domain} in-addr.arpa ip6.arpa {
               pods insecure
               fallthrough in-addr.arpa ip6.arpa
               ttl 30
            }
            prometheus :9153
            forward . /etc/resolv.conf
            cache 30
            loop
            reload
            loadbalance
        }
        consul {
            errors
            cache 30
            forward . ${var.consul_dns_ip}
        }
EOT
    }
  }
}
