#!/bin/sh

# Check if Rosetta2 is installed.

arch=$(/usr/bin/arch)
if [ "$arch" == "arm64" ]; then # is rosetta 2 installed?
    arch -x86_64 /usr/bin/true 2> /dev/null
    if [ $? -eq 1 ];
        then result="false"
    else result="true"
    fi
else result="ineligible"
fi
echo "<result>$result</result>"