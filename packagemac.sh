#!/bin/sh

# Create a zip of XAddonManager but exclude resource forks
# Mac OS 10.4 and earlier: export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
VERSION=2.0.0

echo ''
echo 'Building Mac Package '$VERSION
echo '======================================'

cd 'Builds - XAddonManager.rbvcp/Mac OS X (Intel)'

# Code signing
/usr/libexec/PlistBuddy -c "Delete :CFBundleIdentifier" XAddonManager.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Delete :NSHumanReadableCopyright" XAddonManager.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Delete :LSApplicationCategoryType" XAddonManager.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string 'com.AustinGoudge.XAddonManager'" XAddonManager.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :NSHumanReadableCopyright string '© 2012, Austin Goudge'" XAddonManager.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Add :LSApplicationCategoryType string 'public.app-category.simulation-games'" XAddonManager.app/Contents/Info.plist
codesign --signature-size 6400 -f -v -s 'Austin Goudge' XAddonManager.app

zip -r XAddonManager-$VERSION-Mac.zip XAddonManager.app
mv XAddonManager-$VERSION-Mac.zip ../../XAddonManager-$VERSION-Mac.zip
