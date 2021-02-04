#!/bin/bash

# Install dependencies from yum
yum install -y \
    java-11-openjdk-headless \
    zip
yum clean all

# Install sonar scanner
cd /opt
wget --progress=dot:mega https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
rm sonar-scanner-cli-4.2.0.1873-linux.zip
mv sonar-scanner-4.2.0.1873-linux sonar

# Create Sonar Home
mkdir /opt/sonar/.sonar
chmod 777 /opt/sonar/.sonar
