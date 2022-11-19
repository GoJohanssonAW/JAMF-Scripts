#!/bin/sh

# Adds admin rights on user using the Privileges app (https://github.com/SAP/macOS-enterprise-privileges)

loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
CMD_PREFIX="/usr/bin/sudo -u $loggedInUser"
$CMD_PREFIX /Applications/Privileges.app/Contents/Resources/PrivilegesCLI --add
exit 0