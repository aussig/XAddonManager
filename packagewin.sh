#!/bin/sh

# Create a zip of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
VERSION=2.0.0

echo ''
echo 'Building Windows Package '$VERSION
echo '======================================'

cd 'Builds - XAddonManager.rbvcp/Windows'

zip -r XAddonManager-$VERSION-Windows.zip XAddonManager
mv XAddonManager-$VERSION-Windows.zip ../../XAddonManager-$VERSION-Windows.zip
