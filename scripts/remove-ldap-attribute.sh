#!/bin/bash

LDAP_URI="ldap://localhost"
BASE_DN="dc=example,dc=com"
BIND_DN="cn=admin,dc=example,dc=com"
BIND_PW="your_password"

# Replace this with your actual list of usernames
USERNAMES=("user.0" "user.1" "user.2")

for username in "${USERNAMES[@]}"; do
    # Get the full DN of the user
    USER_DN=$(ldapsearch -x -H "$LDAP_URI" -D "$BIND_DN" -w "$BIND_PW" -b "$BASE_DN" "(uid=$username)" dn | grep "^dn:" | sed 's/^dn: //')
    
    if [ -z "$USER_DN" ]; then
        echo "User $username not found."
        continue
    fi

    echo "Removing 'XXX' attribute from $USER_DN..."

    # Create temporary LDIF to remove the attribute
    cat <<EOF | ldapmodify -x -H "$LDAP_URI" -D "$BIND_DN" -w "$BIND_PW"
dn: $USER_DN
changetype: modify
delete: XXX attribute
EOF
