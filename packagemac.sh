#!/bin/sh

# Create a zip of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
VERSION=2.0.0b1

echo ''
echo 'Building Mac Package '$VERSION
echo '======================================'

cd 'Builds - XAddonManager.rbvcp/Mac OS X (Universal)'

zip -r XAddonManager-$VERSION-Mac.zip XAddonManager.app
mv XAddonManager-$VERSION-Mac.zip ../../XAddonManager-$VERSION-Mac.zip
