#!/bin/bash

# Create node cache directory
mkdir -p /opt/node/cache
chmod -r a+rwx /opt/node

# Install Node and npm
dnf module -y enable nodejs:$NODE_VERSION && dnf install -y nodejs

# Set node cache director
npm config set cache /opt/node/cache --global

dnf clean all
