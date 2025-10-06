#!/bin/bash

set -e

# Install setup-envtest
module="sigs.k8s.io/controller-runtime"

# Get the latest version of setup-envtest
go_mod=$(curl https://raw.githubusercontent.com/kubernetes-sigs/controller-runtime/refs/heads/main/go.mod)
found_module=$(echo "${go_mod}" | awk '/^module/ {print $2}')

if [ "${found_module}" != "${module}" ]; then
    echo "WARN: Currently using setup-envtest '${module##*/}'. Found new major version of setup-envtest '${found_module##*/}'."
fi

# Install setup-envtest
GOBIN=/usr/local/bin go install "${module}/tools/setup-envtest@latest"

# Install latest envtest binaries
setup-envtest use

# Place binaries in the PATH
mkdir -p /usr/local/kubebuilder/bin
cp "$(setup-envtest use -p path)/"* /usr/local/kubebuilder/bin/
