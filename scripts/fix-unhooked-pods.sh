#!/usr/bin/env bash

set -euo pipefail

# Find all disconnected Consul pods, which have an annotation but were not
# started with a Consul sidecar.
echo "==> Identifying pods missing Consul sidecars..."
readonly consul_pods="$(
    kubectl get pods --all-namespaces -o json | \
        jq -C '.items[]
            | select(.metadata.annotations."consul.hashicorp.com/connect-inject"=="true" and
                .metadata.annotations."consul.hashicorp.com/connect-inject-status" != "injected") |
            .metadata.namespace + "/" + .metadata.name'
    )"

# Delete all identified problematic pods and let them be rescheduled by their
# corresponding ReplicaSets
echo "==> Deleting identified problem pods..."
for pod in $consul_pods; do
    echo "Deleting pod ${pod}..."
    kubectl delete pod "${pod}"
done

echo "==> Done."
