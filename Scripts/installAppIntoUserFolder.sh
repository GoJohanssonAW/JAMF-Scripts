#!/bin/sh

# This script installs an application in the user application folder, useful for apps that need admin rights to
# self-update without the user having admin rights.
# It will check if the folder exists, if not it creates it. Runs JAMF recon to update the inventory and then cleans
# up after itself.


# Usage
# 1. Create a .pkg file containing a app at /tmp, e.g Rectangle.app so "/tmp/Rectangle.app", then upload the package
# to JAMF.
# 2. Create a new policy and include the .pkg, then include the script and fill out $4 as Rectangle.app and $5 as
# true or false depending if you want the app to open after installation.
# 3. Make sure the script is set to run after and not before.

app="$4"
loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
userAppLocation="/Users/$loggedInUser/Applications"
tmpAppPath="/tmp/$app"

echo "Checking if app already exists in appdir..."
if [ -d "/Applications/$app" ]; then
    echo "App exists in appdir, deleting!"
	rm -rf "/Applications/$app"
fi

echo "Checking if user appfolder exists..."
if [ -d "$userAppLocation" ]; then
    echo "User appfolder exists, installing application!"
    mv "$tmpAppPath" "$userAppLocation/"

    echo "Setting user permissions!"
    chown -R "$loggedInUser:wheel" "$userAppLocation"

    echo "Running recon!"
    jamf recon

    if [ "$5" == true ]; then
      echo "Opening application!"
      su "$loggedInUser" -c "open /Users/$loggedInUser/Applications/$app"
    fi

    echo "Deleting app at tmp path!"
    rm -rf "/tmp/$app"

    exit 0

else

    echo "User appfolder does not exist, creating and installing application!"
    mkdir -p "$userAppLocation"
    mv "$tmpAppPath" "$userAppLocation/"

    echo "Setting user permissions!"
    chown -R "$loggedInUser:wheel" "$userAppLocation"

    echo "Running recon!"
    jamf recon

    if [ "$5" == true ]; then
      echo "Opening application!"
      su "$loggedInUser" -c "open /Users/$loggedInUser/Applications/$app"
    fi

    echo "Deleting app at tmp path!"
	  rm -rf "/tmp/$app"

    exit 0
fi