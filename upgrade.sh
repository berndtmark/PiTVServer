#!/bin/bash
source ./settings.conf

echo "stopping containers..."
sudo docker stop plex
sudo docker stop sabnzbd
sudo docker stop sonarr

echo "removing containers..."
sudo docker rm plex
sudo docker rm sabnzbd
sudo docker rm sonarr

echo "pulling containers..."
sudo docker pull linuxserver/plex
sudo docker pull linuxserver/sabnzbd
sudo docker pull linuxserver/sonarr:preview

echo "creating containers..."
sudo docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v $PLEX_CONFIG:/config \
  -v $TV:/data/tvshows \
  -v $MOVIES:/data/movies \
  --restart unless-stopped \
  linuxserver/plex

sudo docker create \
  --name=sabnzbd \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Dublin \
  -p 8080:8080 \
  -v $SABNZB_CONFIG:/config \
  -v $MEDIA:/downloads \
  -v $TEMP:/incomplete-downloads \
  --restart unless-stopped \
  --net=host \
  linuxserver/sabnzbd

sudo docker create \
--name=sonarr \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/Dublin \
-e UMASK_SET=022 `#optional` \
-p 8989:8989 \
-v $SONARR_CONFIG:/config \
-v $TV:/tv \
-v $MEDIA:/downloads \
--restart unless-stopped \
linuxserver/sonarr:preview

echo "starting containers..."
sudo docker start plex
sudo docker start sabnzbd
sudo docker start sonarr