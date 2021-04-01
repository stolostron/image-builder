#!/bin/bash

# Install kubebuilder
export KBVERSION=2.3.1

if [ "$(uname -m)" = "s390x" ]; then
        export PATH=$PATH:/usr/local/go/bin
        export GOROOT=/usr/local/go
        export GOPATH=/go
        cd /go/src
        wget -O kubebuilder.tar.gz --progress=dot:mega https://github.com/kubernetes-sigs/kubebuilder/archive/v$KBVERSION.tar.gz
        tar xf kubebuilder.tar.gz
        cd kubebuilder-$KBVERSION
        CGO_ENABLED=0 GOOS=linux GOARCH=s390x go build -ldflags '-w -s' -o bin/kubebuilder ./cmd/
        cp bin/kubebuilder /usr/local/kubebuilder
        rm -rf /go/src/kubebuilder-$KBVERSION /go/src/kubebuilder.tar.gz
elif [ "$(uname -m)" = "x86_64" ];  then
        mkdir -p /opt/kubebuilder
        cd /opt/kubebuilder
        wget -O kubebuilder.tgz --progress=dot:mega https://go.kubebuilder.io/dl/$KBVERSION/$GOOS/$GOARCH
        tar xf kubebuilder.tgz
        mv kubebuilder_${KBVERSION}_${GOOS}_${GOARCH} /usr/local/kubebuilder
        cd /
        rm -rf /opt/kubebuilder
fi
