#!/bin/bash

# Install build harness
mkdir -p /build-harness
cd /build-harness
git clone https://github.com/cloudposse/build-harness.git
git clone https://github.com/open-cluster-management/build-harness-extensions.git
rm -rf build-harness/.git
rm -rf build-harness-extensions/.git
