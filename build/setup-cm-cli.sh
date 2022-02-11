#!/bin/bash

set -e

# Download cm-cli
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
fi

wget --progress=dot:mega https://github.com/stolostron/cm-cli/releases/download/${CM_VERSION}/cm_${OS}_${ARCH}.tar.gz
tar -C /tmp -xzf cm_${OS}_${ARCH}.tar.gz

# Spread cm-cli plugin around
cp /tmp/cm ${GOPATH}/bin/oc-cm
mv /tmp/cm ${GOPATH}/bin/kubectl-cm
chmod -R a+rwx ${GOPATH}

# Tidy up
rm cm_${OS}_${ARCH}.tar.gz
