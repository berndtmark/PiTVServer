#!/bin/bash
source ./settings.conf

if [ "$(sudo docker ps -q -f name=radarr)" ]; then
    echo "Docker container radarr already running...updating"
    sudo docker stop radarr
    sudo docker rm radarr
    sudo docker pull linuxserver/radarr
else
    echo "creating directory..."
    mkdir $RADARR_CONFIG && sudo chmod a+rwx -R $RADARR_CONFIG
fi

echo "creating radarr..."
sudo docker create \
--name=radarr \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/Dublin \
-e UMASK_SET=022 \
-p 7878:7878 \
-v $RADARR_CONFIG:/config \
-v $MOVIES:/movies \
-v $MEDIA:/downloads \
--restart unless-stopped \
linuxserver/radarr

# echo "setting up radarr config..."
# sudo cp -R $INIT/Radarr/* $RADARR_CONFIG

echo "starting container..."
sudo docker start radarr
