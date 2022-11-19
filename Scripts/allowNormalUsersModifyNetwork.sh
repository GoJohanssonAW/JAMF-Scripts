#!/bin/sh

# Allow normal users to modify WiFi and network settings.

/usr/bin/security authorizationdb write system.preferences.network allow
/usr/bin/security authorizationdb write system.services.systemconfiguration.network allow

exit 0