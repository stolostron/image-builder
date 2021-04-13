#!/bin/bash

set -e

# Add HashiCorp repo
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# Install terraform
yum install -y terraform

yum clean all
