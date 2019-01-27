#!/bin/sh

echo
echo "==========="
echo "Linux Build"
echo "==========="

# Create a zip of XAddonManager  but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
cd ..

echo
echo "x86 32-bit"
echo "----------"

cd Builds\ -\ XAddonManager.xojo_project/Linux/
zip -r ../../XAddonManager-Linux-x86-32.zip XAddonManager
cd ../../

echo
echo "x86 64-bit"
echo "----------"

cd Builds\ -\ XAddonManager.xojo_project/Linux\ 64\ bit/
zip -r ../../XAddonManager-Linux-x86-64.zip XAddonManager
cd ../../

echo
echo "ARM 32-bit"
echo "----------"

cd Builds\ -\ XAddonManager.xojo_project/Linux\ ARM/
zip -r ../../XAddonManager-Linux-ARM-32.zip XAddonManager
cd ../../
