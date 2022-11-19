#!/bin/sh

# Check Xink version

CFBundleVersion=""
if [ -f "/Applications/zoom.us.app/Contents/Info.plist" ]; then
    CFBundleVersion=$(defaults read "/Applications/Xink.app/Contents/Info.plist" CFBundleVersion)
fi
echo "<result>$CFBundleVersion</result>"
exit 0