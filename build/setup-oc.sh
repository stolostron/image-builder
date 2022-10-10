#!/bin/bash

set -e

# Install kubectl and oc
url="https://mirror.openshift.com/pub/openshift-v4/$(uname -m)/clients/ocp/latest/openshift-client-linux.tar.gz"
cd /usr/local/bin
curl -sL "$url" | tar -zx
