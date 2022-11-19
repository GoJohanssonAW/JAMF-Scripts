#!/bin/sh

# Checks TeamViewer Host version.

if [ -f "/Applications/TeamViewerHost.app/Contents/Info.plist" ]; then
version=$(/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' "/Applications/TeamViewerHost.app/Contents/Info.plist")
echo "<result>$version</result>"
else
echo "<result>false</result>"
fi