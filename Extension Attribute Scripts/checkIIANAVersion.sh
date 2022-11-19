#!/bin/sh

# Checks if IIANA video player is installed and what version
CFBundleVersion=""
if [ -f "/Applications/IINA.app/Contents/Info.plist" ]; then
    CFBundleVersion=$(defaults read "/Applications/IINA.app/Contents/Info.plist" CFBundleShortVersionString)
    echo "<result>$CFBundleVersion</result>"
else
    echo "<result>Not installed</result>"
fi

exit 0