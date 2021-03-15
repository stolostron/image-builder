#!/bin/bash

# Install go
mkdir -p /go/{bin,pkg,src} /go/pkg/cache /opt/go
chmod -R a+rwx /go
cd /opt/go
wget --progress=dot:mega https://dl.google.com/go/go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz
tar -C /usr/local -xzf go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz
rm -rf /opt/go
