#!/bin/bash

set -e

module="github.com/securego/gosec/v2"

# Get the latest version of gosec
go_mod=$(curl https://raw.githubusercontent.com/securego/gosec/refs/heads/master/go.mod)
found_module=$(echo "${go_mod}" | awk '/^module/ {print $2}')

if [ "${found_module}" != "${module}" ]; then
    echo "WARN: Currently using gosec '${module##*/}'. Found new major version of gosec '${found_module##*/}'."
fi

# Install gosec
GOBIN=/usr/local/bin go install "${module}/cmd/gosec@latest"
