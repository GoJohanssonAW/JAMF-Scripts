#!/bin/sh

# This ext attribute script checks if the JAMF Connect login windows is enabled (authchanger -reset -JamfConnect)
# or not enabled (authchanger -reset).

dbStatus=$(security authorizationdb read system.login.console 2>&1)
status=$(echo "$dbStatus" 2>&1 | grep "JamfConnectLogin:LoginUI")
if [ ! -z "$status" ]; then
  echo "<result>true</result>"
else
  echo "<result>false</result>"
fi
exit 0