#!/bin/bash

set -e

# Install yq command
VERSION="v4.16.2"
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    ARCH="arm64"
fi

BINARY="yq_linux_$ARCH"

wget "https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}" -O /usr/bin/yq
chmod +x /usr/bin/yq
