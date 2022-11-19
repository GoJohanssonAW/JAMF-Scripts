#!/bin/sh

# This ext attribute script checks if the JAMF Connect login windows is enabled (authchanger -reset -JamfConnect)
# or not enabled (authchanger -reset).

status=$(security authorizationdb read system.login.console 2>&1)
echo "$status" > "/tmp/loginwindowstatus.txt"
if [ ! -z $(grep "JamfConnectLogin:LoginUI" "/tmp/loginwindowstatus.txt") ]; then
  echo "<result>true</result>"
else
  echo "<result>false</result>"
fi
rm "/tmp/loginwindowstatus.txt"
exit 0