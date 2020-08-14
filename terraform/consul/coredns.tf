#
# CoreDNS stub resolver
#

#resource "kubernetes_manifest" "coredns_resolver" {
#  provider = kubernetes-alpha
#
#  manifest = {
#    apiVersion = "v1"
#    kind = "ConfigMap"
#    metadata = {
#      labels = {
#        "addonmanager.kubernetes.io/mode": "EnsureExists",
#      }
#      name = "coredns"
#      namespace = "kube-system"
#    }
#    data = {
#      Corefile = <<EOT
#        .:53 {
#            errors
#            health
#            ready
#            kubernetes cluster.local in-addr.arpa ip6.arpa {
#               pods insecure
#               fallthrough in-addr.arpa ip6.arpa
#               ttl 30
#            }
#            prometheus :9153
#            forward . /etc/resolv.conf
#            cache 30
#            loop
#            reload
#            loadbalance
#        }
#        consul {
#            errors
#            cache 30
#            forward . 10.99.247.81
#        }
#EOT
#    }
#  }
#}
