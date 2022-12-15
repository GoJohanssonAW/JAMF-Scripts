#!/bin/sh

wservice=`/usr/sbin/networksetup -listallnetworkservices | grep -Ei '(Wi-Fi|AirPort)'`
device=`/usr/sbin/networksetup -listallhardwareports | awk "/$wservice/,/Ethernet Address/" | awk 'NR==2' | cut -d " " -f 2`
PreferredNetworks=$(networksetup -listpreferredwirelessnetworks "$device")
echo "<result>$PreferredNetworks</result>"
exit 0