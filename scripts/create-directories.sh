#!/bin/bash

source ./.env

#Radarr
if [ "$(sudo docker ps -q -f name=radarr)" ]; then
    echo "Radarr directory exists"
else
    echo "creating directory for Radarr..."
    mkdir $RADARR_CONFIG && sudo chmod a+rwx -R $RADARR_CONFIG
fi

#Sabnzb
if [ "$(sudo docker ps -q -f name=sabnzbd)" ]; then
    echo "Sabnzb directory exists"
else
    echo "creating directory for Sabnzb..."
    mkdir $SABNZB_CONFIG && sudo chmod a+rwx -R $SABNZB_CONFIG
fi

#Sonarr
if [ "$(sudo docker ps -q -f name=sonarr)" ]; then
    echo "Sonarr directory exists"
else
    echo "creating directory for Sonarr..."
    mkdir $SONARR_CONFIG && sudo chmod a+rwx -R $SONARR_CONFIG
fi

#Jellyfin
if [ "$(sudo docker ps -q -f name=jellyfin)" ]; then
    echo "Jellyfin directory exists"
else
    echo "creating directory for Jellyfin..."
    mkdir $JELLYFIN_CONFIG && sudo chmod a+rwx -R $JELLYFIN_CONFIG
fi