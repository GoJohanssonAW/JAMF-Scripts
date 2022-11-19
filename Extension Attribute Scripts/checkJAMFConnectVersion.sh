#!/bin/sh

# Checks version of JAMF Connect

CFBundleVersion=""
if [ -f "/Applications/Jamf Connect.app/Contents/Info.plist" ]; then
    CFBundleVersion=$(defaults read "/Applications/Jamf Connect.app/Contents/Info.plist" CFBundleShortVersionString)
fi
echo "<result>$CFBundleVersion</result>"
exit 0