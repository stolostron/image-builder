#!/bin/bash

# Install Node and npm
dnf module -y enable nodejs:$NODE_VERSION && dnf install -y nodejs

dnf clean all
