#!/bin/bash

set -e

# Install build harness
base=/opt/build-harness
bh=$base/build-harness
bhe=$base/build-harness-extensions

mkdir -p $base
cd $base

git clone https://github.com/open-cluster-management/build-harness.git
git clone https://github.com/open-cluster-management/build-harness-extensions.git "$bhe"

cp $bhe/templates/Makefile.build-harness-openshift-ci $base
cp $bhe/templates/Makefile.build-harness-openshift-ci $base/Makefile.prow

rm -rf $bh/.git
rm -rf $bhe/.git

chmod -R a+rwx "$base"
