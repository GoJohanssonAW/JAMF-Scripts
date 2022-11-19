#!/bin/sh

# Allow normal users to modify time and date settings.


security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.datetime allow
exit 0