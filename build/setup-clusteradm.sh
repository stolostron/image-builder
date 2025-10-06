#!/bin/bash

set -e

module="open-cluster-management.io/clusteradm"

# Get the latest version of clusteradm
go_mod=$(curl https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/refs/heads/main/go.mod)
found_module=$(echo "${go_mod}" | awk '/module/ {print $2}')

if [ "${found_module}" != "${module}" ]; then
    echo "WARN: Currently using clusteradm '${module##*/}'. Found new major version of clusteradm '${found_module##*/}'."
fi

# Install clusteradm
GOBIN=/usr/local/bin go install "${module}/cmd/clusteradm@latest"
