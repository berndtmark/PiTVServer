#!/bin/bash
source ./settings.conf

echo "creating directory..."
mkdir $SONARR_CONFIG && sudo chmod a+rwx -R $SONARR_CONFIG

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

# echo "init sonarr..."
# sudo docker start sonarr
# sudo docker stop sonarr

# echo "setting up sonarr config..."
# sudo cp -R $INIT/Sonarr/* $SONARR_CONFIG

echo "starting container..."
sudo docker start sonarr