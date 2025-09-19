#!/bin/bash

set -e

SONAR_VERSION="7.2.0.5079"

sonar_file="sonar-scanner-cli-${SONAR_VERSION}-linux-x64.zip"
sonar_dir="sonar-scanner-${SONAR_VERSION}-linux-x64"
sonar_url="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${sonar_file}"

# Install dependencies from yum
yum install -y \
    java-17-openjdk-headless \
    zip
yum clean all

# Install sonar scanner
cd /opt
wget --progress=dot:mega "${sonar_url}"
unzip "${sonar_file}"
rm "${sonar_file}"
mv "${sonar_dir}" sonar

# Create Sonar Home
mkdir /opt/sonar/.sonar
chmod 777 /opt/sonar/.sonar
