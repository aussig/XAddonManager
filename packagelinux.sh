#!/bin/sh

# Create a tarball of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
tar -cf XAddonManager-x.x.x-Linux.tar XAddonManager
gzip XAddonManager-x.x.x-Linux.tar