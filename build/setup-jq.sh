#!/bin/bash

set -e

# Install jq command
if [ "$(uname -m)" = "s390x" ]; then
        yum install -y http://download.sinenomine.net/clefos/epel7/s390x/jq-1.6-2.el7.s390x.rpm \
               http://download.sinenomine.net/clefos/epel7/s390x/oniguruma-5.9.5-3.el7.s390x.rpm
elif [ "$(uname -m)" = "x86_64" ];  then
        mkdir -p /opt/jq
        cd /opt/jq
        wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
        chmod +x jq-linux64
        mv jq-linux64 /usr/local/bin/jq
        rm -rf /opt/jq
elif [ "$(uname -m)" = "aarch64" ];  then
        dnf install -y jq
fi
