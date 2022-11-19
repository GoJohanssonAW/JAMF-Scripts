#!/bin/sh
CFBundleVersion=""
if [ -f "/Applications/Google Chrome.app/Contents/Info.plist" ]; then
    CFBundleVersion=$(defaults read "/Applications/Google Chrome.app/Contents/Info.plist" CFBundleShortVersionString)
fi
echo "<result>$CFBundleVersion</result>"
exit 0