#!/bin/sh
CFBundleVersion=""
if [ -f "/Applications/FortiClient.app/Contents/Info.plist" ]; then
    CFBundleVersion=$(defaults read "/Applications/FortiClient.app/Contents/Info.plist" CFBundleShortVersionString)
fi
echo "<result>$CFBundleVersion</result>"
exit 0