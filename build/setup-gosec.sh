#!/bin/bash

set -e

# Install gosec
if [ "$(uname -m)" = "s390x" ]; then
        export PATH=$PATH:/usr/local/go/bin
        export GOROOT=/usr/local/go
        export GOPATH=/go
        cd /go/src
        git clone https://github.com/securego/gosec.git
        cd gosec
        go mod download
        CGO_ENABLED=0 GOOS=linux GOARCH=s390x go build -ldflags '-w -s' -o gosec ./cmd/gosec/
        cp gosec /usr/local/bin
        rm -rf /go/src/gosec
elif [ "$(uname -m)" = "x86_64" ];  then
        curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s -- -b /usr/local/bin
fi
