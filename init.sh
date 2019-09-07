#!/bin/bash
source ./settings.conf

echo "allow sub scripts to be executable..."
sudo chmod +x -R $SCRIPTS

echo "execute..."
$SCRIPTS/global-packages.sh
$SCRIPTS/sabnzb.sh
$SCRIPTS/plex.sh
#$SCRIPTS/sickbeard.sh
$SCRIPTS/sonarr.sh