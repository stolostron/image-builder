#!/bin/bash

# Install dependencies from yum
yum install -y \
    bc \
    file \
    findutils \
    gpgme \
    git \
    hostname \
    lsof \
    make \
    openssl \
    openssl-devel \
    socat \
    systemd-devel \
    tar \
    util-linux \
    wget \
    which

yum clean all
