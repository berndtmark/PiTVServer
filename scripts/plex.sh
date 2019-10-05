#!/bin/bash
source ./settings.conf

if [ ! "$(sudo docker ps -q -f name=plex)" ]; then
    echo "Docker container already running...updating"
    sudo docker stop plex
    sudo docker rm plex
    sudo docker pull linuxserver/plex
else
    echo "creating directory..."
    mkdir $PLEX_CONFIG && sudo chmod a+rwx -R $PLEX_CONFIG
fi

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

# echo "setting up plex config..."
# sudo cp -R $INIT/Plex/* $PLEX_CONFIG

echo "starting container..."
sudo docker start plex