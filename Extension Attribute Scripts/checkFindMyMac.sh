#!/bin/sh

# Checks if Find My Mac is enabled

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep fmm-mobileme-token-FMM)

if [ -z "$fmmToken" ];
then echo "<result>Disabled</result>"
else echo "<result>Enabled</result>"
fi