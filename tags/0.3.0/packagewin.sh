#!/bin/sh

# Create a zip of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
zip -r XAddonManager\ Windows.zip XAddonManager
