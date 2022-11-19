#!/bin/sh

# Checks BeyondTrust version.

if [ -f /Applications/.com.bomgar.scc.*/Remote\ Support\ Customer\ Client.app/Contents/Info.plist ]; then
version=$(/usr/libexec/PlistBuddy -c 'Print CFBundleVersion' /Applications/.com.bomgar.scc.*/Remote\ Support\ Customer\ Client.app/Contents/Info.plist)
echo "<result>$version</result>"
else
echo "<result>false</result>"
fi