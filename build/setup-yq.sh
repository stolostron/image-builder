#!/bin/bash

set -e

module="github.com/mikefarah/yq/v4"

# Get the latest version of yq
go_mod=$(curl https://raw.githubusercontent.com/mikefarah/yq/refs/heads/master/go.mod)
found_module=$(echo "${go_mod}" | awk '/^module/ {print $2}')

if [ "${found_module}" != "${module}" ]; then
    echo "WARN: Currently using yq '${module##*/}'. Found new major version of yq '${found_module##*/}'."
fi

# Install yq
GOBIN=/usr/local/bin go install "${module}@latest"
