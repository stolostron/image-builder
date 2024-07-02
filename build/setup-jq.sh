#!/bin/bash

set -e

# Install jq command
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    ARCH="arm64"
fi

case "${ARCH}" in
        s390x)
                yum install -y http://download.sinenomine.net/clefos/epel7/s390x/jq-1.6-2.el7.s390x.rpm \
                        http://download.sinenomine.net/clefos/epel7/s390x/oniguruma-5.9.5-3.el7.s390x.rpm
        ;;
        arm64)
                dnf install -y jq
        ;;
        *)
                VERSION="1.7.1"
                wget "https://github.com/jqlang/jq/releases/download/jq-${VERSION}/jq-linux-${ARCH}" -O /usr/bin/jq
                chmod +x /usr/bin/jq
        ;;
esac
