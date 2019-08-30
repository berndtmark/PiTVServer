#!/bin/bash
source ../settings.conf

echo "creating directory..."
mkdir $PLEX_CONFIG && sudo chmod +x -R $PLEX_CONFIG

echo "creating plex..."
# id -> gets PUID & PGID
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

echo "init plex containers..."
sudo docker start plex
sudo docker stop plex

# echo "setting up plex config..."
# sudo cp -R $INIT/Plex/* "$PLEX_CONFIG/Library/Application Support/Plex Media Server"

echo "starting container..."
sudo docker start plex