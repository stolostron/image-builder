#!/bin/bash

set -e

package_location=$1

# Install yarn
cd $package_location
npm install
