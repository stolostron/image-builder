#!/bin/bash

# Install kubebuilder
export KBVERSION=2.3.1
mkdir -p /opt/kubebuilder
cd /opt/kubebuilder
wget -O kubebuilder.tgz --progress=dot:mega https://go.kubebuilder.io/dl/$KBVERSION/$GOOS/$GOARCH
tar xf kubebuilder.tgz
mv kubebuilder_${KBVERSION}_${GOOS}_${GOARCH} /usr/local/kubebuilder
cd /
rm -rf /opt/kubebuilder
