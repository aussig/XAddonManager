#!/bin/sh

# Create a tarball of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
VERSION=3.0.0

echo ''
echo 'Building Linux Package '$VERSION
echo '======================================'

cd 'Builds - XAddonManager.rbvcp/Linux'

tar -czf XAddonManager-$VERSION-Linux.tgz XAddonManager
mv XAddonManager-$VERSION-Linux.tgz ../../XAddonManager-$VERSION-Linux.tgz
