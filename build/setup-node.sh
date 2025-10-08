#!/bin/bash

set -e

: "${NODE_VERSION:?NODE_VERSION must be set}"

# Create node cache directory
mkdir -p /opt/node/cache
chmod --recursive a+rwx /opt/node

# Install Node and npm
dnf module -y enable "nodejs:${NODE_VERSION}" && dnf install -y npm

# Set node cache director
npm config set cache /opt/node/cache --global

dnf clean all
