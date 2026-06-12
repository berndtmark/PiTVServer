#!/bin/bash

source ./.env

directories=(
    "$RADARR_CONFIG"
    "$SABNZB_CONFIG"
    "$SONARR_CONFIG"
    "$JELLYFIN_CONFIG"
)

for dir in "${directories[@]}"; do
    if [ -n "$dir" ]; then
        if [ -d "$dir" ]; then
            echo "Directory $dir already exists."
        else
            echo "Creating directory $dir..."
            mkdir -p "$dir"
        fi
        # Ensure permissions are set regardless of if it was just created
        sudo chmod a+rwx -R "$dir"
    fi
done