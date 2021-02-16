#!/bin/bash

# Setup Node RPM Repository
dnf module -y enable nodejs:$NODE_VERSION

# Install Node and npm
dnf install -y nodejs

npm install --global yarn@$YARN_VERSION

dnf clean
