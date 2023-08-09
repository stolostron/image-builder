#!/bin/bash

set -e

version="5.0.1.3006"
sonar_file="sonar-scanner-cli-${version}-linux.zip"
sonar_dir="sonar-scanner-${version}-linux"
sonar_url="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/$sonar_file"

# Install dependencies from yum
yum install -y \
    java-17-openjdk-headless \
    zip
yum clean all

# Install sonar scanner
cd /opt
wget --progress=dot:mega "$sonar_url"
unzip "$sonar_file"
rm "$sonar_file"
mv "$sonar_dir" sonar

# Create Sonar Home
mkdir /opt/sonar/.sonar
chmod 777 /opt/sonar/.sonar
