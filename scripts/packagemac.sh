#!/bin/sh

echo
echo "==========="
echo "Mac Build"
echo "==========="

# Create a zip of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

echo
echo "Zipping"
echo "-------"

cd Builds\ -\ XAddonManager.xojo_project/OS\ X\ 64\ bit/
zip -r ../../XAddonManager-Mac.zip XAddonManager.app
cd ../../
