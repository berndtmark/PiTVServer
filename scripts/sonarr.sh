#!/bin/bash
source ./settings.conf

if [ "$(sudo docker ps -q -f name=sonarr)" ]; then
    echo "Docker container sonarr already running...updating"
    sudo docker stop sonarr
    sudo docker rm sonarr
    sudo docker pull linuxserver/sonarr:preview
else
    echo "creating directory..."
    mkdir $SONARR_CONFIG && sudo chmod a+rwx -R $SONARR_CONFIG
fi

echo "creating sonarr..."
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

# echo "setting up sonarr config..."
# sudo cp -R $INIT/Sonarr/* $SONARR_CONFIG

echo "starting container..."
sudo docker start sonarr