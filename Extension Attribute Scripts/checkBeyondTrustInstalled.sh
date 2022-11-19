#!/bin/sh

# Check if BeyondTrust is installed.

if [ -f /Applications/.com.bomgar.scc.*/Remote\ Support\ Customer\ Client.app/Contents/Info.plist ]; then
echo "<result>true</result>"
else
echo "<result>false</result>"
fi