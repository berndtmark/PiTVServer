#!/bin/bash

source ./.env

# Plex
if [ "$(sudo docker ps -q -f name=plex)" ]; then
    echo "Plex directory exists"
else
    echo "creating directory for Plex..."
    mkdir $PLEX_CONFIG && sudo chmod a+rwx -R $PLEX_CONFIG
fi

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

#Tautulli
if [ "$(sudo docker ps -q -f name=tautulli)" ]; then
    echo "Tautulli directory exists"
else
    echo "creating directory for Tautulli..."
    mkdir $TAUTULLI_CONFIG && sudo chmod a+rwx -R $TAUTULLI_CONFIG
fi