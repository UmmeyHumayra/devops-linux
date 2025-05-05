#!/bin/bash

declare -A user_roles
user_roles=(
    ["Tanjiro"]="admin"
    ["Nezuko"]="developer"
    ["Mitsuri"]="guest"
)

echo "Tanjiro's role: ${user_roles["Tanjiro"]}"
echo "All users: ${!user_roles[@]}"
echo "All roles: ${user_roles[@]}"
