#!/bin/bash

# Creates needed folders for Teams backgrounds, then downloads and unzips the images into the directory.
# Change $downloadUrl to a URL with a .zip containing your Team backgrounds.
# Remember that each background needs a file named XXX_thumb.ext or else Teams wont pick it up

loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
downloadUrl=""
backgroundPath="/Users/$loggedInUser/Library/Application Support/Microsoft/Teams/Backgrounds/Uploads"

if [ -d "$backgroundPath" ]
then
    #Path exists
    echo "Path exists, skipping folder creation..."
else
    #Path does not exist
    echo "Path does not exist, creating folders..."
    mkdir "/Users/$loggedInUser/Library/Application Support/Microsoft/Teams/Backgrounds"
    mkdir "$backgroundPath"
fi

#Remove existing images
echo "Removing existing images..."
rm -rf "$backgroundPath/*.jpg"
rm -rf "$backgroundPath/*.png"

#Download images
echo "Downloading images..."
curl "$downloadUrl" -o "$backgroundPath/images.zip"

#Unzip Images
echo "Unzipping images..."
unzip -o "$backgroundPath/images.zip" -d "$backgroundPath"

#Remove zip
echo "Removing zip..."
rm -rf "$backgroundPath/images.zip"

#Setting file permissions
echo "Setting file permissions..."
chown -R "$loggedInUser":staff "$backgroundPath"

echo "Done!"
exit 0