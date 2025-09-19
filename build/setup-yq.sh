#!/bin/bash

set -e

# Install yq command
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    ARCH="arm64"
fi

BINARY="yq_linux_${ARCH}"

wget "https://github.com/mikefarah/yq/releases/latest/download/${BINARY}" -O /usr/bin/yq
chmod +x /usr/bin/yq
