#!/bin/sh

# Checks if TeamViewer Host is installed.

if [ -f "/Applications/TeamViewerHost.app/Contents/Info.plist" ]; then
echo "<result>true</result>"
else
echo "<result>false</result>"
fi