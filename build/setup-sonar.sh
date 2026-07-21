#!/bin/bash

set -e

# https://docs.sonarsource.com/sonarqube-server/analyzing-source-code/scanners/sonarscanner
SONAR_VERSION="8.0.1.6346"

sonar_file="sonar-scanner-cli-${SONAR_VERSION}-linux-x64.zip"
sonar_dir="sonar-scanner-${SONAR_VERSION}-linux-x64"
sonar_url="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${sonar_file}"

# Install dependencies from yum
yum install -y \
    java-21-openjdk-headless \
    zip
yum clean all

# Install sonar scanner
cd /opt
wget --progress=dot:giga "${sonar_url}"
unzip "${sonar_file}"
rm "${sonar_file}"
mv "${sonar_dir}" sonar

# Create Sonar Home
mkdir /opt/sonar/.sonar
chmod 777 /opt/sonar/.sonar
