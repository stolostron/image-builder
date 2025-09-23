#!/bin/bash

set -e

# Install gosec
if [[ "$(uname -m)" == "s390x" ]]; then
        git clone https://github.com/securego/gosec.git
        cd gosec
        GOBIN=/usr/local/ go install ./cmd/gosec
elif [[ "$(uname -m)" == "x86_64" ]] || [[ "$(uname -m)" == "aarch64" ]]; then
        curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s -- -b /usr/local/bin
fi
