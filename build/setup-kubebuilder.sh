#!/bin/bash

set -e

# Install kubebuilder
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    ARCH="arm64"
fi

export KBVERSION=2.3.1

if [[ "$ARCH" == "amd64" || "$ARCH" == "arm64" ]]; then
    mkdir -p /opt/kubebuilder
    cd /opt/kubebuilder
    wget -O kubebuilder.tgz --progress=dot:mega https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${KBVERSION}/kubebuilder_${KBVERSION}_${OS}_${ARCH}.tar.gz
    tar xf kubebuilder.tgz
    mv kubebuilder_${KBVERSION}_${OS}_${ARCH} /usr/local/kubebuilder
    cd /
    rm -rf /opt/kubebuilder
elif [[ "$ARCH == s390x" ]]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOROOT=/usr/local/go
    export GOPATH=/go
    cd /go/src
    wget -O kubebuilder.tar.gz --progress=dot:mega https://github.com/kubernetes-sigs/kubebuilder/archive/v$KBVERSION.tar.gz
    tar xf kubebuilder.tar.gz
    cd kubebuilder-$KBVERSION
    CGO_ENABLED=0 GOOS=$OS GOARCH=$ARCH go build -ldflags '-w -s' -o bin/kubebuilder ./cmd/
    cp bin/kubebuilder /usr/local/kubebuilder
    rm -rf /go/src/kubebuilder-$KBVERSION /go/src/kubebuilder.tar.gz
else
    echo "Unsupported architecture $ARCH"
    exit 1
fi
