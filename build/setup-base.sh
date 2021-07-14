#!/bin/bash

set -e

# Install dependencies from yum
yum install -y \
    bc \
    diffutils \
    file \
    findutils \
    gcc \
    gcc-c++ \
    gpgme \
    git \
    hostname \
    lsof \
    make \
    openssl \
    openssl-devel \
    procps-ng \
    python38 \
    socat \
    systemd-devel \
    tar \
    util-linux \
    wget \
    which \
    xz \
    yum-utils

yum clean all
