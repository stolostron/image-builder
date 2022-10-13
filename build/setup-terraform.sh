#!/bin/bash

set -e

if [[ "$ARCH" == "aarch64" ]]; then
    # Necessary workaround on ARM until this issue is resolved: https://github.com/hashicorp/terraform/issues/32008

    # Pull the latest terraform version from the file list at https://releases.hashicorp.com/terraform by selecting all versions, sorting, and selecting the latest/last.   
    LATEST_TF_VERSION=$(curl -X GET "https://releases.hashicorp.com/terraform" | sed -rn "s/.*terraform_([0-9]+\.[0-9]+\.[0-9]+).*/\1/p" | sort | tail -n 1)

    # Pull and extract terraform at the target version in /usr/local/bin
    cd /usr/local/bin
    wget "https://releases.hashicorp.com/terraform/${LATEST_TF_VERSION}/terraform_${LATEST_TF_VERSION}_linux_arm64.zip"
    unzip terraform_${LATEST_TF_VERSION}_linux_arm64.zip
    chmod +x terraform
    rm -f terraform_${LATEST_TF_VERSION}_linux_arm64.zip
else
    # Folowing the documentation for RHEL/CentOS here - https://www.terraform.io/downloads

    # Add HashiCorp repo
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

    # Install terraform
    yum install -y terraform

    yum clean all
fi
