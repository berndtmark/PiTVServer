#!/bin/bash
source ./settings.conf

message() {
    echo "................................................."
    echo "................................................."
    echo "Installing $1"
    echo "................................................."
    echo "................................................."
}

sudo chmod +x -R $SCRIPTS

message "Global Packages"
$SCRIPTS/global-packages.sh

message "Sabnzb"
$SCRIPTS/sabnzb.sh

message "Plex"
$SCRIPTS/plex.sh

message "Sonarr"
$SCRIPTS/sonarr.sh