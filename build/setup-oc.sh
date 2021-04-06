#!/bin/bash

set -e

# Install kubectl and oc

if [ "$(uname -m)" = "s390x" ]; then
        url="http://mirror.openshift.com/pub/openshift-v4/s390x/clients/ocp/latest/openshift-client-linux.tar.gz"
elif [ "$(uname -m)" = "x86_64" ];  then
        url="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz"
fi
cd /usr/local/bin
curl -sL "$url" | tar -zx
