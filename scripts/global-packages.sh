#!/bin/bash

echo "installing docker..."
if [ -x "$(command -v docker)" ]; then
    echo "Docker already installed!"
else
    curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
fi

echo "installing docker compose..."
if [ "$(docker compose version)" ]; then
    echo "Docker compose already installed!"
else
    sudo apt-get install docker-compose-plugin
fi
