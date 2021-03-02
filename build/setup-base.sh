#!/bin/bash

# Install dependencies from yum
yum install -y \
    bc \
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
    python38 \
    socat \
    systemd-devel \
    tar \
    util-linux \
    wget \
    which \
    yum-utils

yum clean all
