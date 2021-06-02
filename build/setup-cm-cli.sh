#!/bin/bash

set -e

# Install cm-cli plugin
cd /opt
git clone https://github.com/open-cluster-management/cm-cli.git
cd cm-cli
make plugin
cd /
rm -rf /opt/cm-cli
