#!/bin/bash

# Install dependencies from yum
yum install -y \
    bc \
    file \
    findutils \
    gcc \
    gpgme \
    git \
    hostname \
    java-11-openjdk-headless \
    lsof \
    make \
    openssl \
    openssl-devel \
    socat \
    systemd-devel \
    tar \
    util-linux \
    wget \
    which \
    zip
yum clean all

# Install tree command
mkdir -p /opt/tree
cd /opt/tree
wget http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz
tar xf tree-1.8.0.tgz
cd /opt/tree/tree-1.8.0
make
make install
rm -rf /opt/tree

# Install sonar scanner
cd /opt
wget --progress=dot:mega https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
rm sonar-scanner-cli-4.2.0.1873-linux.zip
mv sonar-scanner-4.2.0.1873-linux sonar

# Install go
mkdir -p /go/{bin,pkg,src} /opt/go
cd /opt/go
wget --progress=dot:mega https://dl.google.com/go/go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz
tar -C /usr/local -xzf go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz
rm -rf /opt/go

# Install build harness
mkdir -p /build-harness
cd /build-harness
git clone https://github.com/cloudposse/build-harness.git
git clone https://github.com/open-cluster-management/build-harness-extensions.git
rm -rf build-harness/.git
rm -rf build-harness-extensions/.git
