#!/bin/bash

# Install dependencies from yum
yum install -y gcc
yum clean all

# Install tree command
mkdir -p /opt/tree
cd /opt/tree
wget http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz
tar xf tree-1.8.0.tgz
cd /opt/tree/tree-1.8.0
make
make install
rm -rf /opt/tree
