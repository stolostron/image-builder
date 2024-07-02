#!/bin/bash

set -e

# Install kubectl and oc
ARCH="$(uname -m)"
BINARY="openshift-client-linux"
RHEL_VERSION="$(source /etc/os-release; echo "${VERSION_ID%\.*}")"

if [[ "${RHEL_VERSION}" == "8" ]]; then
  if [[ "$ARCH" == "x86_64" ]]; then
      ARCH="amd64"
  elif [[ "$ARCH" == "aarch64" ]]; then
      ARCH="arm64"
  fi

  BINARY="${BINARY}-${ARCH}-rhel8"
fi

url="https://mirror.openshift.com/pub/openshift-v4/${ARCH}/clients/ocp/latest/${BINARY}.tar.gz"
cd /usr/local/bin
curl -sL "$url" | tar -zx
