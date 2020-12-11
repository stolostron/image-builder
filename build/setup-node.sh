#!/bin/bash

# Setup Node RPM Repository
curl -sL https://rpm.nodesource.com/setup_$NODE_VERSION.x | bash -

# Install Node and npm
yum install -y nodejs

yum clean all
