#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

source ./settings.conf

message() {
    echo "................................................."
    echo "................................................."
    echo "Running Script: $1"
    echo "................................................."
    echo "................................................."
}

date
sudo chmod +x -R ./scripts

message "Global Packages"
./scripts/global-packages.sh

message "Sabnzb"
./scripts/sabnzb.sh

message "Plex"
./scripts/plex.sh

message "Sonarr"
./scripts/sonarr.sh

message "Radarr"
./scripts/radarr.sh

message "Clean up"
./scripts/clean-up.sh