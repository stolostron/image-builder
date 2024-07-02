#!/bin/bash

set -e

# Install dependencies from yum
yum install -y \
    bc \
    diffutils \
    file \
    findutils \
    gettext \
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
    python3.12 \
    python3.12-pip \
    socat \
    systemd-devel \
    tar \
    unzip \
    util-linux \
    wget \
    which \
    xz \
    yum-utils

yum clean all
