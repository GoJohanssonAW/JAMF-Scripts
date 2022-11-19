#!/bin/sh

# Enables you to use touchID for sudo, must be re-run after each MacOS update.

# Path to auth file
authFile="/etc/pam.d/sudo"

# Clear file
truncate -s0 "$authFile"

# Insert auth content
cat << EOF > "$authFile"
# sudo: auth account password session
auth       sufficient     pam_tid.so
#auth      sufficient     pam_saml.so
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
EOF

exit 0