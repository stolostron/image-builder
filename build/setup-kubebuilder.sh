#!/bin/bash

set -e

module="sigs.k8s.io/kubebuilder/v4"

# Get the latest version of kubebuilder
go_mod=$(curl https://raw.githubusercontent.com/kubernetes-sigs/kubebuilder/refs/heads/master/go.mod)
found_module=$(echo "${go_mod}" | awk '/^module/ {print $2}')

if [ "${found_module}" != "${module}" ]; then
    echo "WARN: Currently using kubebuilder '${module##*/}'. Found new major version of kubebuilder '${found_module##*/}'."
fi

# Install kubebuilder
GOBIN=/usr/local/bin go install "${module}@latest"
