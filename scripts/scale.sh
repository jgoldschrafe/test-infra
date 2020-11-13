#!/usr/bin/env bash

set -euo pipefail

readonly CONFIG_CONTEXT="${CONFIG_CONTEXT:-docker-desktop}"
readonly REPLICAS="${REPLICAS:-0}"

readonly EXCLUDED_NAMESPACES=(
    cert-manager
    consul
    ingress-nginx
    kube-node-lease
    kube-public
    kube-system
    openebs
    openldap
    postgresql
    vault
)

readonly SCALABLE_RESOURCE_TYPES=(
    deployment
    replicaset
    statefulset
)

readonly kubectl=(
    kubectl
    --context="${CONFIG_CONTEXT}"
)

readonly namespaces="$("${kubectl[@]}" get namespace -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}')"
readonly included_namespaces="$(diff --unchanged-line-format= --old-line-format= \
    <(echo "${EXCLUDED_NAMESPACES[@]}" | xargs -n1 echo | sort) \
    <(echo "$namespaces" | sort))"

for ns in $included_namespaces; do
    echo "==> Scaling resources in namespace ${ns}..."

    for rt in "${SCALABLE_RESOURCE_TYPES[@]}"; do
        resources=($("${kubectl[@]}" get "${rt}" --namespace "${ns}" -o jsonpath="{range .items[*]}{\"${rt}/\"}{.metadata.name}{\"\\n\"}"))
        for resource in "${resources[@]}"; do
            echo "--> Scaling resource ${resource}..."
            "${kubectl[@]}" scale --namespace "${ns}" "${resource}" --replicas=0
        done
    done
done
