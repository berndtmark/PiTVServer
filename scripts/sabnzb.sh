#!/bin/bash
source ./settings.conf

echo "creating directory..."
mkdir $SABNZB_CONFIG && sudo chmod a+rwx -R $SABNZB_CONFIG

echo "creating sabnzb..."
# id -> gets PUID & PGID
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

# echo "init sabnzbd..."
# sudo docker start sabnzbd
# sudo docker stop sabnzbd

# echo "setting up sabnzbd config..."
# sudo cp -R $INIT/Sabnzb/* $SABNZB_CONFIG

echo "starting container..."
sudo docker start sabnzbd