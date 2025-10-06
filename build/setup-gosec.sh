#!/bin/bash

set -e

arch=$(uname -m)

# Install gosec
if [[ "${arch}" == "x86_64" ]] || [[ "${arch}" == "aarch64" ]]; then
        curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s -- -b /usr/local/bin
else
        git clone https://github.com/securego/gosec.git
        cd gosec
        GOBIN=/usr/local/bin go install ./cmd/gosec
fi
