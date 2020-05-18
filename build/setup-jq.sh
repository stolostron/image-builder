#!/bin/bash

# Install jq command
mkdir -p /opt/jq
cd /opt/jq
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x jq-linux64
mv jq-linux64 /usr/local/bin
rm -rf /opt/jq
